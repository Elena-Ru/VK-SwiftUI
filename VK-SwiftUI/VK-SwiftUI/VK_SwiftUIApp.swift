//
//  VK_SwiftUIApp.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

@main
struct VK_SwiftUIApp: App {
    @StateObject private var friendsVM = FriendsViewModel()
    @State private var showLaunchScreen: Bool = true
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ZStack {
            LoginViewWK()
            .environmentObject(friendsVM)
                
            ZStack {
                    if showLaunchScreen {
                        LaunchScreen(showLaunchScreen: $showLaunchScreen)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
            
        }
    }
}
