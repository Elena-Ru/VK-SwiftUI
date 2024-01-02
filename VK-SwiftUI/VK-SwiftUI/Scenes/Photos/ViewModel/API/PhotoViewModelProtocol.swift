//
//  PhotoViewModelProtocol.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-02.
//

// MARK: - PhotoViewModelProtocol
protocol PhotoViewModelProtocol {
    func getUserPhotos(token: String, idFriend: Int, completion: @escaping ([RLMPhoto]) -> Void)
    func postLike(isLike: inout Int, owner: Int, item: Int)
}
