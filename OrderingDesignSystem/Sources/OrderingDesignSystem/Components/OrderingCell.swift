//
//  OrderingCell.swift
//  OrderingDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

public struct OrderingCell: View {
    
    let title:String
    let detail: String
    let backgroundImage: String?
    let imageURL: String?
    var action: (() -> Void)?
    
    public init(title: String, detail: String, backgroundImage: String? = nil, imageURL: String? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.detail = detail
        self.backgroundImage = backgroundImage
        self.imageURL = imageURL
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            self.action?()
        }, label: {
            ZStack {
                if let image = backgroundImage {
                    OrderingImage(imageURL: image)
                }
                HStack {
                    VStack {
                        HStack {
                            Text(title)
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1)
                            Spacer()
                        }
                        .padding(.bottom)
                        HStack {
                            Text(detail)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .font(.callout)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1)
                            Spacer()
                        }
                    }
                    VStack {
                        if let image = imageURL {
                            OrderingImage(imageURL: image)
                                .frame(height: 80)
                                .clipShape(.rect(cornerRadius: 40)
                                )
                        }
                    }
                    .frame(
                        width: 80
                    )
                    .padding(.leading)
                }
                .padding()
                .background(
                    backgroundImage != nil ? Color.clear : Color.white
            )
            }
        })
        .listRowSeparator(.hidden)
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    OrderingCell(
        title: "Grilled",
        detail: "Today 9:00 - 23:00",
        backgroundImage: "https://s3.amazonaws.com/ordering-images2/res/ordering/image/upload/mxzcovsduk3aowyom3nn/1534196893.jpg",
        imageURL: "https://s3.amazonaws.com/ordering-images2/res/ordering/image/upload/kuuhl9kxuxmqnfld1utc/1534196904.jpg"
    )
}
