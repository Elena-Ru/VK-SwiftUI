//
//  GroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI
import RealmSwift

struct GroupsList: View {
    @ObservedObject var groupsViewModel = GroupViewModel()
    @ObservedResults(Group.self) var itemGroups
    
    var body: some View {
        contentView
        .ignoresSafeArea()
        .background(Color(uiColor: .systemBackground))
    }
    
    private var contentView: some View {
        NavigationStack {
            ZStack {
                if groupsViewModel.isListEmpty || itemGroups.isEmpty {
                    EmptyGroupListView(groupsViewModel: groupsViewModel)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    ListOfGroups(groupsViewModel: groupsViewModel)
                }
            }
        }
        .onAppear{
            groupsViewModel.getGroups()
        }
        .environmentObject(groupsViewModel) 
    }
}
