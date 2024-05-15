//
//  AppView.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject private var stateManager: StateManager
    @EnvironmentObject private var sessionManager: SessionManager

    @AppStorage("isOnboardingCompleted") private var isOnboardingCompleted = false

    var body: some View {
        Group {
            switch stateManager.state {
            case .auth:
                AuthView()
            case .onboarding:
                OnboardingView()
                    .environmentObject(stateManager)
            case .home:
                TabBarView()
            }
        }
        .transition(.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .opacity
        ))
        .onChange(of: sessionManager.username) { _ in
            withAnimation {
                if sessionManager.username == nil {
                    stateManager.setState(to: .auth)
                } else if isOnboardingCompleted {
                    stateManager.setState(to: .home)
                } else {
                    stateManager.setState(to: .onboarding)
                }
            }
        }
    }
}

#Preview {
    AppView()
        .environmentObject(StateManager())
        .environmentObject(SessionManager())
}
