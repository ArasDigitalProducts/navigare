//
//  HomeCoordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct HomeCoordinator: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        HomeView()
            .withHomeRoutes()
    }
}

enum HomeCoordinatorDestination: Hashable {
    case search
}

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

extension View {
    func withHomeRoutes() -> some View {
        navigationDestination(for: HomePath.self) { path in
            switch path {
            case .details(let article):
                ArticleView(article: article)
            }
        }
    }
}

#Preview {
    HomeCoordinator()
}
