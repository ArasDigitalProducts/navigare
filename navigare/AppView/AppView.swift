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
    @EnvironmentObject private var deeplinkManager: DeeplinkManager

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
        .onChange(of: deeplinkManager.deeplinkTarget) { deeplinkTarget in
            guard let deeplinkTarget else { return }
            
            if deeplinkTarget.requiresAuth && sessionManager.username == nil { 
                deeplinkManager.didHandleDeeplinkTarget()
                return
            }

            switch deeplinkTarget.router {
            case .home, .settings:
                stateManager.setState(to: .home)
            }

            deeplinkManager.didHandleDeeplinkTarget()
        }
    }
}

#Preview {
    AppView()
        .environmentObject(StateManager())
        .environmentObject(SessionManager())
        .environmentObject(DeeplinkManager.shared)
}
