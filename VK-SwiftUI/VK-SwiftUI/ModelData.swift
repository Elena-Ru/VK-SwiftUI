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
    
    @Published var groups: [Group] = [ Group(id: 1, groupName: "Swift", subscribersQty: 431213, imageLogo: "group", groupCategory: "Codding"),
                                       Group(id: 2, groupName: "Running", subscribersQty: 12567779, imageLogo: "run", groupCategory: "Heath"),
                                       Group(id: 3, groupName: "Chess", subscribersQty: 23790, imageLogo: "chess", groupCategory: "Game")
    ]
    
    @Published var allGroups: [Group] = [ Group(id: 1, groupName: "Swift", subscribersQty: 431213, imageLogo: "group", groupCategory: "Codding"),
                                        Group(id: 2, groupName: "Running", subscribersQty: 12567779, imageLogo: "run", groupCategory: "Heath"),
                                        Group(id: 3, groupName: "Chess", subscribersQty: 23790, imageLogo: "chess", groupCategory: "Game"),
                                        Group(id: 4, groupName: "Famous", subscribersQty: 7779, imageLogo: "brad", groupCategory: "People"),
                                        Group(id: 5, groupName: "Cod", subscribersQty: 4213, imageLogo: "vkLogo", groupCategory: "Codding")
    ]
    
    @Published var news: [News] = [ News(id: 1, ownerName: "Brad Pitt", date: 237790, ownerAvatar: "brad", text: "first new", attachments: "brad", comments: 23, likes: 123, reposts: 2, views: 345),
                                    News(id: 2, ownerName: "Tom Cruise", date: 233790, ownerAvatar: "tom", text: "Second new", attachments: "tom", comments: 0, likes: 0, reposts: 0, views: 0),
                                    News(id: 3, ownerName: "Chess", date: 237793, ownerAvatar: "chess", text: "Third new", attachments: "chees", comments: 3, likes: 3, reposts: 0, views: 35)
    ]

}



