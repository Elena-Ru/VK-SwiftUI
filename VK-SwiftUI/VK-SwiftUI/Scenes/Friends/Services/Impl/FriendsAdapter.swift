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
    private var realm: Realm? {
        do {
            return try Realm()
        } catch {
            print("Ошибка при инициализации Realm: \(error)")
            return nil
        }
    }
}

// MARK: - FriendServiceProtocol
extension FriendsAdapter: FriendServiceProtocol {
    func getFromRLM(completion: @escaping ([Friend]) -> Void) {
        if let realm = self.realm {
          let rlmFriends = realm.objects(RLMFriend.self)
          lazy var friends = [Friend]()
          rlmFriends.forEach { rlmFriend in
              friends.append(self.friend(from: rlmFriend))
          }
          completion(friends)
        } else {
          print("Не удалось инициализировать Realm. Дальнейшие операции с базой данных невозможны.")
          
        }
    }
    
  func get(token: String, id: Int, completion: @escaping ([Friend]) -> Void) {
    if let realm = self.realm {
      let friendsRealmAr = Array(realm.objects(RLMFriend.self))
      if !friendsRealmAr.isEmpty {
        completion(friendsRealmAr.map { self.friend(from: $0) })
      } else {
        fetchFriendsFromServer(token: token, id: id, completion: completion)
      }
    } else {
      print("Не удалось инициализировать Realm. Дальнейшие операции с базой данных невозможны.")

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
  
    func fetchFriendsFromServer(token: String, id: Int, completion: @escaping ([Friend]) -> Void) {
      	let parameters: Parameters = [
      	    Constants.accessTokenKey: token,
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
      	static let friendsGetMethod: String = "/method/friends.get"
      	static let accessTokenKey: String = "access_token"
      	static let userIdKey: String = "user_id"
      	static let clientIdKey: String = "client_id"
      	static let fieldsKey: String = "fields"
      	static let versionKey: String = "v"
      	static let fieldsValue: String = "photo_100, education"
  	}
}
