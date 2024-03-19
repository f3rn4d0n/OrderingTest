//
//  ContentUnavailable.swift
//  OrderingDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

public struct ContentUnavailable: View {
    
    let title: String
    let systemImage: String
    let actionMessage: String
    var action: (() async -> Void)?
    
    public init(title: String, systemImage: String, actionMessage: String, action: (() async -> Void)? = nil) {
        self.title = title
        self.systemImage = systemImage
        self.actionMessage = actionMessage
        self.action = action
    }
    
    public var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView {
                Label(title, systemImage: systemImage)
            } description: {
                Button {
                    Task {
                        await self.action?()
                    }
                } label: {
                    Text(actionMessage)
                }
            }
        } else {
            VStack {
                Image(systemName: systemImage)
                    .padding()
                Text(title)
                    .padding()
                Button {
                    Task {
                        await self.action?()
                    }
                } label: {
                    Text(actionMessage)
                }
            }
        }
    }
}

#Preview {
    ContentUnavailable(
        title: "Error",
        systemImage: "eyeglasses",
        actionMessage: "Reload data")
}
