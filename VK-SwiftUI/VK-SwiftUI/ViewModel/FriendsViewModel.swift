//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.01.2023.
//

import Foundation
import Alamofire

class FriendsViewModel: ObservableObject{
    let baseUrl = "https://api.vk.com"
    let clientId = "51477716" //id_приложения
    
    func getFriendsList(token: String, id: Int, completion: @escaping ([Friend]) -> ()){
        
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
                    completion(friends)
                }
            }
            
        }
    }
}
