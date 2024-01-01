//
//  FriendsAdapter.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.05.2023.
//

import Foundation
import Alamofire
import RealmSwift

final class FriendsAdapter: FriendService {
  
  let realm = try! Realm()
  let baseUrl = "https://api.vk.com"
  let clientId = "51542327"
  
  func getFromRLM(completion: @escaping ([Friend]) -> ()) {
    let rlmFriends = realm.objects(RLMFriend.self)
    lazy var friends = [Friend]()
    rlmFriends.forEach { rlmFriend in
      friends.append(self.friend(from: rlmFriend))
    }
    completion(friends)
  }
  
  func get(token: String, id: Int, completion: @escaping ([Friend]) -> ()) {
    let friendsRealmAr = Array(realm.objects(RLMFriend.self))
    lazy var friends = [Friend]()
    
    if !friendsRealmAr.isEmpty {
      friendsRealmAr.forEach { rlmFriend in
        friends.append(friend(from: rlmFriend))
      }
      completion(friends)
    } else {
      let path = "/method/friends.get"
      let parameters: Parameters = [
        "access_token" : token,
        "user_id": id,
        "client_id": clientId,
        "fields": "photo_100, education",
        "v": "5.131"
      ]
      
      let url = baseUrl+path
      
      AF.request(url, method: .post,  parameters: parameters).response { result in
        if let data = result.data {
          if let rlmFriends = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items {
            RealmService().saveData(rlmFriends)
            rlmFriends.forEach { rlmFriend in
              friends.append(self.friend(from: rlmFriend))
            }
            DispatchQueue.main.async {
              completion(friends)
            }
          }
        }
      }
    }
  }
  
  private func friend(from rlmFriend: RLMFriend) -> Friend {
    Friend(id: rlmFriend.id,
           firstName: rlmFriend.firstName,
           lastName: rlmFriend.lastName,
           fullName: rlmFriend.fullName,
           isRealm: rlmFriend.isRealm,
           isFavorite: rlmFriend.isFavorite)
  }
}
