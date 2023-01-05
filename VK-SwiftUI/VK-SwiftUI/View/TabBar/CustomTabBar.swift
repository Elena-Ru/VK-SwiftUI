//
//  CustomTabBar.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case friends = "person.2"
    case groups = "person.3"
    case news = "newspaper"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) {
                    tab in
                    Spacer()
                    VStack {
                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.3 : 1.0)
                            .font(.system(size: 22))
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.2)) {
                                    selectedTab = tab
                                }
                        }
                        Text(tab.rawValue == "person.2" ? "friends" : (tab.rawValue == "person.3" ? "groups" : "news" ))
                    }
                    .foregroundColor(selectedTab == tab ? .white: .gray)
                    .padding()
                    Spacer()
                }
            }
            .frame(width: nil, height: 70)
            .background(Color(hex: "#244469"))
            .cornerRadius(26)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.friends))
    }
}
