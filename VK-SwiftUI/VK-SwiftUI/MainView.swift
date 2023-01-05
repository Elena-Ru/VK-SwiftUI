//
//  MainView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .friends

    enum Tab {
        case groups
        case friends
        case news
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FriendsRow()
                .tabItem({
                    Label("Friends", systemImage: "person.2")
                })
                .tag(Tab.friends)

            GroupRow()
                .tabItem({
                    Label("Groups", systemImage: "person.3")
                })
                .tag(Tab.groups)
            
            NewsRow()
                .tabItem({
                    Label("News", systemImage: "newspaper")
                })
                .tag(Tab.news)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
