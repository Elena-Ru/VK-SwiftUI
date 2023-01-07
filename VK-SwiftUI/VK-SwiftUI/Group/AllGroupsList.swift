//
//  AllGroupsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 07.01.2023.
//

import SwiftUI

struct AllGroupsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.allGroups) { group in
                    AllGroupRow( group: group)
                 }
            }
            .navigationTitle("All Groups")
            .navigationBarTitleDisplayMode(.inline)
        }
        .ignoresSafeArea()
    }
       
}


struct AllGroupsList_Previews: PreviewProvider {
    static var previews: some View {
        AllGroupsList()
            .environmentObject(ModelData())
    }
}
