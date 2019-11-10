//
//  ContentView.swift
//  TeoGuide
//
//  Created by Developer on 11/6/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isProfileShow = false
    
    var cards = cardData
    
    var body: some View {
        VStack {
            TopMenu(isProfileShow: $isProfileShow).padding()
            
            ScrollView() {
                VStack(spacing: 20) {
                    ForEach(cards) { card in
                        CardView(
                            subtitle: card.subtitle,
                            title: card.title,
                            backgroundImage: Image(card.backgroundImage),
                            briefSummary: card.briefSummary,
                            description: card.description
                        )
                    }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .sheet(isPresented: $isProfileShow, content: {
            ProfileView(isProfileShow: self.$isProfileShow)
        })
//        .edgesIgnoringSafeArea(.bottom)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.light)
            
            ContentView().colorScheme(.dark)
        }
    }
}
#endif

struct TopMenu: View {
    @Binding var isProfileShow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .center) {
                
                Spacer()
                
                Button(action: { self.isProfileShow.toggle() }) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

