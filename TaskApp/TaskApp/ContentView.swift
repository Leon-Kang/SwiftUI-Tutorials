//
//  ContentView.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import SwiftUI
import CoreData

struct ContentView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        HomeView()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
