//
//  EmptyGroupListView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.02.2023.
//

import SwiftUI

struct EmptyGroupListView: View {
    var body: some View {
        VStack{
            Text("Your group list is empty right now")
                .font(.title2)
                .fontWeight(.semibold)
            Text("🥲")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BackgroundImage())
        
    }
}

struct EmptyGroupListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyGroupListView()
    }
}
