//
//  Group.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import Foundation
import SwiftUI

class Group: Identifiable {
    var id: Int
    var groupName: String
    var subscribersQty: Int
    var imageLogo: String
    
    init(id: Int, groupName: String, subscribersQty: Int, imageLogo: String) {
        self.id = id
        self.groupName = groupName
        self.subscribersQty = subscribersQty
        self.imageLogo = imageLogo
    }

}
