//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI


struct GroupsList: View {
    
    @StateObject var groupsViewModel = GroupViewModel()
    let session = Session.shared

    var body: some View {
        contentView
        .ignoresSafeArea()
        .background(Color(uiColor: .systemBackground))
       
    }
    
    private var contentView: some View {
        NavigationStack {
            if let groups = groupsViewModel.groups{
                ListOfGroups(groups: groups)
            }
        }
        .onAppear{
            groupsViewModel.getUserGroups(token: session.token, id: session.userID)
        }
        .environmentObject(groupsViewModel) 
    }
}

struct GroupsList_Previews: PreviewProvider {
    static var previews: some View {
        GroupsList()
            .environmentObject(GroupViewModel())
    }
}

