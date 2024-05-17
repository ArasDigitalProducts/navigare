//
//  ResultsView.swift
//  navigare
//
//  Created by Andre Flego on 17.05.2024..
//

import SwiftUI

struct ResultsView: View {
    @EnvironmentObject private var coordinator: Coordinator

    let query: String
    let results: [Article]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Results for: \(query)")
                .font(.callout)
                .bold()
                .padding(.horizontal)

            List(results) { article in
                Button {
                    coordinator.push(to: HomePath.details(article))
                } label: {
                    ArticleListItemView(article: article)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    ResultsView(
        query: "Art",
        results: articles.filter { $0.title.lowercased().contains("art") }
    )
    .environmentObject(Coordinator())
}
