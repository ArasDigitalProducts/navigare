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
                coordinator.push(to: SettingsPushDestination.profile)
            }

            Button("Notifications") {
                coordinator.present(SettingsSheetDestination.notifications, isFullscreen: true)
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsCoordinator() as Coordinator)
}
