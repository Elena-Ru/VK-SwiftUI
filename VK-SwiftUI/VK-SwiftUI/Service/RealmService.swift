  //
//  RealmService.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.02.2023.
//

import RealmSwift

final class RealmService {
  	func deleteAll() {
  	  	do{
            let realm = try Realm()
            try? realm.write {
              realm.deleteAll()
            }
  	  	} catch {
            print(error)
  	  	}
  	}
    
    func saveData  <T: Object>(_ sData: [T]) {
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
        let realm = try! Realm()
        let friend = realm.objects(RLMFriend.self).where{$0.id == friend.id}
        let friendR = friend.thaw()
        do {
            realm.beginWrite()
            if friend[0].isFavorite {
                friendR?.setValue(false, forKey: "isFavorite")
            } else {
                friendR?.setValue(true, forKey: "isFavorite")
            }
            realm.add(friendR!, update: .modified)            
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
