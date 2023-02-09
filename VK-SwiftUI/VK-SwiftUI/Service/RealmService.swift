//
//  RealmService.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.02.2023.
//

import Foundation
import RealmSwift

class RealmService {
    
   
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
    
    
}
