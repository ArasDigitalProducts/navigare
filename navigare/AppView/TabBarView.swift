//
//  TabBarView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @State private var selection = Tab.home
    @StateObject private var homeCoordinator = HomeCoordinator()
    @StateObject private var settingsCoordinator = SettingsCoordinator()

    @EnvironmentObject private var deeplinkManager: DeeplinkManager

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $homeCoordinator.path) {
                HomeCoordinatorView()
                    .navigationDestination(for: HomeCoordinatorDestination.self) { destination in
                        switch destination {
                        case .search:
                            SearchCoordinator()
                        }
                    }
            }
            .environmentObject(homeCoordinator as Coordinator)
            .tag(Tab.home)
            .tabItem {
                Label(
                    title: { Text(Tab.home.title) },
                    icon: { Image(systemName: Tab.home.icon) }
                )
            }

            NavigationStack(path: $settingsCoordinator.path) {
                SettingsCoordinatorView()
            }
            .environmentObject(settingsCoordinator as Coordinator)
            .tag(Tab.settings)
            .tabItem {
                Label(
                    title: { Text(Tab.settings.title) },
                    icon: { Image(systemName: Tab.settings.icon) }
                )
            }
        }
        .onChange(of: deeplinkManager.deeplinkTarget) {deeplinkTarget in
            guard let deeplinkTarget else { return }

            switch deeplinkTarget.router {
            case .home:
                selection = .home
                settingsCoordinator.dismiss()
                homeCoordinator.handleDeeplinkTarget(deeplinkTarget)
            case .settings:
                selection = .settings
                homeCoordinator.dismiss()
                settingsCoordinator.handleDeeplinkTarget(deeplinkTarget)
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(DeeplinkManager.shared)
}

enum Tab: Int, Identifiable, CaseIterable {
    case home
    case settings

    nonisolated var id: Int {
      rawValue
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
