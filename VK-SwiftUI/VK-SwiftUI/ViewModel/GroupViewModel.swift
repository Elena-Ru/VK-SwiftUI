//
//  GroupViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 15.01.2023.
//

import Foundation
import RealmSwift
import Alamofire

class GroupViewModel: ObservableObject{
    @Published var groups: [Group] = []
    let realm = try! Realm()
    let baseUrl = "https://api.vk.com"
    let clientId = "51525791" //id_приложения
    
    func getUserGroups(token: String, id: Int, completion: @escaping ([Group]) -> Void){
        
        let path = "/method/groups.get"
        
        let parameters: Parameters = [
            "access_token" : token,
            "user_id": id,
            "client_id": clientId,
            "extended": "1",
            "fields": "name, photo_50, members_count", 
            "v": "5.131"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            let groups = try! JSONDecoder().decode( GroupResponse.self, from: data).response.items
    
           self.saveData(groups)
            completion(groups)
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
}
