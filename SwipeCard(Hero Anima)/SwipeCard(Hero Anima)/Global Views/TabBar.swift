//
//  TabBar.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import SwiftUI

struct TabBar: View {
    @StateObject var cardsModel = CardDetailViewModel()
    @Namespace var cardAnimation
    
    var body: some View {
        ZStack {
            TabView {
                // Card
                CardHome(animation: cardAnimation)
                    .environmentObject(cardsModel)
                    .tabItem {
                        Text("testCard")
                    }
                    
                // Today
                
                // Games
                Text("Games")
                    .tabItem {
                        Image("games")
                            .renderingMode(.template)
                        Text("Games")
                    }
                
                Text("Apps")
                    .tabItem {
                        Image("apps")
                            .renderingMode(.template)
                        Text("Apps")
                    }
                Text("Search")
                    .tabItem {
                        Image("search")
                            .renderingMode(.template)
                        Text("Search")
                    }
            }
            
            if cardsModel.showCard {
                CardDetailView(model: cardsModel, animation: cardAnimation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
