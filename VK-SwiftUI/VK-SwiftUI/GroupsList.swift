//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct GroupsList: View {
    var body: some View {
        NavigationView {
            List {
                GroupRow()
            }
            .navigationTitle("My Groups")
            .navigationBarTitleDisplayMode(.inline)
        }
        .ignoresSafeArea()
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
    }
}
