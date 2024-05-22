//
//  NavigareApp.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

@main
struct NavigareApp: App {
    @StateObject private var stateManager = StateManager()
    @StateObject private var sessionManager = SessionManager()
    @StateObject private var deeplinkManager = DeeplinkManager.shared

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(stateManager)
                .environmentObject(sessionManager)
                .environmentObject(deeplinkManager)
                .onOpenURL(perform: deeplinkManager.handleURL)
        }
    }
}
