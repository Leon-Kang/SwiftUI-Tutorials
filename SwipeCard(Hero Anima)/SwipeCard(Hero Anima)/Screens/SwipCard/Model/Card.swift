//
//  Card.swift
//  SwipeCard(Hero Anima)
//
//  Created by leon on 2021/9/14.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title: String
}
