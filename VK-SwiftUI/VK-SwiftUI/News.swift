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
    var date: Int
    var ownerAvatar: String
    let text: String
    let attachments: String
    let comments: Int
    let likes: Int
    let reposts: Int
    let views: Int
   
    init(id: Int, ownerName: String, date: Int, ownerAvatar: String, text: String, attachments: String, comments: Int, likes: Int, reposts: Int, views: Int) {
        self.id = id
        self.ownerName = ownerName
        self.date = date
        self.ownerAvatar = ownerAvatar
        self.text = text
        self.attachments = attachments
        self.comments = comments
        self.likes = likes
        self.reposts = reposts
        self.views = views
    }
}
