//
//  NewsAttachmentsPhotos.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 27.02.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct NewsAttachmentsPhotos: View {
    
    @State var photos: [ItemAttachment]
    @State var currentIndex: Int
    @State var currentAmount: CGFloat = 0
    
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(photos.indices, id: \.self){ index in
                WebImage(url: URL(string: (photos[index].photo?.sizes?.last?.url)!))
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .padding()
                        .scaleEffect(1 + currentAmount)
                        .gesture(
                            MagnificationGesture()
                                .onChanged{ value in
                                    currentAmount = value - 1
                                }
                                .onEnded{ value in
                                    withAnimation(.spring()) {
                                        currentAmount = 0
                                    }
                                }
                        )
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}
