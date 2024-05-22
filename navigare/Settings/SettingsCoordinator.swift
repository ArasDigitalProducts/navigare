//
//  SettingsCoordinator.swift
//  navigare
//
//  Created by Andre Flego on 22.05.2024..
//

import Foundation

enum SettingsPushDestination: Hashable {
    case profile
}

enum SettingsSheetDestination: Identifiable {
    case notifications

    var id: Self {
        self
    }
}

class SettingsCoordinator: Coordinator {
    override init() {
        super.init()
    }

    override func handleDeeplinkTarget(_ deeplinkTarget: DeeplinkTarget) {
        let destinations = deeplinkTarget.path.components(separatedBy: "/")
        let data = deeplinkTarget.data

        destinations.forEach { destination in
            handleDeeplinkDestination(destination, with: data)
        }
    }

    private func handleDeeplinkDestination(_ destination: String, with data: [String: String]? = nil) {
        switch destination {
        case "profile":
            reset()
            push(to: SettingsPushDestination.profile)
        case "notifications":
            dismiss()
            present(SettingsSheetDestination.notifications, isFullscreen: true)
        default:
            break
        }
    }
}
