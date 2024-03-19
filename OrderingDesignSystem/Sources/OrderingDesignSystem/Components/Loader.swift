//
//  SwiftUIView.swift
//  OrderingDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 18/03/24.
//

import SwiftUI

public struct Loader: View {
    
    @Binding var isLoading: Bool
    @State private var isAnimating = false
    
    public init(isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }
    
    public var body: some View {
        if isLoading {
            ZStack {
                Text("Loading")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .offset(x: 0, y: -25)
                
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 250, height: 3)
                
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.green, lineWidth: 3)
                    .frame(width: 30, height: 3)
                    .offset(x: isAnimating ? 110 : -110, y: 0)
                    .onAppear() {
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                            self.isAnimating = true
                        }
                    }
            }
        }
    }
}


#Preview {
    Loader(isLoading: .constant(true))
}
