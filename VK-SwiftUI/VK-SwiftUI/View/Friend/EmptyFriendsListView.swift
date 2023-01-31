//
//  EmptyFriendsListView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 31.01.2023.
//

import SwiftUI

struct EmptyFriendsListView: View {
    var body: some View {
        VStack{
            Text("Your friends list is empty right now")
                .font(.title2)
                .fontWeight(.semibold)
            Text("🥲")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BackgroundImage())
        
    }
}

struct EmptyFriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFriendsListView()
    }
}
