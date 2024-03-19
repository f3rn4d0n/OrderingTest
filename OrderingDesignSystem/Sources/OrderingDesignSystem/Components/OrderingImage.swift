//
//  OrderingImage.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

public struct OrderingImage: View {
    
    let imageURL: String?
    
    public init(imageURL: String? = nil) {
        self.imageURL = imageURL
    }
    
    public var body: some View {
        if let urlString = imageURL {
            AsyncImage(url: URL(string: urlString), scale: 3) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure(let imageError):
                    missingImage
                        .onAppear{
                            print("for \(urlString) error:\(imageError.localizedDescription)")
                        }
                @unknown default:
                    missingImage
                }
            }
        } else {
            missingImage
        }
    }
    
    private var missingImage: some View {
        return Image(systemName: "person.crop.circle.badge.questionmark.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

#Preview {
    OrderingImage(imageURL: "https://s3.amazonaws.com/ordering-images2/res/ordering/image/upload/ak4o8bfgxcpoue0fx1xa/1534196961.jpg")
}
