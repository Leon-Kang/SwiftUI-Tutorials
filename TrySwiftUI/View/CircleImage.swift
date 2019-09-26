//
//  CircleImage.swift
//  44584
//
//  Created by Leon Kang on 2019/9/26.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("what")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
