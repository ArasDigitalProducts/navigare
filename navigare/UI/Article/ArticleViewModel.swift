//
//  ArticleViewModel.swift
//  navigare
//
//  Created by Andre Flego on 22.05.2024..
//

import Foundation
import Combine

class ArticleViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()

    let article: Article
    let coordinator: Coordinator

    var sheet: HomeSheetDestination?

    init(
        article: Article,
        coordinator: Coordinator
    ) {
        self.article = article
        self.coordinator = coordinator

        bindCoordinator()
    }
}

// MARK: Input
extension ArticleViewModel {
    func presentWebArticle() {
        coordinator.present(HomeSheetDestination.webArticle)
    }

    func goBack() {
        coordinator.path.removeLast()
    }

    func dismiss() {
        coordinator.dismiss()
    }
}

// MARK: Functions
private extension ArticleViewModel {
    func bindCoordinator() {
        coordinator.$sheet
            .compactMap { $0?.destination as? HomeSheetDestination}
            .sink { [unowned self] destination in
                self.sheet = destination
            }
            .store(in: &cancellables)
    }
}
