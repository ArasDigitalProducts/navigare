//
//  HomeView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel

    init(_ viewModel: @escaping () -> HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        List(viewModel.articles) { article in
            Button {
                viewModel.pushToArticleDetails(article)
            } label: {
                ArticleListItemView(article: article)
            }
            .buttonStyle(.plain)
        }
        .navigationTitle("Home")
        .toolbar {
            Button {
                viewModel.pushToSearch()
            } label: {
                Image(systemName: "magnifyingglass")
            }
        }
    }
}

#Preview {
    HomeView {
        HomeViewModel(coordinator: Coordinator())
    }
}
