//
//  AppView.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

enum AppState {
    case auth
    case onboarding
    case home
}

struct AppView: View {
    @EnvironmentObject var stateManager: StateManager
    @EnvironmentObject var sessionManager: SessionManager

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
                } else if isOnboardingCompleted() {
                    stateManager.setState(to: .home)
                } else {
                    stateManager.setState(to: .onboarding)
                }
            }
        }
    }

    func isOnboardingCompleted() -> Bool {
        UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
    }
}

#Preview {
    AppView()
        .environmentObject(StateManager())
        .environmentObject(SessionManager())
}
