//
//  Router.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

enum HomePath: Hashable {
    case details(Article)

    static func == (lhs: HomePath, rhs: HomePath) -> Bool {
        switch (lhs, rhs) {
        case (.details(let lhsArticle), .details(let rhsArticle)):
            return lhsArticle == rhsArticle
        @unknown default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .details(let article):
            hasher.combine(article)
        }
    }
}

enum SettingsPath: Hashable {
    case profile
}

enum SheetDestination: Identifiable {
    case notifications
    case webArticle

    var id: Self {
        self
    }
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath
    @Published var sheet: SheetDestination?
    @Published var fullscreenSheet: SheetDestination?

    init() {
        self.path = NavigationPath()
    }

    func push(to destination: any Hashable) {
        path.append(destination)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func present(_ sheet: SheetDestination, isFullscreen: Bool = false) {
        if isFullscreen {
            self.fullscreenSheet = sheet
        } else {
            self.sheet = sheet
        }
    }

    func dismiss() {
        sheet = nil
        fullscreenSheet = nil
    }

    func handle(url: URL) {
        // handle url and setup stack or
        UIApplication.shared.open(url)
    }
}

extension View {
    func withHomeRoutes() -> some View {
        navigationDestination(for: HomePath.self) { path in
            switch path {
            case .details(let article):
                ArticleView(article: article)
            }
        }
    }

    func withSettingsRoutes() -> some View {
        navigationDestination(for: SettingsPath.self) { path in
            switch path {
            case .profile:
                ProfileView()
            }
        }
    }
}
