//
//  PhotoViewModel.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 17.01.2023.
//

import Alamofire
import RealmSwift

// MARK: - PhotoViewModel
final class PhotoViewModel: ObservableObject {
  
    // MARK: Properties
    @Published var photos: [RLMPhoto] = []
}

// MARK: - PhotoViewModelProtocol
extension PhotoViewModel: PhotoViewModelProtocol {
    func getUserPhotos(token: String, idFriend: Int, completion: @escaping ([RLMPhoto]) -> Void) {
        let path = Constants.photoGetMethod
        let parameters: Parameters = [
            Constants.accessTokenKey: token,
            Constants.ownerIdKey: idFriend,
            Constants.albumIdKey: Constants.albumIdValue,
            Constants.extendedKey: Constants.extendedValue,
            Constants.photoSizesKey: Constants.photoSizesValue,
            Constants.clientIdKey: Secrets.clientID,
            Constants.versionKey: Secrets.version
        ]
      
        let url = Constants.baseUrl + path
      
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
          
            if let photos = try? JSONDecoder().decode(FriendPhotoResponse.self, from: data).response.items {
                DispatchQueue.main.async {
                    self.photos = photos
                    RealmService.shared.saveData(photos)
                    completion(photos)
                }
            } else {
                // Обработка ошибки декодирования
                print("Ошибка декодирования данных")
            }
        }
    }
    
  	func postLike(isLike: inout Int, owner: Int, item: Int) {
  	    let path = isLike == Constants.photoLikedByUser ? Constants.likeAddMethod : Constants.likeDeleteMethod
  	    let url = Constants.baseUrl + path
  	    
  	    let parameters: Parameters = [
              Constants.accessTokenKey: AuthenticationManager.shared.accessToken ?? .empty,
  	          Constants.typeKey: Constants.typeValue,
  	          Constants.ownerIdKey: owner,
  	          Constants.itemIdKey: item,
  	          Constants.versionKey: Secrets.version
  	        ]
  	    
  	     AF.request(url, method: .post, parameters: parameters).responseData { response in
  	         guard response.value != nil else { return }
  	         print("Done")
  	     }
  	}
}
// MARK: - Constants
private extension PhotoViewModel {
    enum Constants {
        static let baseUrl: String = "https://api.vk.com"
        static let photoGetMethod: String = "/method/photos.get"
        static let likeAddMethod: String = "/method/likes.add"
        static let likeDeleteMethod: String = "/method/likes.delete"
        static let accessTokenKey: String = "access_token"
        static let versionKey: String = "v"
        static let typeValue: String = "photo"
        static let typeKey: String = "type"
        static let ownerIdKey: String = "owner_id"
        static let itemIdKey: String = "item_id"
        static let albumIdKey: String = "album_id"
        static let albumIdValue: String = "profile"
        static let extendedKey: String = "extended"
        static let extendedValue: String = "likes"
        static let clientIdKey: String = "client_id"
        static let photoSizesKey: String = "photo_sizes"
        static let photoSizesValue: String = "0"
        static let photoLikedByUser: Int = 1
    }
}
