//
//  SettingsCoordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct SettingsCoordinator: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SettingsView()
        }
        .environmentObject(coordinator)
    }
}

enum SettingsPath: Hashable {
    case profile
}

extension View {

    func withSettingsRoutes() -> some View {
        navigationDestination(for: SettingsPath.self) { path in
            switch path {
            case .profile:
                ProfileView()
            }
        }
    }
}

#Preview {
    SettingsCoordinator()
}
