//
//  Router.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

enum RouterPath: Hashable {
    case home
    case auth
    case onboarding
}

enum ExplorePath: Hashable {
    case tutorial
    case explore
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
    func withAppRoutes() -> some View {
        navigationDestination(for: RouterPath.self) { path in
            Text("\(path.hashValue)")
        }
    }

    func withExploreRoutes() -> some View {
        navigationDestination(for: ExplorePath.self) { path in
            Text("\(path.hashValue)")
        }
    }
}
