//
//  PhotoViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 17.01.2023.
//

import Foundation
import Alamofire
import RealmSwift

class PhotoViewModel: ObservableObject{
    
    @Published var photos: [Photo] = []
    let baseUrl = "https://api.vk.com"
    let clientId = "51542327" //id_приложения
    
    func getUserPhotos(token: String, idFriend: Int, completion: @escaping ([Photo]) -> Void){
        
        let path = "/method/photos.get"
        let parameters: Parameters = [
            "access_token" : token,
            "owner_id": idFriend,
            "album_id": "profile",
            "extended": "likes",
            "photo_sizes": "0",
            "client_id": clientId,
            "v": "5.131"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            let photos = try! JSONDecoder().decode( FriendPhotoResponse.self, from: data).response.items
            DispatchQueue.main.async {
                self.photos = photos
                RealmService().saveData(photos)
                completion(photos)
            }
        }
    }
    
    func postLike( isLike: inout Int, owner: Int, item: Int ) {
        
        let path = isLike == 1 ? "/method/likes.add" : "/method/likes.delete"
        let url = baseUrl+path
        
        let parameters: Parameters = [
                "access_token" : UserDefaults.standard.string(forKey: "token") ?? "",
                "type": "photo",
                "owner_id": owner,
                "item_id": item,
                "v": "5.131"
            ]
        
         AF.request(url, method: .get, parameters: parameters).responseData { response in
             guard response.value != nil  else { return}
             print("Done")
         }
    }
}
