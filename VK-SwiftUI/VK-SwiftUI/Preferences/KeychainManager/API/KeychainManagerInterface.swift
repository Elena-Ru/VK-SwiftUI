//
//  KeychainManagerInterface.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-01.
//

import Foundation

// MARK: - KeychainManagerInterface
protocol KeychainManagerInterface {
    func save(data: Data, service: String, account: String)
    func read(service: String, account: String) -> Data?
    func delete(service: String, account: String)
}
