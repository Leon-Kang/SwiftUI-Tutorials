//
//  TodayDetail.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import SwiftUI

struct TodayDetailView: View {
    @ObservedObject var detail: TodayViewModel
    var animation: Namespace.ID
    
    @State var scale: CGFloat = 1
    
    var body: some View {
        ScrollView {
            VStack {
                GeometryReader { reader in
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(detail.selectItem.contentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "image" + detail.selectItem.id, in: animation)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5, alignment: .center)
                        
                        HStack {
                            Text(detail.selectItem.overlay)
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                withAnimation(.spring()) {
                                    detail.show.toggle()
                                }
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(Color.black.opacity(0.7))
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .clipShape(Circle())
                            })
                        }
                        .padding(.horizontal)
                        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top + 10)
                    }
                    .offset(y: (reader.frame(in: .global).minY > 0 && scale == 1) ? -reader.frame(in: .global).minY : 0)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged(self.onChange(value:))
                                .onEnded(self.onEnd(value:))
                    )
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.6)
                
                HStack {
                    Image(detail.selectItem.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 65, height: 65, alignment: .center)
                        .cornerRadius(15)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(detail.selectItem.title)
                            .fontWeight(.bold)
                        
                        Text(detail.selectItem.category)
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
                .matchedGeometryEffect(id: "content" + detail.selectItem.id, in: animation)
                .padding()
                
                Text(todayContent)
                    .padding()
                
                Button(action: {}) {
                    Label(title: {
                        Text("Share")
                            .foregroundColor(.primary)
                    }) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.primary.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding()
            }
        }
        .scaleEffect(scale)
        .ignoresSafeArea(.all, edges: .top)
    }
}

extension TodayDetailView {
    func onChange(value: DragGesture.Value) {
        let scale = value.translation.height / UIScreen.main.bounds.height
        
        if 1 - scale > 0.75 {
            self.scale = 1 - scale
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.spring()) {
            if scale < 0.9 {
                detail.show.toggle()
            }
            scale = 1
        }
    }
}

struct TodayDetailView_Previews: PreviewProvider {
    
    struct TestView: View {
        @Namespace var id
        @StateObject var model = TodayViewModel()
        var initedModel: TodayViewModel {
            model.selectItem = todayItems[1]
            return model
        }
        
        var body: some View {
            TodayDetailView(detail: initedModel, animation: id)
        }
    }
    static var previews: some View {
        TestView()
    }
}
