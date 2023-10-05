//
//  InfoPannelView.swift
//  Pinch
//
//  Created by apple on 28/09/23.
//

import SwiftUI

struct InfoPannelView: View {
    var offset: CGSize
    var scale: Double
    
    @State private var isDetailPannelVisible: Bool = false
    
    var body: some View {
        HStack{
            Image(systemName: "circle.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .symbolRenderingMode(.hierarchical)
                .onLongPressGesture(minimumDuration: 1) {
                    isDetailPannelVisible.toggle()
                }
            Spacer()
            HStack{
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                Image(systemName: "arrow.left.arrow.right")
                Text("\(offset.width)")
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
            }
            .font(.footnote)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(isDetailPannelVisible ? 1 : 0)
            .animation(.easeOut(duration: 0.5), value: isDetailPannelVisible)
        }
    }
}

#Preview {
    InfoPannelView(offset: .zero, scale: 1)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
