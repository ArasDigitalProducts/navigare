//
//  StateManager.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import Foundation

enum AppState {
    case auth
    case onboarding
    case home
}

class StateManager: ObservableObject {
    @Published var state: AppState

    init() {
        state = .auth
    }

    func setState(to state: AppState) {
        self.state = state
    }
}
