//
//  FriendService.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

protocol FriendService {
    func getFromRLM(completion: @escaping ([Friend]) -> ())
    func get(token: String, id: Int, completion: @escaping ([Friend]) -> ())
}
