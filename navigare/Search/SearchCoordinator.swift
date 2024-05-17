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
            .withHomeRoutes()
    }
}

enum SearchPath: Hashable {
    case results(query: String, results: [Article])
}

extension View {
    func withSearchRoutes() -> some View {
        navigationDestination(for: SearchPath.self) { path in
            switch path {
            case .results(let query, let results):
                ResultsView(query: query, results: results)
            }
        }
    }
}

#Preview {
    SearchCoordinator()
        .environmentObject(Coordinator())
}
