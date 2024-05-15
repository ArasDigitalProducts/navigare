//
//  SettingsView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var settingsRouter = Router()

    var body: some View {
        NavigationStack(path: $settingsRouter.path) {
            List {
                Button("Profile") {
                    settingsRouter.push(to: SettingsPath.profile)
                }

                Button("Notifications") {
                    settingsRouter.push(to: SettingsPath.notifications)
                }
            }
            .withSettingsRoutes()
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SessionManager())
}
