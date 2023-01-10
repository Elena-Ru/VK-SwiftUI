//
//  ViewsControl.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 09.01.2023.
//

import SwiftUI

struct ViewsControl: View {
    @EnvironmentObject var modelData: ModelData
    var newsItem: News
    var index: Int {
        modelData.news.firstIndex(where: { $0.id == newsItem.id
        })!
    }
    var body: some View {
        Label("\(modelData.news[index].reposts)", systemImage: "eye")
            .modifier(CapsuleControl())
    }
}


struct ViewsControl_Previews: PreviewProvider {
    static var news = ModelData().news
    static var previews: some View {
        ViewsControl(newsItem: news[0])
            .environmentObject(ModelData())
    }
}
