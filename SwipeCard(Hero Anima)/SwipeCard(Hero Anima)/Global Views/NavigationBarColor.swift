//
//  NavigationBarColor.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {
    init(backgroundColor: UIColor, tintColor: UIColor) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
    }
}

struct NavigationBarColor_Previews: PreviewProvider {
    struct TestView: View {
        var body: some View {
            NavigationView {
                List {
                    ForEach(0 ..< 24, id: \.self, content: { i in
                        NavigationLink("(\(i)", destination: EmptyView())
                    })
                }
                .navigationBarTitle("BAR TITLE")
            }
            .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
        }
    }
    
    static var previews: some View {
        TestView()
    }
}
