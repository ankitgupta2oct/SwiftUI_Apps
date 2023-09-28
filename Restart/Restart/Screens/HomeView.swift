//
//  HomeView.swift
//  Restart
//
//  Created by apple on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboadingCompleted: Bool = true
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            //MARK: - Header
            ZStack {
                CircleGroupView(CircleColor: .gray, CircleOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 3).repeatForever(), value: isAnimating)
            }
            
            //MARK: - Center
            Text("The time that leads to mastery is dependent on the intesity of ou focus.")
                .multilineTextAlignment(.center)
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
            Spacer()
            
            //MARK: - Footer
            Button(action: {
                withAnimation{
                    playSound(fileName: "success", type: "m4a")
                    isOnboadingCompleted = false
                }
            }, label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .padding()
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    HomeView()
}
