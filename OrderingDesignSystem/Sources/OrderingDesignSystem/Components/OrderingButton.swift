//
//  OrderingButton.swift
//
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

struct OrderingButton: View {
    
    var icon: Image?
    var message: String
    var action: (() async -> Void)?

    public init(icon: Image? = nil, message: String, action:  (() async -> Void)? = nil) {
        self.icon = icon
        self.message = message
        self.action = action
    }

    public var body: some View {
        Button(action: {
            Task {
                await self.action?()
            }
        }, label: {
            HStack {
                Spacer()
                icon?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.white)
                    .frame(width: 12, height: 12)
                Text(message)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(.caption)
                Spacer()
            }
            .padding(12)
            .foregroundColor(Color.white)
            .background(Color.black)
            .clipShape(.rect(cornerRadius: 6))
        })
    }
}

#Preview {
    OrderingButton(message: "Click to execute")
}
