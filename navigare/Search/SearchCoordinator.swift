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
            .navigationDestination(for: SearchPushDestination.self) { destination in
                switch destination {
                case .results(let query, let results):
                    ResultsView(query: query, results: results)
                case .details(let article):
                    ArticleView {
                        ArticleViewModel(article: article, coordinator: coordinator)
                    }
                }
            }
    }
}

enum SearchPushDestination: Hashable {
    case results(query: String, results: [Article])
    case details(Article)

    static func == (lhs: SearchPushDestination, rhs: SearchPushDestination) -> Bool {
        switch (lhs, rhs) {
        case (.results(let lhsQuery, let lhsArticles), .results(let rhsQuery, let rhsArticles)):
            return lhsQuery == rhsQuery && lhsArticles == rhsArticles
        case (.details(let lhsArticle), .details(let rhsArticle)):
            return lhsArticle == rhsArticle
        default:
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

#Preview {
    SearchCoordinator()
        .environmentObject(Coordinator())
}
