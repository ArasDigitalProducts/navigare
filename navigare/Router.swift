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

class Router: ObservableObject {
    @Published var path: NavigationPath

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
            Text("\(path.hashValue)")
        }
    }
}
