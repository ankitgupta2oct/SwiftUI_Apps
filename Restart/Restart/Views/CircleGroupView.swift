//
//  CircleGroupView.swift
//  Restart
//
//  Created by apple on 25/09/23.
//

import SwiftUI

struct CircleGroupView: View {
    @State var CircleColor: Color
    @State var CircleOpacity: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(CircleColor.opacity(CircleOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Circle()
                .stroke(CircleColor.opacity(CircleOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .opacity(isAnimating ? 1 : 0)
        .blur(radius: isAnimating ? 0 : 10)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeInOut(duration: 0.5), value: isAnimating)
        .onAppear{
            isAnimating = true
        }
    }
}

#Preview {
    ZStack{
        Color.colorBlue
            .ignoresSafeArea()

        CircleGroupView(CircleColor: .white, CircleOpacity: 0.2)
    }
}
