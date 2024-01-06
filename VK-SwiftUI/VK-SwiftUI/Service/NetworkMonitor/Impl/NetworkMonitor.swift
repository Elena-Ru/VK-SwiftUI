//
//  NetworkMonitor.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 26.01.2023.
//
import Combine
import Network

// MARK: - NetworkMonitor
final class NetworkMonitor: NetworkMonitorProtocol {
  
    // MARK: Properties
    static let shared = NetworkMonitor()
    private let networkMonitor = NWPathMonitor()
    private let isConnectedSubject = CurrentValueSubject<Bool, Never>(false)
    var isConnectedPublisher: AnyPublisher<Bool, Never> {
        isConnectedSubject.eraseToAnyPublisher()
    }
  
    // MARK: Initializer
    private init() {
      startMonitoring()
    }
  
    // MARK: Methods
    func startMonitoring() {
      	networkMonitor.pathUpdateHandler = { [weak self] path in
      	    self?.isConnectedSubject.send(path.status == .satisfied)
      	}
      	networkMonitor.start(queue: DispatchQueue(label: "NetworkMonitor"))
    }
    
    func stopMonitoring() {
        networkMonitor.cancel()
    }
}
