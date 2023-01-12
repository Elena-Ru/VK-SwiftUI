//
//  APIManager.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//

import Alamofire


class APIManager{
    
    let baseUrl = "https://api.vk.com"
    let clientId = "51477716" //id_приложения

    func getFriendsList(token: String, id: Int){
        
        let path = "/method/friends.get"
        let parameters: Parameters = [
            "access_token" : token,
            "user_id": id,
            "client_id": clientId,
            "order": "name",
            "v": "5.131"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, parameters: parameters).responseJSON { response in
            print("********FRIENDS***********")
            print(response.value as Any)
            print("********FRIENDS***********")
            // completion(response)
        }
    }

}

