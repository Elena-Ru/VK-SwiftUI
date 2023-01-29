//
//  NewsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import SwiftUI

struct NewsList: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    @State var news : [Item] = []
    let session = Session.shared
    
    var body: some View {
       contentView
        .onAppear{
            newsViewModel.getNewsPost(token: session.token, id: session.userID) { response in
                self.news = response.items ?? []
            }
        }
        .background(Color(uiColor: .systemBackground))
    }
    
    var contentView: some View {
        NavigationStack {
          listOfNews
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var listOfNews: some View {
        List {
            ForEach(newsViewModel.news) { newsItem in
                Section {
                    NewsRow(newsViewModel: newsViewModel, newsItem: newsItem)
                }
            }
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
            .environmentObject(NewsViewModel())
    }
}
