//
//  Friend.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import RealmSwift

// MARK: - FriendsResponse
final class FriendsResponse: Decodable {
    let response: Friends
}

// MARK: - Friends
final class Friends: Decodable {
    let items: [RLMFriend]
    
}

// MARK: - RLMFriend
final class RLMFriend: Object, Decodable, Identifiable {
  
    // MARK: Properties
    @Persisted var id: Int = .zero
    @Persisted var photo100: String = .empty
    @Persisted var firstName: String = .empty
    @Persisted var lastName: String = .empty
    @Persisted var fullName: String = .empty
    @Persisted var isRealm: Bool = false
    @Persisted var isFavorite: Bool = false
    @Persisted var photos = RealmSwift.List<RLMPhoto>()
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
    }
  
    // MARK: Initializer
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.photo100 = try values.decode(String.self, forKey: .photo100)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.fullName = self.firstName + .emptyCharacterString + self.lastName
    }
    
    override static func primaryKey() -> String? {
        return Constants.primaryKey
    }
}

// MARK: - Constants
private extension RLMFriend {
    enum Constants {
        static let primaryKey: String = "id"
    }
}
