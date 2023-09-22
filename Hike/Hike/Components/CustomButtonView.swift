//
//  CustomButtonView.swift
//  Hike
//
//  Created by apple on 20/09/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.theme.greenLight,
                                            .theme.greenMedium],
                                   startPoint: .top, endPoint: .bottom)
            )
            
            Circle()
                .stroke(
                    LinearGradient(colors: [.theme.grayLight,
                                            .theme.grayMedium],
                                   startPoint: .top, endPoint: .bottom),
                    lineWidth: 4
            )
            
            Image(systemName: "figure.hiking")
                .font(.system(size: 32))
                .foregroundStyle(
                    LinearGradient(colors: [.theme.grayLight,
                                            .theme.grayMedium],
                                   startPoint: .top, endPoint: .bottom)
                )
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
}
