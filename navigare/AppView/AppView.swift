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
    @EnvironmentObject var appRouter: Router
    @State var appState = AppState.onboarding

    var body: some View {
        Group {
            switch appState {
            case .auth:
                AuthView()
            case .onboarding:
                OnboardingView()
            case .home:
                TabBarView()
            }
        }
    }
}

#Preview {
    AppView()
}
