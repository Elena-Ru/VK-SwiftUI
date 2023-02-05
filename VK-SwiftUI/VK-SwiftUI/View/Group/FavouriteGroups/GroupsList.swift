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
//    @StateObject var groupsViewModel = GroupViewModel()
//    @ObservedResults(Group.self) var itemGroups
 
    var body: some View {
        contentView
        .ignoresSafeArea()
        .background(Color(uiColor: .systemBackground))
       
    }
    
    private var contentView: some View {
        NavigationStack {
            ZStack {
                if groupsViewModel.isListEmpty{
                    EmptyGroupListView(groupsViewModel: groupsViewModel)
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    ListOfGroups(groupsViewModel: groupsViewModel)
//                    ListOfGroups(groupsViewModel: groupsViewModel, groups: groupsViewModel.groups)
                }
            }
            
        }
        .onAppear{
            groupsViewModel.getGroups()
        }
        .environmentObject(groupsViewModel) 
    }
}

//struct GroupsList_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupsList()
//            .environmentObject(GroupViewModel())
//    }
//}

