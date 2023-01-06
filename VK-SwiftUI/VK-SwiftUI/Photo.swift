//
//  Photo.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import Foundation
import SwiftUI

class Photo: Identifiable {
    var id: Int
    var photoName: String
    var likeQty: Int
    var isPhotoLike: Bool
    
    init(_ id: Int, _ photo: String, _ likeQuantity: Int, _ isLike: Bool) {
        self.id = id
        self.photoName = photo
        self.likeQty = likeQuantity
        self.isPhotoLike = isLike
    }
}
