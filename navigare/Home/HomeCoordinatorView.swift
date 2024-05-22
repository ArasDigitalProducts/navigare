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
        .navigationDestination(for: HomePushDestination.self) { destination in
            switch destination {
            case .details(let article):
                ArticleView {
                    ArticleViewModel(article: article, coordinator: coordinator)
                }
            }
        }
    }
}

#Preview {
    HomeCoordinatorView()
}
