//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI


struct GroupsList: View {
    
    @StateObject var groupsViewModel = GroupViewModel()
 
    var body: some View {
        contentView
        .ignoresSafeArea()
        .background(Color(uiColor: .systemBackground))
       
    }
    
    private var contentView: some View {
        NavigationStack {
            ZStack {
                if groupsViewModel.isListEmpty{
                    EmptyGroupListView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    ListOfGroups(groups: groupsViewModel.groups)
                }
            }
            
        }
        .onAppear{
            groupsViewModel.getGroups()
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

