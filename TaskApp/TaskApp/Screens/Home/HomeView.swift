//
//  Home.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @StateObject var homeData = HomeViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            VStack(alignment: .center, spacing: 0, content: {
                HStack {
                    Text("Task")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                if results.isEmpty {
                    Spacer()
                    
                    Text("NO Tasks")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(alignment: .leading, spacing: 16, content: {
                            ForEach(results) { task in
                                TaskCellView(homeData: homeData, task: task)
                            }
                        })
                    }
                    .padding()
                }
            })
            Button(action: {
                homeData.isNewData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(AngularGradient(gradient: Gradient(colors: [Color("Color"), Color("Color-1")]), center: .center))
                    .clipShape(Circle())
            })
            .padding()
        })
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $homeData.isNewData, onDismiss: {
            homeData.updateItem = nil
            homeData.content = ""
            homeData.date = Date()
        }) {
            NewTaskView(homeData: homeData)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
