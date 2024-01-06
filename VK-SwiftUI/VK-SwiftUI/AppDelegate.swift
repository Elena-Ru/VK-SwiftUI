//
//  AppDelegate.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 2024-01-05.
//

import UIKit

// MARK: - AppDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      	let center = UNUserNotificationCenter.current()
      	center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
      	  	guard granted else {
                print("Разрешение не получено")
                return
      	  	}
      	  	DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
      	  	}
      	}
      	return true
    }
  
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var token: String = .empty
        for element in 0..<deviceToken.count {
            token += String(format: "%02.2hhx", arguments: [deviceToken[element]])
        }
        print("Токен: \(token)")
    }
  
    func application(
      	_ application: UIApplication,
      	didFailToRegisterForRemoteNotificationsWithError error: Error) {
      	print(error)
    }
}
