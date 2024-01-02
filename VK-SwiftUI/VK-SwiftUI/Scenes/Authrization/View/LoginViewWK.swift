//
//  LoginViewWK.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 10.01.2023.
//
import Combine
import SwiftUI

// MARK: - LoginViewWK
struct LoginViewWK: View {
  
    // MARK: Properties
    var networkMonitor: NetworkMonitorProtocol
    @StateObject var loginVM = LoginViewModel()
    @State private var showLoading = false
    @State private var isConnected = false
    @State private var cancellables = Set<AnyCancellable>()

    // MARK: Initializer
    init(networkMonitor: NetworkMonitorProtocol = NetworkMonitor.shared) {
        self.networkMonitor = networkMonitor
    }

    var body: some View {
        if isConnected {
            if loginVM.isLogin {
                MainView().environmentObject(loginVM)
            } else {
                LoginWebView(showLoading: $showLoading, isLogin: $loginVM.isLogin)
                    .environmentObject(loginVM)
                    .onAppear {
                        DispatchQueue.global(qos: .userInitiated).async {
                            self.cleanRealm()
                        }
                        subscribeToNetworkChanges()
                    }
            }
        } else {
            NoNetworkView().onAppear {
                subscribeToNetworkChanges()
            }
        }
    }
}

// MARK: - Private methods
private extension LoginViewWK {
    func cleanRealm() {
        RealmService.shared.deleteAll()
    }
  
    func subscribeToNetworkChanges() {
        networkMonitor.isConnectedPublisher
            .receive(on: RunLoop.main)
            .sink { isConnected in
                self.isConnected = isConnected
            }
            .store(in: &cancellables)
    }
}
