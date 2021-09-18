//
//  CardDetail.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/14.
//

import Foundation

class CardDetailViewModel: ObservableObject {
    
    @Published var cards = [
        Card(cardColor: .blue, title: "card1"),
        Card(cardColor: .purple, title: "card2"),
        Card(cardColor: .green, title: "card3"),
        Card(cardColor: .yellow, title: "card4"),
        Card(cardColor: .orange, title: "card5"),
    ]
    
    @Published var swipedCard = 0
    
    @Published var showCard = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")
    
    @Published var showContent = false
    
    var content = """
                ZStack {
                    VStack {
                        Text("Monday 28 dec")
                            .font(.caption)
                            .foregroundColor(Color.white.opacity(0.85))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.top, 10)
                            .matchedGeometryEffect(id: "Date-\("model.selectedCard.id")", in: animation)
                        
                        HStack {
                            Text(model.selectedCard.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 250, alignment: .leading)
                                .padding()
                                .matchedGeometryEffect(id: "Title-\("model.selectedCard.id")", in: animation)
                            
                            Spacer(minLength: 0)
                        }
                        
                        if model.showContent {
                            Text(model.content)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .animation(.easeIn)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        model.selectedCard.cardColor
                            .cornerRadius(25)
                            .matchedGeometryEffect(id: "bgColor-\("model.selectedCard.id")", in: animation)
                            .ignoresSafeArea(.all, edges: .bottom)
                    )
                    
                    VStack {
                        Spacer()
                        
                        if model.showContent {
                            Button(action: closeView) {
                                Image(systemName: "arrow.down")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.blue)
                                    .padding()
                                    .background(Color.white.opacity(0.6))
                                    .clipShape(Circle())
                                    .padding(5)
                                    .background(Color.white.opacity(0.7))
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                            }
                            .padding(.bottom)
                        }
                    }
                }
        """
    
}
