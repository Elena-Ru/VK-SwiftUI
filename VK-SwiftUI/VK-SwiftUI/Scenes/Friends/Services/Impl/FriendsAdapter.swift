//
//  FriendsAdapter.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.05.2023.
//

import Foundation
import Alamofire
import RealmSwift

// MARK: - FriendsAdapter
final class FriendsAdapter {
    private var realm: Realm {
        return try! Realm()
    }
}

// MARK: - FriendServiceProtocol
extension FriendsAdapter: FriendServiceProtocol {
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
        if !friendsRealmAr.isEmpty {
            completion(friendsRealmAr.map { self.friend(from: $0) })
        } else {
            fetchFriendsFromServer(token: token, id: id, completion: completion)
        }
    }
}

// MARK: - Private methods
private extension FriendsAdapter {
    func friend(from rlmFriend: RLMFriend) -> Friend {
        Friend(
            id: rlmFriend.id,
            firstName: rlmFriend.firstName,
            lastName: rlmFriend.lastName,
            fullName: rlmFriend.fullName,
            isRealm: rlmFriend.isRealm,
            isFavorite: rlmFriend.isFavorite)
    }
  
  	func makeUrl(for path: String) -> String {
        return "\(Constants.baseUrl)\(path)"
  	}
  
    func fetchFriendsFromServer(token: String, id: Int, completion: @escaping ([Friend]) -> ()) {
      	let parameters: Parameters = [
      	    Constants.accessTokenKey : token,
      	    Constants.userIdKey: id,
      	    Constants.clientIdKey: Secrets.clientID,
      	    Constants.fieldsKey: Constants.fieldsValue,
      	    Constants.versionKey: Secrets.version
      	]
      	
      	AF.request(
      	    makeUrl(for: Constants.friendsGetMethod),
      	    method: .get,
      	    parameters: parameters
      	).response { response in
      	    switch response.result {
      	    case .success(let data):
      	        guard let data = data else { return }
      	        do {
      	            let rlmFriends = try JSONDecoder().decode(FriendsResponse.self, from: data).response.items
      	            RealmService.shared.saveData(rlmFriends)
      	            let friends = rlmFriends.map { self.friend(from: $0) }
      	            DispatchQueue.main.async {
      	                completion(friends)
      	            }
      	        } catch {
      	            print(error)
      	        }
      	    case .failure(let error):
      	        print(error)
      	    }
      	}
    }
}

// MARK: - Constants
private extension FriendsAdapter {
  	enum Constants {
        static let baseUrl: String = "https://api.vk.com"
  	    static let friendsGetMethod = "/method/friends.get"
  	    static let accessTokenKey = "access_token"
  	    static let userIdKey = "user_id"
  	    static let clientIdKey = "client_id"
  	    static let fieldsKey = "fields"
  	    static let versionKey = "v"
  	    static let fieldsValue = "photo_100, education"
  	}
}
