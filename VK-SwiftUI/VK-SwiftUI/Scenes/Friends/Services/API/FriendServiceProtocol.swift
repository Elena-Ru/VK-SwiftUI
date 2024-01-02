//
//  FriendService.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

// MARK: - FriendService
protocol FriendServiceProtocol {
    func getFromRLM(completion: @escaping ([Friend]) -> ())
    func get(token: String, id: Int, completion: @escaping ([Friend]) -> ())
}
