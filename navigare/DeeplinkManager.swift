//
//  DeeplinkManager.swift
//  navigare
//
//  Created by Andre Flego on 21.05.2024..
//

import Foundation

protocol DeeplinkManagerProtocol {
    var deeplinkTarget: DeeplinkTarget? { get set }

    func handleURL(_ url: URL)
    func didHandleDeeplinkTarget()
}

class DeeplinkManager: DeeplinkManagerProtocol, ObservableObject {
    @Published var deeplinkTarget: DeeplinkTarget?

    static let shared = DeeplinkManager()

    private init() {}

    func handleURL(_ url: URL) {
        guard let deeplinkTarget = DeeplinkTarget(from: url) else {
            print("Failed to create deeplink target from URL: \(url)")
            return
        }

        self.deeplinkTarget = deeplinkTarget
    }

    func didHandleDeeplinkTarget() {
        deeplinkTarget = nil
    }
}
