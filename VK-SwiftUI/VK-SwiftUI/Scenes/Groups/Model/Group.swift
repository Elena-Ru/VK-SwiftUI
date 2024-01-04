//
//  Group.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import RealmSwift

// MARK: - GroupResponse
final class GroupResponse: Decodable {
    let response: Groups
}

// MARK: - Groups
final class Groups: Decodable {
    let items: [Group]
}

// MARK: - Group
final class Group: Object, Decodable, Identifiable {
    @Persisted var id: Int = .zero
    @Persisted var name: String = .empty
    @Persisted var photoGroup: String = .empty
    @Persisted var screenName: String = .empty
    
    enum CodingKeys: String, CodingKey {
        case name
        case photoGroup = "photo_50"
        case screenName = "screen_name"
        case id = "id"
    }
    
    override static func primaryKey() -> String? {
        Constants.primaryKey
    }
}

// MARK: - Constants
private extension Group {
    enum Constants {
        static let primaryKey: String = "id"
    }
}


