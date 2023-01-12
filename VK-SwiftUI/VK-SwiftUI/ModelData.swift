//
//  ModelData.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    let apiManager = APIManager()
    let session = Session.shared
    
    @Published var loggedIn = false
    
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
    
    @Published var news: [News] = [ News(id: 0, ownerName: "Brad Pitt", date: "237790", ownerAvatar: "brad", text: "The first new", attachments: "brad", comments: 23, likes: 123, isUserLike: true, reposts: 2, views: 345),
                                    News(id: 1, ownerName: "Tom Cruise", date: "237790", ownerAvatar: "tom", text: "The second new", attachments: "tom", comments: 0, likes: 0, isUserLike: false, reposts: 0, views: 0),
                                    News(id: 2, ownerName: "Chess", date: "237790", ownerAvatar: "chess", text: "The third new", attachments: "chess", comments: 3, likes: 3, isUserLike: false, reposts: 0, views: 35)
    ]
  
    public func fetchFriends() {
        apiManager.getFriendsList(token: session.token, id: session.userID)
    }

}



