//
//  TabBarView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = Tab.home
    @StateObject private var homeCoordinator = Coordinator()
    @StateObject private var searchCoordinator = Coordinator()
    @StateObject private var settingsCoordinator = Coordinator()

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $homeCoordinator.path) {
                HomeCoordinator()
            }
            .environmentObject(homeCoordinator)
            .tag(Tab.home)
            .tabItem {
                Label(
                    title: { Text(Tab.home.title) },
                    icon: { Image(systemName: Tab.home.icon) }
                )
            }

            NavigationStack(path: $searchCoordinator.path) {
                SearchCoordinator()
            }
            .environmentObject(searchCoordinator)
            .tag(Tab.search)
            .tabItem {
                Label(
                    title: { Text(Tab.search.title) },
                    icon: { Image(systemName: Tab.search.icon) }
                )
            }

            NavigationStack(path: $settingsCoordinator.path) {
                SettingsCoordinator()
            }
            .environmentObject(settingsCoordinator)
            .tag(Tab.settings)
            .tabItem {
                Label(
                    title: { Text(Tab.settings.title) },
                    icon: { Image(systemName: Tab.settings.icon) }
                )
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
    case search
    case settings

    nonisolated var id: Int {
      rawValue
    }

    var title: String {
        switch self {
        case .home:
            "Home"
        case .search:
            "Search"
        case .settings:
            "Settings"
        }
    }

    var icon: String {
        switch self {
        case .home:
            "house"
        case .search:
            "magnifyingglass"
        case .settings:
            "gear"
        }
    }
}
