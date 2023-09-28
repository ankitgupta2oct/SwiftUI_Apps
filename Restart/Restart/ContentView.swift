//
//  ContentView.swift
//  Restart
//
//  Created by apple on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboadingCompleted: Bool = false
    
    var body: some View {
        if isOnboadingCompleted {
            HomeView()
        } else {
            OnboardingView()
        }
    }
}

#Preview {
    ContentView()
}
