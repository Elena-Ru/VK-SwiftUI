//
//  RealmService.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.02.2023.
//

import RealmSwift

// MARK: - RealmService
final class RealmService {
  
    // MARK: Properties
    static let shared = RealmService()
    
    // MARK: Initializer
    private init() {}

    // MARK: Methods
  	func deleteAll() {
  	  	do {
            let realm = try Realm()
            try? realm.write {
              realm.deleteAll()
            }
  	  	} catch {
            print(error)
  	  	}
  	}
    
    func saveData <T: Object>(_ sData: [T]) {
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
    
  func isFavorite(friend: RLMFriend) {
      do {
          let realm = try Realm()
          if let friendObject = realm.object(ofType: RLMFriend.self, forPrimaryKey: friend.id) {
              if let thawedFriend = friendObject.thaw() {
                  try realm.write {
                      thawedFriend.isFavorite.toggle() 
                  }
              }
          }
      } catch {
          print(error)
      }
  }

}
