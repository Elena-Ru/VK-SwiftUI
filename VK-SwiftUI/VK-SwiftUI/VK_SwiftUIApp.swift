//
//  VK_SwiftUIApp.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 02.01.2023.
//

import SwiftUI

@main
struct VK_SwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LoginViewWK()
                .environmentObject(modelData)
        }
    }
}
