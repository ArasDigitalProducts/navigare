//
//  OnboardingView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var stateManager: StateManager

    var body: some View {
        VStack {
            Text("Onboarding")

            Button("Next") {
                withAnimation {
                    stateManager.setState(to: .home)
                }
                UserDefaults.standard.setValue(true, forKey: "isOnboardingCompleted")
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
