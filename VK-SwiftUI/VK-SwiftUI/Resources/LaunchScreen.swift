//
//  LaunchScreen.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.02.2023.
//

import SwiftUI

struct LaunchScreen: View {
    
  @State private var loadingText:[String] = Texts.LaunchScreen.loading.map { String($0)}
    @State private var showLoadingText: Bool = false
   private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter : Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchScreen: Bool
    
    var body: some View {
        ZStack{
            Color.theme.ginger
                .ignoresSafeArea()
        
            Image("logo")
              .resizable()
              .frame(width: 150, height: 150)
              .scaledToFit()
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0){
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.heavy)
                                .offset(y: counter == index ? -6 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 140)
        }
        .onAppear{
            showLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchScreen = false
                    }
                } else {
                    counter += 1
                }
            }
        }
        
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(showLaunchScreen: .constant(true))
    }
}
