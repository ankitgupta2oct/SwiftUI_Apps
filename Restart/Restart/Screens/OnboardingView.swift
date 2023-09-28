//
//  OnboardingView.swift
//  Restart
//
//  Created by apple on 22/09/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboadingCompleted: Bool = false
    
    @State private var bottonControlWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var isImageMoving: Bool = false
    
    var body: some View {
        ZStack {
            Color.colorBlue
                .ignoresSafeArea()
            
            VStack {
                //MARK: - Header
                VStack(spacing: 0) {
                    Text(imageOffset == .zero ? "Share." : "Give.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .transition(.opacity)
                    
                    Text("""
                    It's not how much we are give
                    but how much love we put into giving
                    """)
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                } //: VStack
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -50)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                //MARK: - Center
                ZStack{
                    CircleGroupView(CircleColor: .white, CircleOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 0.5), value: imageOffset)
                                        
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width)
                        .animation(.easeOut(duration: 0.5), value: imageOffset)
                        .rotationEffect(.init(degrees: imageOffset.width / 20))
                        .gesture(
                            DragGesture()
                                .onChanged{ value in
                                    if(imageOffset.width) <= 150 {
                                        imageOffset = value.translation
                                    }
                                }
                                .onEnded({ _ in
                                    imageOffset = .zero
                                })
                        )
                } //: ZStack
                .overlay(alignment: .bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 50, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 10)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeIn(duration: 0.5).delay(1), value: isAnimating)
                        .opacity(imageOffset == .zero ? 1 : 0)
                        .animation(.easeIn(duration: 0.2), value: imageOffset)
                        
                }
                
                //MARK: - Footer
                ZStack{
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // Capsule
                    HStack{
                        Capsule()
                            .fill(Color.colorRed)
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // Indicator Circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color.colorRed)
                            Circle()
                                .fill(Color.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundStyle(.white)
                        }
                        Spacer()
                    }
                    .offset(x: buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                if (value.translation.width > 0 && buttonOffset <= bottonControlWidth - 80) {
                                    buttonOffset = value.translation.width
                                }
                            })
                            .onEnded({ value in
                                if(buttonOffset >= (bottonControlWidth - 80) / 2) {
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        isOnboadingCompleted = true
                                        playSound(fileName: "chimeup", type: "mp3")
                                    }
                                }
                                else {
                                    buttonOffset = 0
                                }
                            })
                    )
                }
                .frame(width: bottonControlWidth, height: 80)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 50)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }
        }
        .onAppear{
            isAnimating = true
        }
    }
}

#Preview {
    OnboardingView()
}
