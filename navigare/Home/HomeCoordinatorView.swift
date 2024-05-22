//
//  HomeCoordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct HomeCoordinatorView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        HomeView {
            HomeViewModel(coordinator: coordinator)
        }
        .withHomeRoutes()
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
    HomeCoordinatorView()
}
