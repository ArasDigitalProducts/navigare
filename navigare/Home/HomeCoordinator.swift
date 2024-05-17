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

enum HomePushDestination: Hashable {
    case details(Article)

    static func == (lhs: HomePushDestination, rhs: HomePushDestination) -> Bool {
        switch (lhs, rhs) {
        case (.details(let lhsArticle), .details(let rhsArticle)):
            return lhsArticle == rhsArticle
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .details(let article):
            hasher.combine(article)
        }
    }
}

enum HomeSheetDestination: Identifiable {
    case webArticle

    var id: Self {
        self
    }
}


extension View {
    func withHomeRoutes() -> some View {
        navigationDestination(for: HomePushDestination.self) { destination in
            switch destination {
            case .details(let article):
                ArticleView(article: article)
            }
        }
    }
}

#Preview {
    HomeCoordinator()
}
