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
            .fullScreenCover(item: $coordinator.fullscreenSheet) { sheet in
                if let destination = sheet.destination as? SettingsSheetDestination {
                    switch destination {
                    case .notifications:
                        NotificationsView()
                    }
                }
            }
    }
}

enum SettingsPushDestination: Hashable {
    case profile
}

enum SettingsSheetDestination: Identifiable {
    case notifications

    var id: Self {
        self
    }
}

extension View {
    func withSettingsRoutes() -> some View {
        navigationDestination(for: SettingsPushDestination.self) { destination in
            switch destination {
            case .profile:
                ProfileView()
            }
        }
    }
}

#Preview {
    SettingsCoordinator()
        .environmentObject(Coordinator())
}
