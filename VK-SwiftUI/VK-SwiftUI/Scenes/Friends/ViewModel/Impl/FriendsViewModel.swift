//
//  FriendsViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.01.2023.
//

import Foundation
import Alamofire

// MARK: - FriendsViewModel
class FriendsViewModel: ObservableObject {
    // MARK: Properties
    @Published var showFavoritesOnly = false
    @Published var filteredFriends: [Friend] = []
    @Published var isListEmpty = false
    @Published var firstLetterArray: [Character] = []
    private let friendsService = FriendsAdapter()
}

// MARK: - FriendsViewModelProtocol
extension FriendsViewModel: FriendsViewModelProtocol {
  	func getFriends() {
  	    friendsService.get(
            token: AuthenticationManager.shared.accessToken ?? .empty,
  	        id: Int(AuthenticationManager.shared.clientID ?? Constants.defaultClientIdString) ?? Constants.defaultClientId
  	    ) { [weak self] items in
            guard let self = self else { return }
  	        DispatchQueue.main.async {
  	            self.filteredFriends = self.sortFriends(items)
  	            self.isListEmpty = self.filteredFriends.isEmpty
  	            self.firstLetterArray = self.createFirstLetterArray(from: items)
  	        }
  	    }
  	}
	
  	func updateFriends() {
  	    friendsService.getFromRLM { [weak self] items in
            guard let self = self else { return }
  	        DispatchQueue.main.async {
  	            let filtered = items.filter { !(self.showFavoritesOnly) || $0.isFavorite }
  	            self.filteredFriends = self.sortFriends(filtered)
  	            self.firstLetterArray = self.createFirstLetterArray(from: filtered)
  	        }
  	    }
  	}

  	func deleteFriend(friendId: Int) {
  	    let parameters: Parameters = [
            Constants.accessTokenKey: AuthenticationManager.shared.accessToken ?? .empty,
  	        Constants.userIdKey: friendId,
  	        Constants.versionKey: Secrets.version
  	    ]
  	    
  	    AF.request(Constants.baseUrl + Constants.friendsDeleteMethod,
  	               method: .get, 
                   parameters: parameters
        ).responseData { response in
  	        switch response.result {
  	        case .success:
  	            print("You have deleted this friend")
  	        case .failure(let error):
  	            print(error.localizedDescription)
  	        }
  	    }
  	}
}

// MARK: - Private methods
private extension FriendsViewModel {
  	func sortFriends(_ friends: [Friend]) -> [Friend] {
        return friends.sorted { $0.lastName?.first ?? .emptyCharacter < $1.lastName?.first ?? .emptyCharacter }
  	}
  
  	func createFirstLetterArray(from friends: [Friend]) -> [Character] {
        return Set(friends.compactMap { $0.lastName?.first }).sorted()
  	}
}

// MARK: - Constants
private extension FriendsViewModel {
    enum Constants {
        static let baseUrl: String = "https://api.vk.com"
        static let friendsDeleteMethod: String = "/method/friends.delete"
        static let accessTokenKey: String = "access_token"
        static let userIdKey: String = "user_id"
        static let versionKey: String = "v"
        static let defaultClientId: Int = 1
        static let defaultClientIdString: String = "1"
    }
}
