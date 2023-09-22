//
//  CustombackgroundView.swift
//  Hike
//
//  Created by apple on 20/09/23.
//

import SwiftUI

struct CustombackgroundView: View {
    var body: some View {
        ZStack{
            Color.theme.greenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
            
            Color.theme.greenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
            
            LinearGradient(colors: [
                Color.theme.greenLight,
                Color.theme.greenMedium
            ],
            startPoint: .top,
            endPoint: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 40))
        }
    }
}

#Preview {
    CustombackgroundView()
        .padding()
}
