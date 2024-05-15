//
//  NavigareApp.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

@main
struct NavigareApp: App {
    @StateObject var stateManager = StateManager()
    @StateObject var sessionManager = SessionManager()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(stateManager)
                .environmentObject(sessionManager)
        }
    }
}
