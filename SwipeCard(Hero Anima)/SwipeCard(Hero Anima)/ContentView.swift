//
//  ContentView.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = CardDetailViewModel()
    
    var body: some View {
        Home().environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
