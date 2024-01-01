//
//  Group.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import RealmSwift

final class GroupResponse: Decodable {
    let response: Groups
}

final class Groups: Decodable{
    let items: [Group]
}

final class Group: Object, Decodable, Identifiable{
    @Persisted var id: Int = 0
    @Persisted var name: String = ""
    @Persisted var photoGroup: String = ""
    @Persisted var screenName: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name
        case photoGroup = "photo_50"
        case screenName = "screen_name"
        case id = "id"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}



