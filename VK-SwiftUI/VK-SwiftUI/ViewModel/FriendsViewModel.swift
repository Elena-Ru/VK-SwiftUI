//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.01.2023.
//

import Foundation
import Alamofire

class FriendsViewModel: ObservableObject {
  
  @Published var showFavoritesOnly = false
  @Published var filteredFriends: [Friend] = []
  @Published var isListEmpty = false
  @Published var firstLetterArray: [Character] = []
  let baseUrl = "https://api.vk.com"
  let clientId = "51542327"
  private let friendsService = FriendsAdapter()
  
  func getFriends() {
    friendsService.get(token: UserDefaults.standard.string(forKey: "token") ?? "", id: UserDefaults.standard.integer(forKey: "userID")) { items in
      
      self.filteredFriends = items.sorted { $0.lastName.first! < $1.lastName.first!}
      if self.filteredFriends.isEmpty {
        self.isListEmpty = true
      }
      self.firstLetterArray = self.setFirstLetterArray()
    }
  }
  
  func setFirstLetterArray() -> [Character] {
    var firstLetterAr : [Character] = []
    for i in 0..<filteredFriends.count {
      guard !firstLetterAr.contains(filteredFriends[i].lastName.first!) else {
        continue
      }
      firstLetterAr.append(filteredFriends[i].lastName.first!)
    }
    return firstLetterAr
  }
  
  func updateFriends() {
    friendsService.getFromRLM { [self] items in
      self.filteredFriends = items.filter { friend in
        (!self.showFavoritesOnly || friend.isFavorite)
      }
      .sorted { $0.lastName.first! < $1.lastName.first!}
      firstLetterArray = self.setFirstLetterArray()
    }
  }
  
  func deleteFriend(friendId: Int) {
    let path = "/method/friends.delete"
    let url = baseUrl+path
    let parameters: Parameters = [
      "access_token" : UserDefaults.standard.string(forKey: "token") ?? "",
      "user_id": friendId,
      "v": "5.131"
    ]
    
    AF.request(url, method: .get, parameters: parameters).responseData { response in
      guard response.value != nil  else { return}
      print("You have delete this friend")
    }
  }
}
