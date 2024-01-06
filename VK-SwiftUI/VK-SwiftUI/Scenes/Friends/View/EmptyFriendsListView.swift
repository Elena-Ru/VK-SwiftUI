//
//  EmptyFriendsListView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 31.01.2023.
//

import SwiftUI

// MARK: - EmptyFriendsListView
struct EmptyFriendsListView: View {
    var body: some View {
        VStack {
          Text(Texts.EmptyFriends.noFriends)
                .font(.title2)
                .fontWeight(.semibold)
          Text(Constants.sadSmile)
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BackgroundImage())
        
    }
}

// MARK: - Preview
struct EmptyFriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyFriendsListView()
    }
}

// MARK: - Constants
private extension EmptyFriendsListView {
    enum Constants {
        static let sadSmile: String = "🥲"
    }
}
