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
            VStack {
                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.yellow)
                    .ignoresSafeArea()
            }
            .withSettingsRoutes()
        }
    }
}

#Preview {
    SettingsView()
}
