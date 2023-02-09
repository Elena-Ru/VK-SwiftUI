//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.01.2023.
//

import Foundation
import Alamofire
import RealmSwift


class FriendsViewModel: ObservableObject {
    
    @Published var showFavoritesOnly = false
    @Published var filteredFriends : [Friend] = []
    @Published var isListEmpty = false
    @Published var firstLetterArray: [Character] = []
    let realm = try! Realm()
    let baseUrl = "https://api.vk.com"
    let clientId = "51542327" //id_приложения  51525791
    
    func getFriends() {
     getFriendsList(token: UserDefaults.standard.string(forKey: "token") ?? "",
                    id: UserDefaults.standard.integer(forKey: "userID")) { items in
         self.filteredFriends = items.sorted { $0.lastName.first! < $1.lastName.first!}
            if self.filteredFriends.isEmpty {
                self.isListEmpty = true
            }
         self.firstLetterArray = self.setFirstLetterArray()
        }
    }
    
    func setFirstLetterArray() -> [Character] {
        var firstLetterAr : [Character] = []
        for i in 0..<filteredFriends.count {
            guard !firstLetterAr.contains(filteredFriends[i].lastName.first!) else {
                continue
            }
            firstLetterAr.append(filteredFriends[i].lastName.first!)
        }
        return firstLetterAr
    }
    
    func updateFriends() {
        let friends = realm.objects(Friend.self)
                self.filteredFriends = friends.filter { friend in
                    (!self.showFavoritesOnly || friend.isFavorite)
                }
                .sorted { $0.lastName.first! < $1.lastName.first!}
            firstLetterArray = setFirstLetterArray()
    }
    
    func getFriendsList(token: String, id: Int, completion: @escaping ([Friend]) -> ()){
        
        let friendsRealmAr = Array(realm.objects(Friend.self))
        if !friendsRealmAr.isEmpty {
            completion(friendsRealmAr)
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
                    if let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items {
                        DispatchQueue.main.async {
                            RealmService().saveData(friends)
                            completion(friends)
                        }
                    }
                }
                
            }
        }
    }
}
