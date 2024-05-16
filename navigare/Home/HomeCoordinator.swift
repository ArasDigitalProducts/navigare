//
//  HomeCoordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 16.05.2024..
//

import SwiftUI

struct HomeCoordinator: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    HomeCoordinator()
}
