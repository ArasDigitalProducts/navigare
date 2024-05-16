//
//  SettingsView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router

    var body: some View {
        List {
            Button("Profile") {
                router.push(to: SettingsPath.profile)
            }

            Button("Notifications") {
                router.present(.notifications, isFullscreen: true)
            }
        }
        .withSettingsRoutes()
        .fullScreenCover(item: $router.fullscreenSheet) { destination in
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
