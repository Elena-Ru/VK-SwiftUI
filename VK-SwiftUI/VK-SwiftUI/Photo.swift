//
//  Photo.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import Foundation
import RealmSwift


class FriendPhotoResponse: Decodable {
    let response: FriendsPhotos
}


class FriendsPhotos: Decodable {
    let items: [Photo]
}

class Photo: Object, Decodable {

    @Persisted var id: Int = 0
    @Persisted var url: String = ""
    @Persisted var count: Int = 0
    @Persisted var userLikes: Int = 0
    
    @Persisted var owner: Friend?
    @Persisted var owners = LinkingObjects(fromType: Friend.self, property: "photos")

    
    enum CodingKeys: String, CodingKey{
        case id
        case likes
        case sizes
    }
  
    enum SizeKeys: String, CodingKey{
        case url
    }
    
    enum LikesKeys: String, CodingKey{
        case count
        case userLikes = "user_likes"
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        
        var sizeValues = try values.nestedUnkeyedContainer(forKey: .sizes)
        
        let mSizeValue = try sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let oSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let pSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let qSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let rSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let sSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        let xSizeValue = try? sizeValues.nestedContainer(keyedBy: SizeKeys.self)
        
        if xSizeValue != nil {
            self.url = try xSizeValue!.decode(String.self, forKey: .url)
        } else if sSizeValue != nil {
            self.url = try sSizeValue!.decode(String.self, forKey: .url)
        } else if rSizeValue != nil {
            self.url = try rSizeValue!.decode(String.self, forKey: .url)
        } else if qSizeValue != nil {
            self.url = try qSizeValue!.decode(String.self, forKey: .url)
        } else if pSizeValue != nil{
            self.url = try pSizeValue!.decode(String.self, forKey: .url)
        } else if oSizeValue != nil{
            self.url = try oSizeValue!.decode(String.self, forKey: .url)
        } else {
            self.url = try mSizeValue.decode(String.self, forKey: .url)
        }
      
        let likeValues = try values.nestedContainer(keyedBy: LikesKeys.self, forKey: .likes)
        self.count = try likeValues.decode(Int.self, forKey: .count)
        self.userLikes = try likeValues.decode(Int.self, forKey: .userLikes)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
//import SwiftUI
//
//class Photo: Identifiable {
//    var id: Int
//    var photoName: String
//    var likeQty: Int
//    var isPhotoLike: Bool
//
//    init(_ id: Int, _ photo: String, _ likeQuantity: Int, _ isLike: Bool) {
//        self.id = id
//        self.photoName = photo
//        self.likeQty = likeQuantity
//        self.isPhotoLike = isLike
//    }
//}
