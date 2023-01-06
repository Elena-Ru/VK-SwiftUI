//
//  Friend.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import Foundation
import SwiftUI

class Friend: Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var fullName: String = ""
    var isFavorite: Bool
    var education: String

    var photo100: String
    var image: Image {
        Image(photo100)
    }

    init(_ id:Int, _ firstName: String, _ lastName: String,_ education: String, _ photo100: String, _  isFavor: Bool){
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.education = education
        self.photo100 = photo100
        self.fullName = self.firstName + " " + self.lastName
        self.isFavorite = isFavor
    }
}
