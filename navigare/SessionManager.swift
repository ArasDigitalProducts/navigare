//
//  SessionManager.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import Foundation

class SessionManager: ObservableObject {
    @Published var username: String?

    private let usernameKey = "username"

    init() {
        username = UserDefaults.standard.string(forKey: usernameKey)
    }

    func login(username: String) {
        self.username = username
        UserDefaults.standard.setValue(username, forKey: usernameKey)
    }

    func logout() {
        username = nil
        UserDefaults.standard.removeObject(forKey: usernameKey)
    }
}
