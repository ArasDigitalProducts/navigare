//
//  HomeView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct HomeView: View {
    @StateObject private var homeRouter = Router()

    var body: some View {
        NavigationStack(path: $homeRouter.path) {
            VStack {
                Text("Hello world!")
            }
            .withHomeRoutes()
        }
    }
}

#Preview {
    HomeView()
}
