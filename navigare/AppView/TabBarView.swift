//
//  TabBarView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = Tab.home

    var body: some View {
        TabView(selection: $selection) {
            ForEach(Tab.allCases) { tab in
                tab.contentView()
                    .tabItem {
                        Label(
                            title: { Text(tab.title) },
                            icon: { Image(systemName: tab.icon) }
                        )
                    }
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(SessionManager())
}

enum Tab: Int, Identifiable, CaseIterable {
    case home
    case settings

    nonisolated var id: Int {
      rawValue
    }

    @ViewBuilder
    func contentView() -> some View {
        switch self {
        case .home:
            HomeView()
        case .settings:
            SettingsView()
        }
    }

    var title: String {
        switch self {
        case .home:
            "Home"
        case .settings:
            "Settings"
        }
    }

    var icon: String {
        switch self {
        case .home:
            "house"
        case .settings:
            "gear"
        }
    }
}
