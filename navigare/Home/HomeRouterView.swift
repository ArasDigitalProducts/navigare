//
//  HomeRouterView.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct HomeRouterView: View {
    @StateObject private var homeRouter = Router()

    var body: some View {
        NavigationStack(path: $homeRouter.path) {
            HomeView()
        }
        .environmentObject(homeRouter)
    }
}

#Preview {
    HomeRouterView()
}
