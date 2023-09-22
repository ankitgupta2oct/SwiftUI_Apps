//
//  CustomCircleView.swift
//  Hike
//
//  Created by apple on 21/09/23.
//

import SwiftUI

struct CustomCircleView: View {
    @State var isGradientAnimating = false
    var body: some View {
        Circle()
            .fill(
                LinearGradient(colors: [
                    Color.theme.indigoMedium,
                    Color.theme.samonLight
                ],
               startPoint: isGradientAnimating ? .topLeading : .bottomLeading,
               endPoint: isGradientAnimating ? .bottomTrailing : .topTrailing)
            )
            .frame(width: 256, height: 256)
            .overlay(content: {
                MotionAnimationView()
            })
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    isGradientAnimating = true
                }
            }
    }
}

#Preview {
    CustomCircleView()
}
