//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by apple on 21/09/23.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background{
                
                configuration.isPressed ?
                LinearGradient(colors: [
                    Color.theme.grayMedium,
                    Color.theme.grayLight
                ], startPoint: .top, endPoint: .bottom) :
                
                LinearGradient(colors: [
                    Color.theme.grayLight,
                    Color.theme.grayMedium
                ], startPoint: .top, endPoint: .bottom)
            }
            .clipShape(Capsule())
    }
}
