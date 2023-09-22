//
//  CardView.swift
//  Hike
//
//  Created by apple on 20/09/23.
//

import SwiftUI

struct CardView: View {
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var shouldSettingView = false
    
    private func SetRandomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while(imageNumber == randomNumber)
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustombackgroundView()
            
            VStack {
                //MARK: Header View
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    Color.theme.grayLight,
                                    Color.theme.grayMedium
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                        Spacer()
                        Button {
                            shouldSettingView.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $shouldSettingView) {
                            SettingView()
                                .presentationDetents([.medium, .large])
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Text("Fun and enjoyble activity for friends and family.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.theme.grayMedium)
                        .padding(.horizontal, 30)
                }
                
                // MARK: main View
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeIn, value: imageNumber)
                }
                
                //MARK: Footer view
                Button {
                    print("Footter Button pressed")
                    SetRandomImage()
                } label: {
                    Text("Explore More")
                        .fontWeight(.heavy)
                        .font(.title2)
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        Color.theme.greenLight,
                        Color.theme.greenMedium
                    ], startPoint: .top, endPoint: .bottom)
                )
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 1)
                .buttonStyle(GradientButtonStyle())

            }
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
