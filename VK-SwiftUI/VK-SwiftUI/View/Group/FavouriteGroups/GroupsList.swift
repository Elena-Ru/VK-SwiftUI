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
            ZStack {
                if groupsViewModel.groups.count > 0{
                    ListOfGroups(groups: groupsViewModel.groups)
                } else {
                    EmptyGroupListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                }
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

