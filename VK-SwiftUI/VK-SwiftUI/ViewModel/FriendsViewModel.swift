//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.01.2023.
//

import Foundation
import Alamofire
import RealmSwift


class FriendsViewModel: ObservableObject{
 
    @Published var friends: [Friend] = []
    let realm = try! Realm()
    let baseUrl = "https://api.vk.com"
    let clientId = "51477716" //id_приложения
    
    func getFriendsList(token: String, id: Int, completion: @escaping ([Friend]) -> ()){
        
        let friendsRealmAr = Array(realm.objects(Friend.self))
        if !friendsRealmAr.isEmpty {
            self.friends = friendsRealmAr
            print(self.friends)
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
                    if let friends = try? JSONDecoder().decode(FriendsResponse.self, from: data).response.items {
                        DispatchQueue.main.async {
                            self.friends = friends
                            self.saveData(friends)
                            completion(friends)
                        }
                    }
                }
                
            }
        }
    }
    
    private  func saveData  <T: Object>(_ sData: [T]){

        do {
           let realm = try Realm()
            print(realm.configuration.fileURL as Any)
            realm.beginWrite()
            realm.add(sData, update: .all)
            try realm.commitWrite()
        } catch {
            print(error)
        }
      }
    
    func isFavorite(friend: Friend){
        let realm = try! Realm()
        let friend = realm.objects(Friend.self).where{$0.id == friend.id}
        
        do {
            print(realm.configuration.fileURL as Any)
            realm.beginWrite()
            if friend[0].isFavorite {
                friend.setValue(false, forKey: "isFavorite")
            } else {
                friend.setValue(true, forKey: "isFavorite")
            }
            realm.add(friend, update: .modified)
            self.friends = Array(realm.objects(Friend.self))
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
