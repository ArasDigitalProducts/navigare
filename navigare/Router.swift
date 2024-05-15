//
//  Router.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

enum HomePath: Hashable {
    case details
}

enum SettingsPath: Hashable {
    case profile
    case notifications
}

enum SheetDestination: Hashable {
    case test
}

class Router: ObservableObject {
    @Published var path: NavigationPath

    private var sheet: SheetDestination?

    init() {
        self.path = NavigationPath()
    }

    func push(to destination: any Hashable) {
        path.append(destination)
    }
}

extension View {
    func withHomeRoutes() -> some View {
        navigationDestination(for: HomePath.self) { path in
            Text("\(path.hashValue)")
        }
    }

    func withSettingsRoutes() -> some View {
        navigationDestination(for: SettingsPath.self) { path in
            switch path {
            case .profile:
                ProfileView()
            case .notifications:
                NotificationsView()
            }
        }
    }

    func withSettingSheets() -> some View {
        sheet(item: $sheet) { destination in
            switch destination {
            case .test:
                
            }
        }
    }
}
