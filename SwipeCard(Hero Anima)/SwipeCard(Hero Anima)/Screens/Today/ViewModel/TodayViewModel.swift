//
//  TodayViewModel.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/18.
//

import Foundation

class TodayViewModel: ObservableObject {
    @Published var selectItem: TodayItem = TodayItem(id: "", title: "", category: "", overlay: "", contentImage: "", logo: "")
    @Published var show: Bool = false
}
