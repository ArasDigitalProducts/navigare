//
//  SettingsRouterView.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct SettingsRouterView: View {
    @StateObject private var settingsRouter = Router()

    var body: some View {
        NavigationStack(path: $settingsRouter.path) {
            SettingsView()
        }
        .environmentObject(settingsRouter)
    }
}

#Preview {
    SettingsRouterView()
}
