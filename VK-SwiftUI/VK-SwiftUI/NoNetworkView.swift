//
//  NoNetworkView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 26.01.2023.
//

import SwiftUI

struct NoNetworkView: View {
    var body: some View {
        VStack{
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 160)
                .font(.title)
                .foregroundColor(Color("CustomControlColor"))
            Text("Please, check your connection activity")
        }
    }
}

struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}
