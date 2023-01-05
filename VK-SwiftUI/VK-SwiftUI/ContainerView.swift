//
//  ContainerView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

struct ContainerView: View {
    @State private var showMainView: Bool = false
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $showMainView)
                NavigationLink(destination: MainView(), isActive: $showMainView) {
                    EmptyView()
                }
            }
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
