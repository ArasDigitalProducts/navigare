//
//  TabBarView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var sessionManager: SessionManager

    @StateObject var homeRouter = Router()
    @StateObject var settingsRouter = Router()

    @State var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $homeRouter.path) {
                VStack {
                    Text("Logged in as \(sessionManager.username ?? "nil")")
                    Button("Logout") {
                        sessionManager.logout()
                    }
                }
                .withHomeRoutes()
            }
            .tag(1)
            .tabItem {
                Label(
                    title: { Text("Home") },
                    icon: { Image(systemName: "house") }
                )
            }

            NavigationStack(path: $settingsRouter.path) {
                VStack {
                    Text("Settings")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.yellow)
                        .ignoresSafeArea()
                }
                .withSettingsRoutes()
            }
            .tag(2)
            .tabItem {
                Label(
                    title: { Text("Settings") },
                    icon: { Image(systemName: "gear") }
                )
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(SessionManager())
}
