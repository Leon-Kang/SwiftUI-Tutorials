//
//  ContentView.swift
//  TestViewBuild
//
//  Created by leon on 2020/11/3.
//

import SwiftUI

struct Container <Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color.blue.opacity(0.3))
            
            VStack {
                Spacer()
                
                content
                    .font(.system(size: 17))
                    .foregroundColor(.secondary)
                    .padding()
                
                Spacer()
                
                Divider()
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "hand.thumbsup")
                    }.frame(width: 150)
                    
                    Divider()
                        .frame(height: 50.0)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "hand.thumbsdown")
                    }.frame(width: 150)
                }
                .font(.system(size: 20))
                .frame(height: 30)
                .padding()
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        Container {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color.orange.opacity(0.5))
                
                VStack {
                    Text("Placeholder")
                        .bold()
                        .font(.system(.title2))
                        .padding()
                    
                    Image(systemName: "person.crop.rectangle")
                        .foregroundColor(.white)
                        .font(.system(size: 200))
                        .padding()
                    
                    Text("Placeholder")
                        .font(.system(.title3))
                        .padding()
                    
                    Text("Placeholder")
                        .font(.system(.body))
                }
            }
        }
    }
}

struct ViewWithoutBody: View {
    var body: some View {
        Container {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color.red.opacity(0.2))
                
                VStack {
                    Image(systemName: "person.crop.rectangle.fill")
                        .foregroundColor(Color.purple.opacity(0.3))
                        .font(.system(size: 200))
                        .padding()
                    
                    Text("Placeholder")
                        .font(.system(.body))
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ViewWithoutBody()
    }
}
