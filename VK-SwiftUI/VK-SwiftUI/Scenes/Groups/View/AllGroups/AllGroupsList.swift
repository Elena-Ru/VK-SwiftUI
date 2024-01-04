//
//  AllGroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI
import AlertX
import RealmSwift

struct AllGroupsList: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var groupsViewModel : GroupViewModel
    @ObservedResults(Group.self) var itemGroups
    @State var allGroups : [Group] = []
    @State var isAlreadyExist: Bool = false
    @State var searchText : String = .empty
    
    var body: some View {
        contentView
            .onAppear{
                groupsViewModel.getGroupsAll(token: AuthenticationManager.shared.accessToken ?? .empty) { items in
                    self.allGroups = items
                }
            }
            .ignoresSafeArea()
    }
    
    var contentView: some View {
        NavigationView {
            List {
                ForEach(filteredGroups) { group in
                    AllGroupRow(groupsViewModel: groupsViewModel, group: group)
                        .onTapGesture {
                            if (itemGroups.first(where: { $0.id == group.id
                            }) != nil) {
                                isAlreadyExist = true
                                print("Already contains")
                            } else {
                                $itemGroups.append(group)
                                groupsViewModel.joinGroup(groupId: group.id)
                                groupsViewModel.getGroups()
                                self.presentation.wrappedValue.dismiss()
                            }
                        }
                }
                .alertX(isPresented: $isAlreadyExist, content: {
                  AlertX(
                      title: Text(Texts.Alert.alreadyExist),
                      theme: .cherry(withTransparency: true, roundedCorners: true))
                })
                .searchable(text: $searchText)
                .background(Color(uiColor: .systemBackground))
                .navigationTitle(Texts.AllGroups.allGroupsTitle)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
    
    var filteredGroups: [Group] {
        if searchText.isEmpty {
            return allGroups
        } else {
            return allGroups.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
}

