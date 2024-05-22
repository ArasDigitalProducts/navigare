//
//  HomeViewModel.swift
//  navigare
//
//  Created by Andre Flego on 22.05.2024..
//

import Foundation

class HomeViewModel: ObservableObject {
    private let coordinator: Coordinator

    let articles: [Article] = Constants.articles

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK: Input
extension HomeViewModel {
    func pushToArticleDetails(_ article: Article) {
        coordinator.push(to: HomePushDestination.details(article))
    }

    func pushToSearch() {
        coordinator.push(to: HomeCoordinatorDestination.search)
    }
}
