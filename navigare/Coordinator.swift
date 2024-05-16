//
//  Coordinator.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

enum SheetDestination: Identifiable {
    case notifications
    case webArticle

    var id: Self {
        self
    }
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath
    @Published var sheet: SheetDestination?
    @Published var fullscreenSheet: SheetDestination?

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

    func present(_ sheet: SheetDestination, isFullscreen: Bool = false) {
        if isFullscreen {
            self.fullscreenSheet = sheet
        } else {
            self.sheet = sheet
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
