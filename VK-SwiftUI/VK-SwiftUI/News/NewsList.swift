//
//  NewsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import SwiftUI

struct NewsList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelData.news) { newsItem in
                    Section {
                        NewsRow(newsItem: newsItem)
                    }
                }
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
            .environmentObject(ModelData())
    }
}
