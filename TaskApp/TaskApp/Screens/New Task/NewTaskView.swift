//
//  NewTaskView.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import SwiftUI

struct NewTaskView: View {
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            HStack {
                Text("Add New Task")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .padding(.top, 16)
                
                Spacer(minLength: 16)
                    .padding()
            }
            
            TextEditor(text: $homeData.content)
                .accentColor(.accentColor)
                .cornerRadius(8.0)
                .padding()
            
            Divider()
                .padding(.horizontal, 0.0)
            
            Text("When")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            HStack(alignment: .center, spacing: 10) {
                DateButton(title: "Today", homeData: homeData)
                DateButton(title: "TMR", homeData: homeData)
                
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            .padding()
            
            Button(action: {
                homeData.writeDate(context: context)
            }) {
                Label(
                    title: {
                        Text(homeData.updateItem == nil ? "Add Now" : "Update")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    },
                    icon: {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 48.0)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Color"), Color("Color-1")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(8)
            }
            .padding()
            .disabled(homeData.content == "")
            .opacity(homeData.content == "" ? 0.5 : 1.0)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(homeData: HomeViewModel())
    }
}
