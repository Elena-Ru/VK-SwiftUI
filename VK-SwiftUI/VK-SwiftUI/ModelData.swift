//
//  ModelData.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    @Published var friends: [Friend] = [ Friend(1, "Tom", "Cruise", "tom", "Johnson State College", false),
                                         Friend(2, "Коля", "Иванов", "spiderman", "Some University", true),
                                         Friend(3, "Brad", "Pitt", "brad", "Missouri School of Journalism", false),
                                         Friend(4, "Brad", "Croatia", "vkLogo", "school #20", true)
    ]
    @Published var photos: [Photo] = [ Photo(1, "people", 2, true),
                            Photo(2, "tom", 0, false),
                            Photo(3, "spiderman", 3, false),
                            Photo(4, "brad", 122, false),
                            Photo(5, "group", 32, false),
                            Photo(6, "vkLogo", 28, false),
    ]

}



