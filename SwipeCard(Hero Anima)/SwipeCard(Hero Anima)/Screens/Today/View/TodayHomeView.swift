//
//  TodayHomeView.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import SwiftUI

struct TodayHomeView: View {
    var animation: Namespace.ID
    @EnvironmentObject var detail: TodayViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Placeholder")
                            .foregroundColor(.gray)
                        
                        Text("Today")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                    })
                }
                .padding()
                
//                TodayCardView(item: todayItems[1], animation: animation)
//                    .padding(.horizontal)
//                    .padding(.top)
//                    .onTapGesture {
//                        withAnimation(.spring()) {
//                            detail.selectItem = todayItems[1]
//                            detail.show.toggle()
//                        }
//                    }
                
                
                ForEach(todayItems) { item in
                    if detail.show {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 320)
                            .padding(.horizontal)
                            .padding(.top)
                    } else {
                        TodayCardView(item: item, animation: animation)
                            .padding(.horizontal)
                            .padding(.top)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    detail.selectItem = item
                                    detail.show.toggle()
                                }
                            }
                    }
                }
                
            }
            .padding(.bottom)
        }
        .background(Color.primary.opacity(0.06).ignoresSafeArea())
    }
}

struct TodayHomeView_Previews: PreviewProvider {
    struct TestView: View {
        @Namespace var id
        
        var body: some View {
            TodayHomeView(animation: id)
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
