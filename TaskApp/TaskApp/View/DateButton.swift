//
//  DateButton.swift
//  TaskApp
//
//  Created by leon on 2021/9/13.
//

import SwiftUI

struct DateButton: View {
    var title: String
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        Button(action: {
            homeData.updateDate(value: title)
        }, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(LinearGradient(gradient: Gradient(colors: homeData.checkDate() == title ? [Color("Color"), Color("Color-1")] : [Color.white]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(6)
        })
    }
}

struct DateButton_Preview: PreviewProvider {
    static var previews: some View {
        DateButton(title: "Todaty", homeData: HomeViewModel())
    }
}
