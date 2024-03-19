//
//  NetworkServiceType.swift
//  OrderingData
//
//  Created by Luis Fernando Bustos Ramírez on 15/03/24.
//

import Foundation

public protocol NetworkServiceType {
    func request<T: Decodable>(target: NetworkTargetType) async throws -> T
}

public struct RequestNetworkProvider: NetworkServiceType {
    private let urlSession: URLSession

    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    private func handleResponse(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidStatus(code: httpResponse.statusCode)
        }
    }

    private func makeUrlRequest(with target: NetworkTargetType) throws -> URLRequest {
        guard let baseURL = URL(string: target.baseURL + target.path) else {
            throw NetworkError.invalidURL
        }
        let url = baseURL.appending(queryItems: target.queryParams ?? .init())
        var request = URLRequest(url: url)
        request.timeoutInterval = TimeInterval(floatLiteral: target.timeOut)
        request.httpMethod = target.method.rawValue
        return request
    }

    public func request<T: Decodable>(target: NetworkTargetType) async throws -> T {
        let request = try self.makeUrlRequest(with: target)
        let (data, response) = try await urlSession.data(for: request)
        try handleResponse(data: data, response: response)
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.dataConversionFailure(error: error.localizedDescription)
        }
    }
}
