//
//  MotionAnimationView.swift
//  Hike
//
//  Created by apple on 21/09/23.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State var circleCount: Int = Int.random(in: 6...12)
    @State var isAnimating = false
    
    var body: some View {
        ZStack {
            ForEach(0...circleCount, id: \.self) { _ in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(), y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
            }
        }
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
        .onAppear{
            withAnimation(
                .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            ) {
                isAnimating = true
            }
        }
    }
    
    private func randomCircleCount() {
        circleCount = Int.random(in: 1...6)
    }
    
    private func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    private func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...50)
    }
    
    private func randomScale() -> CGFloat {
        return CGFloat.random(in: 1...2)
    }
    
    private func randomSpeed() -> CGFloat {
        return CGFloat.random(in: 0.25...1)
    }
    
    private func randomDelay() -> CGFloat {
        return CGFloat.random(in: 0...2)
    }
}

#Preview {
    MotionAnimationView()
      .background(
        Circle()
          .fill(.teal)
      )
}
