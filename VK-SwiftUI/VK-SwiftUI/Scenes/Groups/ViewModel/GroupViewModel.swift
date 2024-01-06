//
//  GroupViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 15.01.2023.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftUI
import Combine

// MARK: - GroupViewModel
final class GroupViewModel: ObservableObject {
    
    @Published var allGroups: [Group] = []
    @Published var isListEmpty = false
    lazy var realm: Realm? = {
        return try? Realm()
    }()
    
    func getGroups() {
      getUserGroups(token: AuthenticationManager.shared.accessToken ?? .empty,
                      id: Int(AuthenticationManager.shared.clientID ?? "1") ?? 1) { items in
            if items.isEmpty {
                self.isListEmpty = true
            } else {
                self.isListEmpty = false
            }
        }
    }
    
    func getUserGroups(
        token: String,
        id: Int,
        completion: @escaping ([Group]) -> Void) {
          if let realm = realm {
            let groupsRealmAr = Array(realm.objects(Group.self))
            if !groupsRealmAr.isEmpty {
                completion(groupsRealmAr)
                return
            }
                } else {
                  
                    print("Ошибка инициализации Realm")
                }
        let path = "/method/groups.get"
        let parameters: Parameters = [
            Constants.accessTokenKey: token,
            "user_id": id,
            "client_id": Secrets.clientID,
            "extended": "1",
            "fields": "name, photo_50, members_count",
            Constants.versionKey: Secrets.version
        ]
        
        let url = Constants.baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
          do {
            let res = try JSONDecoder().decode( GroupResponse.self, from: data).response
            let groups = res.items
            DispatchQueue.main.async {
                if !groups.isEmpty {
                    self.saveData(groups)
                }
                completion(groups)
            }
          } catch {
            print(error)
          }
        }
    }
    
  func getGroupsAll(token: String, completion: @escaping ([Group]) -> Void) {
      let path = "/method/groups.search"
      let parameters: Parameters = [
          "q": "group",
          "type": "group",
          "count": "100",
          "sort": 6,
          Constants.accessTokenKey: token,
          "client_id": Secrets.clientID,
          Constants.versionKey: Secrets.version
      ]

      let url = Constants.baseUrl + path

      AF.request(url, parameters: parameters).responseData { response in
          guard let data = response.value else { return }

          if let groups = try? JSONDecoder().decode(GroupResponse.self, from: data).response.items {
              DispatchQueue.main.async {
                  self.allGroups = groups
                  completion(groups)
              }
          } else {
              print("Ошибка декодирования данных")
          }
      }
  }

    private func saveData <T: Object>(_ sData: [T]) {
        RealmService.shared.saveData(sData)
        getGroups()
    }
    
    func leaveGroup(groupId: Int) {
        
        let path = "/method/groups.leave"
        let url = Constants.baseUrl+path
        let parameters: Parameters = [
            Constants.accessTokenKey: AuthenticationManager.shared.accessToken ?? .empty,
              "group_id": groupId,
              Constants.versionKey: Secrets.version
            ]
        
         AF.request(
            url,
            method: .get,
            parameters: parameters
         ).responseData { response in
            guard response.value != nil else { return }
            print("You have left this group")
         }
    }
    
    func joinGroup(groupId: Int) {
        let path = "/method/groups.join"
        let url = Constants.baseUrl+path
        let parameters: Parameters = [
              Constants.accessTokenKey: AuthenticationManager.shared.accessToken ?? .empty,
              "group_id": groupId,
              Constants.versionKey: Secrets.version
            ]
        
         AF.request(
            url,
            method: .get,
            parameters: parameters
         ).responseData { response in
             guard response.value != nil else { return }
             print("You have joined this group")
         }
    }
}

// MARK: - Constants
private extension GroupViewModel {
    enum Constants {
        static let baseUrl: String = "https://api.vk.com"
        static let friendsGetMethod: String = "/method/friends.get"
        static let accessTokenKey: String = "access_token"
        static let userIdKey: String = "user_id"
        static let clientIdKey: String = "client_id"
        static let groupKey: String = "fields"
        static let versionKey: String = "v"
        static let fieldsValue: String = "photo_100, education"
    }
}
