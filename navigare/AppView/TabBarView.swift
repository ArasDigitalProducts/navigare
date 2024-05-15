//
//  TabBarView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tag(0)
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                }

            SettingsView()
                .tag(1)
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
