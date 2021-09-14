//
//  CardView.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/14.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var model: CardDetailViewModel
    var card: Card
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Text("Monday 28 De")
                .font(.caption)
                .foregroundColor(Color.white.opacity(0.85))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top, 10)
                .matchedGeometryEffect(id: "Date-\(card.id)", in: animation)
            
            VStack {
                HStack {
                    Text(card.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(card.id)", in: animation)
                    
                    Spacer(minLength: 0)
                }
                
                Text(model.content)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 250, alignment: .leading)
                    .padding()
                    .matchedGeometryEffect(id: "Content-\(model.selectedCard.id)", in: animation)
            }
            
            Spacer(minLength: 0)
            
            HStack {
                Spacer(minLength: 0)
                
                if !model.showContent {
                    Text("Read More")
                    
                    Image(systemName: "arrow.right")
                }
            }
            .foregroundColor(Color.white.opacity(0.9))
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            card.cardColor
                .cornerRadius(16)
                .matchedGeometryEffect(id: "bgColor-\(card.id)", in: animation)
        )
        .onTapGesture {
            withAnimation(.spring()) {
                model.selectedCard = card
                model.showCard.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeIn) {
                        model.showContent = true
                    }
                }
            }
        }
    }
}

struct CardView_Preview: PreviewProvider {
    
    struct TestView: View {
        @Namespace var id
        @StateObject var mdoel = CardDetailViewModel()
        
        var body: some View {
            CardView(card: mdoel.cards[0], animation: id).environmentObject(CardDetailViewModel())
        }
        
    }
    
    static var previews: some View {
        TestView()
    }
}

