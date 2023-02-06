//
//  EmptyGroupListView.swift
//  VK-SwiftUI
//
//  Created by Елена Русских on 03.02.2023.
//

import SwiftUI

struct EmptyGroupListView: View {
    
    @State var animate: Bool = false
    @ObservedObject var groupsViewModel : GroupViewModel
    
    var body: some View {
        VStack{
            Text("Your group list is empty right now")
                .font(.title2)
                .fontWeight(.semibold)
            NavigationLink {
                AllGroupsList(groupsViewModel: groupsViewModel)
            } label: {
                Text("Lets add one 🥳")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(animate ? Color.theme.ginger : .orange )
                    .cornerRadius(12)
                    .padding(.horizontal, animate ? 30 : 50)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ?  -10 : 0)
                    .shadow(color: animate ? Color.theme.ginger.opacity(0.7) : .orange.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ?  30: 10)
            }
            .padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(BackgroundImage())
        .onAppear(perform: addAnimation)
        .navigationTitle("My Groups")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct EmptyGroupListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyGroupListView( groupsViewModel: GroupViewModel())
    }
}
