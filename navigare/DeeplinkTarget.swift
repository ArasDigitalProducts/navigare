//
//  DeeplinkTarget.swift
//  navigare
//
//  Created by Andre Flego on 21.05.2024..
//

import Foundation

struct DeeplinkTarget: Equatable {
    let router: Router
    let path: String
    let data: [String: String]?
    
    var requiresAuth: Bool {
        router.requiresAuth
    }

    enum Router: String {
        case home
        case settings

        var requiresAuth: Bool {
            switch self {
            case .home, .settings:
                return true
            }
        }
    }
}

extension DeeplinkTarget {
    init?(from url: URL) {
        guard url.scheme == "navigare" else {
            print("Invalid URL scheme")
            return nil
        }

        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            print("Invalid URL components")
            return nil
        }

        guard let host = components.host else {
            print("Invalid URL host")
            return nil
        }

        guard let router = Router(rawValue: host) else {
            print("Invalid deeplink router")
            return nil
        }

        self.router = router
        self.path = url.path()
        self.data = components.queryItems?.toDeeplinkTargetData()
    }
}

private extension [URLQueryItem] {
    func toDeeplinkTargetData() -> [String: String] {
        reduce(into: [:]) { partialResult, queryItem in
            if let value = queryItem.value {
                partialResult.updateValue(value, forKey: queryItem.name)
            }
        }
    }
}
