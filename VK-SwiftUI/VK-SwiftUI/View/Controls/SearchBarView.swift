//
//  SearchBarView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 12.02.2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor( searchText.isEmpty ? .secondary : Color.theme.control)
            TextField("Search by name...", text: $searchText)
                .autocorrectionDisabled()
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.control)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture{
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                        ,alignment: .trailing
                )
                
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(radius: 10)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
