//
//  NewsList.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 08.01.2023.
//

import SwiftUI

struct NewsList: View {
    @StateObject var newsViewModel = NewsViewModel()
    
    var body: some View {
       contentView
        .background(Color(uiColor: .systemBackground))
    }
    
    var contentView: some View {
        NavigationStack {
            ZStack {
                listOfNews
                    .onAppear{
                        newsViewModel.getNews()
                    }
                    .navigationTitle(Texts.Shared.news)
                    .navigationBarTitleDisplayMode(.inline)
                if newsViewModel.isLoading {
                  ProgressView(Texts.Shared.loading)
                }
            }
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
