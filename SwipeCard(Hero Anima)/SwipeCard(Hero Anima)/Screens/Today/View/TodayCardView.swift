//
//  TodayCardView.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import SwiftUI

struct TodayCardView: View {
    var item: TodayItem
    
    @Environment(\.colorScheme) var color
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            Image(item.contentImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image" + item.id, in: animation)
                .frame(width: UIScreen.main.bounds.width - 30)
            
            HStack {
                Image(item.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65, alignment: .center)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .fontWeight(.bold)
                    
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {}, label: {
                        Text("GET")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.primary.opacity(0.1))
                            .clipShape(Capsule())
                    })
                    
                    Text("In App Purchases")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .matchedGeometryEffect(id: "content" + item.id, in: animation)
            .padding()
        }
        .frame(height: 320)
        .background(color == .dark ? Color.black : Color.white)
        .cornerRadius(15)
    }
}

struct TodayCardView_Previews: PreviewProvider {
    
    struct TestView: View {
        @Namespace var id
        @StateObject var mdoel = TodayViewModel()
        
        var body: some View {
            TodayCardView(item: todayItems[1], animation: id)
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
