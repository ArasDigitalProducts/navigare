//
//  SettingsCoordinatorView.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct SettingsCoordinatorView: View {
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
    SettingsCoordinatorView()
        .environmentObject(Coordinator())
}
