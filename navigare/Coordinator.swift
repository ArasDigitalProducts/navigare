//
//  Coordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

class AnyIdentifiable: Identifiable {
    let destination: any Identifiable

    init(destination: any Identifiable) {
        self.destination = destination
    }
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath
    @Published var sheet: AnyIdentifiable?
    @Published var fullscreenSheet: AnyIdentifiable?

    init() {
        self.path = NavigationPath()
    }

    func push(to destination: any Hashable) {
        path.append(destination)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func present(_ sheet: any Identifiable, isFullscreen: Bool = false) {
        if isFullscreen {
            self.fullscreenSheet = AnyIdentifiable(destination: sheet)
        } else {
            self.sheet = AnyIdentifiable(destination: sheet)
        }
    }

    func dismiss() {
        sheet = nil
        fullscreenSheet = nil
    }

    func handle(url: URL) {
        // handle url and setup stack or
        UIApplication.shared.open(url)
    }
}
