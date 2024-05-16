//
//  SettingsCoordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct SettingsCoordinator: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        SettingsView()
            .withSettingsRoutes()
            .fullScreenCover(item: $coordinator.fullscreenSheet) { destination in
                switch destination {
                case .notifications:
                    NotificationsView()
                default:
                    EmptyView()
                }
            }
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
