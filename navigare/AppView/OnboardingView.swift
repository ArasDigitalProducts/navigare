//
//  OnboardingView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var stateManager: StateManager

    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false

    var body: some View {
        VStack {
            Text("Onboarding")

            Button("Next") {
                isOnboardingCompleted = true
                withAnimation {
                    stateManager.setState(to: .home)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.red)
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
        .environmentObject(StateManager())
}
