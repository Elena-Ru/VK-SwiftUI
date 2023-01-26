//
//  NewsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 16.01.2023.
//

import Foundation
import Alamofire

class NewsViewModel: ObservableObject{

    @Published var news: [Item] = []
    @Published var newsGroups: [NewsGroup] = []
   
    let baseUrl = "https://api.vk.com"
    let clientId = "51525791" //id_приложения
    
    func getNewsPost(token: String, id: Int, completion: @escaping (Response) -> Void){
        
        let path = "/method/newsfeed.get"
         let parameters: Parameters = [
            "access_token" : token,
            "user_id": id,
            "client_id": clientId,
            "filters": "post",
            "v": "5.131"
        ]
        let url = baseUrl+path

        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            
            let newsResponse = try? JSONDecoder().decode(News.self, from: data)
          
            self.news = newsResponse?.response?.items ?? []
            self.newsGroups = newsResponse?.response?.groups ?? []
            completion((newsResponse?.response)!)
            
        }
    }
}
