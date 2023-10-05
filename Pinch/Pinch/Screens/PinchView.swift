//
//  PinchView.swift
//  Pinch
//
//  Created by apple on 28/09/23.
//

import SwiftUI

struct PinchView: View {
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @GestureState private var magnifyBy = 1.0
    @State private var pageIndex: Int = 0
    
    private let pages: [PageItem] = [
        PageItem(id: 1, PageImage: "magazine-front-cover"),
        PageItem(id: 2, PageImage: "magazine-back-cover"),
    ]
    
    
    private func resetImageCoordinates() {
        withAnimation(.spring(duration: 1)) {
            imageOffset = .zero
            imageScale = 1
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear
                
                Image(pages[pageIndex].PageImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black, radius: 5, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .offset(imageOffset)
                    .scaleEffect(imageScale)
                    .animation(.spring, value: imageScale)
                    .padding()
                    .gesture (
                        DragGesture()
                            .onChanged({ value in
                                imageOffset = value.translation
                            })
                            .onEnded({ _ in
                                if (imageScale <= 1) {
                                    resetImageCoordinates()
                                }
                            })
                    )
                    .gesture (
                        MagnifyGesture()
                            .updating($magnifyBy) { value, gestureState, transaction in
                                if (imageScale >= 1 && imageScale <= 5) {
                                    imageScale = value.magnification
                                }
                            }
                            .onEnded({ value in
                                if (imageScale > 5) {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageCoordinates()
                                }
                            })
                    )
                    .onTapGesture(count: 2, perform: {
                        if (imageScale == 1) {
                            imageScale = 5
                        } else {
                            resetImageCoordinates()
                        }
                    })
            }
            .overlay(alignment: .top){
                InfoPannelView(offset: imageOffset, scale: imageScale)
                    .padding()
            }
            .overlay(alignment: .bottom) {
                HStack(spacing: 10) {
                    Button {
                        if(imageScale > 1) {
                            imageScale -= 1
                        } else {
                            resetImageCoordinates()
                        }
                        
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                            .font(.system(size: 36))
                    }
                    
                    Button {
                        resetImageCoordinates()
                    } label: {
                        Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
                            .font(.system(size: 36))
                    }
                    
                    Button {
                        if(imageScale < 5) {
                            imageScale += 1
                        }
                    } label: {
                        Image(systemName: "plus.magnifyingglass")
                            .font(.system(size: 36))
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .opacity(isAnimating ? 1 : 0)
                
            }
            .overlay(alignment: .trailing) {
                HStack {
                    Image(systemName: isDrawerOpen ? "chevron.right" : "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.secondary)
                        .frame(height: 40)
                        .animation(.none, value: isDrawerOpen)
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.5)) {
                                isDrawerOpen.toggle()
                            }
                        }
                    
                    Spacer()
                    ForEach(pages.indices, id: \.self) { index in
                        Image(pages[index].PageImage.thumbnailImageName())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(.rect(cornerRadius: 10))
                            .shadow(color: .black.opacity(0.4), radius: 5)
                            .onTapGesture {
                                pageIndex = index
                                resetImageCoordinates()
                                withAnimation(.spring(duration: 0.5)) {
                                    isDrawerOpen = false
                                }
                            }
                        Spacer()
                    }
                    
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
                .background(.ultraThinMaterial)
                .clipShape(.rect(
                    topLeadingRadius: 10,
                    bottomLeadingRadius: 10,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 0
                ))
                .offset(y: -200)
                .offset(x:  isDrawerOpen ? 0 : 250)
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    PinchView()
}
