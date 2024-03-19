//
//  OrderingImage.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI
import CachedAsyncImage

public struct OrderingImage: View {
    
    let imageURL: String?
    
    public init(imageURL: String? = nil) {
        self.imageURL = imageURL
    }
    
    public var body: some View {
        if let urlString = imageURL, let url = URL(string: urlString) {
            CachedAsyncImage(url: url, urlCache: .imageCache, scale: 3) { phase in
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
        return Image(systemName: "storefront.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

#Preview {
    OrderingImage(imageURL: "https://s3.amazonaws.com/ordering-images2/res/ordering/image/upload/ak4o8bfgxcpoue0fx1xa/1534196961.jpg")
}

#Preview {
    OrderingImage(imageURL: "https://res.cloudinary.com/ordering2/image/upload/f_auto,q_auto,h_200,c_limit/v1539095959/crya6ibldlsz4hjyo03e.jpg")
}
