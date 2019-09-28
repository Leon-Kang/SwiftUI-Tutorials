//
//  RotatedBadgeSymbol.swift
//  Drawing Paths and Shapes
//
//  Created by LeonKang on 2019/9/28.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: .init(degrees: 5))
    }
}
