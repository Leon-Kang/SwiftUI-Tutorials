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
    
    @StateObject var todayModel = TodayViewModel()
    @Namespace var todayAnimation
    
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
                TodayHomeView(animation: todayAnimation)
                    .environmentObject(todayModel)
                    .tabItem {
                        Image("today")
                            .renderingMode(.template)
                        
                        Text("Today")
                    }
                
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
            .opacity(todayModel.show ? 0 : 1)
            
            if cardsModel.showCard {
                CardDetailView(model: cardsModel, animation: cardAnimation)
            }
            
            if todayModel.show {
                TodayDetailView(detail: todayModel, animation: todayAnimation)
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
