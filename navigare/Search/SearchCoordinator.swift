//
//  SearchCoordinator.swift
//  navigare
//
//  Created by Andre Flego on 17.05.2024..
//

import SwiftUI

struct SearchCoordinator: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        SearchView()
            .withSearchRoutes()
    }
}

enum SearchPath: Hashable {
    case results(query: String, results: [Article])
    case details(Article)

    static func == (lhs: SearchPath, rhs: SearchPath) -> Bool {
        switch (lhs, rhs) {
        case (.results(let lhsQuery, let lhsArticles), .results(let rhsQuery, let rhsArticles)):
            return lhsQuery == rhsQuery && lhsArticles == rhsArticles
        case (.details(let lhsArticle), .details(let rhsArticle)):
            return lhsArticle == rhsArticle
        @unknown default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .results(let query, let articles):
            hasher.combine(query)
            hasher.combine(articles)
        case .details(let article):
            hasher.combine(article)
        }
    }
}

extension View {
    func withSearchRoutes() -> some View {
        navigationDestination(for: SearchPath.self) { path in
            switch path {
            case .results(let query, let results):
                ResultsView(query: query, results: results)
            case .details(let article):
                ArticleView(article: article)
            }
        }
    }
}

#Preview {
    SearchCoordinator()
        .environmentObject(Coordinator())
}
