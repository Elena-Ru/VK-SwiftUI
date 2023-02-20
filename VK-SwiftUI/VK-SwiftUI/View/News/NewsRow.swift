//
//  NewsRow.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 05.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NewsRow: View {
    
    @StateObject var newsViewModel:  NewsViewModel
    @State var newsItem: Item
    
    var ownerId: Int {
        newsItem.ownerID ?? 0
    }
    
    var itemId: Int {
        newsItem.id ?? 0
    }
    var index: Int {
        var index = 0
        if newsItem.sourceID < 0 {
            let sourceId = newsItem.sourceID * ( -1)
            index = newsViewModel.newsGroups.firstIndex { $0.id == sourceId}!
        }
        return index
    }
    
    var date: String {
        let timeResult = Double(newsItem.date)
        let date = Date(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        VStack {
          authorInfo
            if let text = newsItem.text {
                Text(text)
                    .textSelection(.enabled)
            }
            if let attachments = newsItem.attachments {
                if let photo = attachments.first?.photo {
                    WebImage(url: URL(string: (photo.sizes?.last?.url)!))
                     .resizable()
                    .scaledToFit()
                }
            }
          controlsArea
        }
    }
    
    var authorInfo: some View {
        HStack() {
            Avatar(avatar: $newsViewModel.newsGroups[index].photo50)
            VStack (alignment: .leading) {
                NameBoldText(name: $newsViewModel.newsGroups[index].name)
                Secondary2lineText(text: date)
            }
            .padding(.leading, 20)
            Spacer()
        }
    }
    var controlsArea: some View {
        HStack {
            LikeNewsControl(idOwner: ownerId, itemId: itemId, isLike: newsItem.likes?.userLikes ?? 0, qty: newsItem.likes?.count ?? 0)
//            LikeNewsControl(isLike: newsItem.likes?.userLikes ?? 0, qty: newsItem.likes?.count ?? 0, idOwner: ownerId, itemId: itemId)
                .modifier(CapsuleControl())
            CommentControl( count: newsItem.comments?.count ?? 0)
            SharedControl( count : newsItem.reposts?.count ?? 0)
            Spacer()
            ViewsControl(count: newsItem.views?.count ?? 0)
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var news = NewsViewModel().news
    static var previews: some View {
        NewsRow( newsViewModel: NewsViewModel(), newsItem: news[0])
            .environmentObject(NewsViewModel())
    }
}







