//
//  SearchView.swift
//  navigare
//
//  Created by Andre Flego on 17.05.2024..
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var coordinator: Coordinator

    @State private var query = ""

    var body: some View {
        VStack {
            TextField("Search...", text: $query)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Search") {
                let results = articles.filter { $0.title.lowercased().contains(query.lowercased()) }
                coordinator.push(to: SearchPushDestination.results(query: query, results: results))
            }
            .disabled(query.isEmpty)
        }
    }


}

#Preview {
    SearchView()
        .environmentObject(Coordinator())
}
