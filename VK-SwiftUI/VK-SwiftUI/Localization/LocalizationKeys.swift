//
//  LocalizationKeys.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 20.05.2023.
//

import Foundation

enum Texts {
  enum FriendsVC {
    static var favoritesOnly: String { NSLocalizedString("Favorites", comment: "") }
  }
  
  enum FavoritesGroups {
    static var favGroupsTitle: String { NSLocalizedString("FavGroupsTitle", comment: "") }
  }
  
  enum AllGroups {
    static var allGroupsTitle: String { NSLocalizedString("AllGroupsTitle", comment: "") }
    static var search: String { NSLocalizedString("Search", comment: "") }
  }
  
  enum LaunchScreen {
    static var loading: String { NSLocalizedString("LoadingApp", comment: "") }
  }
  
  enum EmptyFriends {
    static var noFriends: String { NSLocalizedString("NoFriends", comment: "") }
  }
  
  enum EmptyGroups {
    static var noGroups: String { NSLocalizedString("NoGroups", comment: "") }
    static var addGroup: String { NSLocalizedString("AddGroup", comment: "") }
  }
  
  enum NoNetwork {
    static var noNetwork: String { NSLocalizedString("NoNetwork", comment: "") }
  }
  
  enum Alert {
    static var wrongInfo: String { NSLocalizedString("WrongInfo", comment: "") }
    static var alreadyExist: String { NSLocalizedString("isAlreadyExist", comment: "") }
  }
    
  enum Shared {
    static var loading: String { NSLocalizedString("Loading", comment: "") }
    static var friends: String { NSLocalizedString("Friends", comment: "") }
    static var groups: String { NSLocalizedString("Groups", comment: "") }
    static var news: String { NSLocalizedString("News", comment: "") }
  }
}
