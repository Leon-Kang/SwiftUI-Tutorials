//
//  ContentView.swift
//  44584
//
//  Created by Leon Kang on 2019/9/26.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Hello World")
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                    .underline(true, color: .black)
                HStack {
                    Text("1.0")
                        .font(.title)
                    Spacer()
                    Text("2.0")
                        .font(.subheadline)
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
