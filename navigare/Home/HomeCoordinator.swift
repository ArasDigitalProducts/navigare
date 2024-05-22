//
//  HomeCoordinator.swift
//  navigare
//
//  Created by Andre Flego on 21.05.2024..
//

import Foundation

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

class HomeCoordinator: Coordinator {
    override init() {
        super.init()
    }

    override func handleDeeplinkTarget(_ deeplinkTarget: DeeplinkTarget) {
        let destinations = deeplinkTarget.path.components(separatedBy: "/")
        let data = deeplinkTarget.data

        destinations.forEach { destination in
            handleDeeplinkDestination(destination, with: data)
        }
    }

    private func handleDeeplinkDestination(_ destination: String, with data: [String: String]? = nil) {
        switch destination {
        case "details":
            reset()
            if let articleId = data?["id"], let article = Constants.articles.first(where: { $0.id == articleId }) {
                push(to: HomePushDestination.details(article))
            }
        default:
            break
        }
    }
}
