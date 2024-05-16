//
//  SettingsView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        List {
            Button("Profile") {
                coordinator.push(to: SettingsPath.profile)
            }

            Button("Notifications") {
                coordinator.present(.notifications, isFullscreen: true)
            }
        }
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

#Preview {
    SettingsView()
        .environmentObject(SessionManager())
}
