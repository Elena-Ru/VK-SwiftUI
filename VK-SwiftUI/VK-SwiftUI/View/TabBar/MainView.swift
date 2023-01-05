//
//  MainView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .friends
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selection) {
                    switch selection {
                    case .friends :
                        FriendsRow()
                            .tag(Tab.friends)
                    case .groups:
                        GroupRow()
                            .tag(Tab.groups)
                    case .news:
                        NewsRow()
                            .tag(Tab.news)
                    }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selection)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
