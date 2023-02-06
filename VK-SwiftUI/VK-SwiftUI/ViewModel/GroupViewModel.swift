//
//  GroupViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 15.01.2023.
//

import Foundation
import RealmSwift
import Alamofire

class GroupViewModel: ObservableObject {
    
    @Published var allGroups: [Group] = []
    @Published var isListEmpty = false
    let session = Session.shared
    let realm = try! Realm()
    let baseUrl = "https://api.vk.com"
    let clientId = "51542327" //id_приложения
    
    func getGroups(){
        getUserGroups(token: session.token, id: session.userID){ items in
            if items.isEmpty {
                self.isListEmpty = true
            }
        }
    }
    
    func getUserGroups(token: String, id: Int, completion: @escaping ([Group]) -> ()){
        
        let groupsRealmAr = Array(realm.objects(Group.self))
        if !groupsRealmAr.isEmpty {
            completion(groupsRealmAr)
            return
        }
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
            
            DispatchQueue.main.async {
                self.saveData(groups)
                completion(groups)
            }
        }
    }
    
    func getGroupsAll(token: String, completion: @escaping ([Group]) -> Void){
        
        let path = "/method/groups.search"
        
        let parameters: Parameters = [
            "q": "group",
            "type": "group",
            "count": "100",
            "sort": 6,
            "access_token" : token,
            "client_id": clientId,
            "v": "5.131"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, parameters: parameters).responseData { response in
            guard let data = response.value  else { return}
            
            let groups = try! JSONDecoder().decode( GroupResponse.self, from: data).response.items
            DispatchQueue.main.async {
                self.allGroups = groups
                completion(groups)
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
}
