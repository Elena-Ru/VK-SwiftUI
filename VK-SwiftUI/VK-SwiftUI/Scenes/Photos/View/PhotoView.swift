//
//  PhotoView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 06.01.2023.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

// MARK: - PhotoView
struct PhotoView: View {
  
    // MARK: Properties
    @StateObject var photoViewModel: PhotoViewModel
    @State var currentIndex: Int
    @State var currentAmount: CGFloat = .zero
    
    var body: some View {
        contentView
    }
    
    var contentView: some View {
        TabView(selection: $currentIndex) {
            ForEach(photoViewModel.photos.indices, id: \.self){ index in
                WebImage(url: URL(string: (photoViewModel.photos[index].url)))
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .padding()
                        .scaleEffect(1 + currentAmount)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    currentAmount = value - 1
                                }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        currentAmount = .zero
                                    }
                                })
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

