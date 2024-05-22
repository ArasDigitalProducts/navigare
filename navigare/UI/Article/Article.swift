//
//  Article.swift
//  navigare
//
//  Created by Andre Flego on 16.05.2024..
//

import Foundation

struct Article: Identifiable {
    let id: String
    let title: String
    let description: String

    init(id: String = UUID().uuidString, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}

// MARK: Equatable
extension Article: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: Hashable
extension Article: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(description)
    }
}
