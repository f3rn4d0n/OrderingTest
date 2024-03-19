//
//  ErrorAlert.swift
//  OrderingDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

public struct ErrorAlert: View {
    
    var error: ErrorDetail

    public init(error: ErrorDetail) {
        self.error = error
    }

    public var body: some View {
        ZStack {
            Color.gray
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.white)
                    .padding()
                Text(error.title)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundStyle(Color.white)
                Text(error.detail)
                    .lineLimit(8)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .padding(.top, 2)
                OrderingButton(
                    icon: nil,
                    message: error.firstAction.title,
                    action: error.firstAction.action
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
            .background(Color.gray)
            .clipShape(.rect(cornerRadius: 24))
            .padding()
        }
    }
}

#Preview {
    ErrorAlert(
        error: .init(
            title: "Error",
            detail: "Motive",
            firstAction: ErrorDetailAction(title: "Cancel")
        )
    )
}
