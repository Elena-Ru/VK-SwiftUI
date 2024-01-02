//
//  NetworkMonitorProtocol.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-02.
//

import Combine

// MARK: - NetworkMonitorProtocol
protocol NetworkMonitorProtocol {
    var isConnectedPublisher: AnyPublisher<Bool, Never> { get }
    func startMonitoring()
    func stopMonitoring()
}
