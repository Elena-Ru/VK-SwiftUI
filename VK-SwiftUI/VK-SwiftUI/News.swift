//
//  News.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import Foundation
import SwiftUI

class News: Identifiable {
    var id: Int
    var ownerName: String
    var date: String
    var ownerAvatar: String
    let text: String
    let attachments: String
    var comments: Int
    var likes: Int
    var isUserLike: Bool
    var reposts: Int
    var views: Int
   
    init(id: Int, ownerName: String, date: String, ownerAvatar: String, text: String, attachments: String, comments: Int, likes: Int,isUserLike: Bool, reposts: Int, views: Int) {
        self.id = id
        self.ownerName = ownerName
        self.date = date
        self.ownerAvatar = ownerAvatar
        self.text = text
        self.attachments = attachments
        self.comments = comments
        self.likes = likes
        self.isUserLike = isUserLike
        self.reposts = reposts
        self.views = views
    }
}