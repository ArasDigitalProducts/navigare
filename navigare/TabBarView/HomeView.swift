//
//  HomeView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var sessionManager: SessionManager
    @StateObject private var homeRouter = Router()

    var body: some View {
        NavigationStack(path: $homeRouter.path) {
            VStack {
                Text("Logged in as \(sessionManager.username ?? "nil")")
                Button("Logout") {
                    sessionManager.logout()
                }
            }
            .withHomeRoutes()
        }
    }
}
