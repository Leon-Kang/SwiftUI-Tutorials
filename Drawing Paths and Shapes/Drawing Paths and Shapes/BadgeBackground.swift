
//
//  BadgeBackground.swift
//  Drawing Paths and Shapes
//
//  Created by LeonKang on 2019/9/28.
//  Copyright © 2019 Leon Kang. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
        var body: some View {
        GeometryReader { geometry in
            Path { path in
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
                path.move(to:
                    CGPoint(
                        x: xOffset + width * 0.95,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                HexagonParameters.points.forEach { (segment) in
                    path.addLine(
                        to: .init(
                            x: xOffset + width * segment.useWidth.0 * segment.xFactors.0,
                            y: height * segment.useHeight.0 * segment.yFactors.0
                        )
                    )
                
                    path.addQuadCurve(
                        to: .init(
                            x: xOffset + width * segment.useWidth.1 * segment.xFactors.1,
                            y: height * segment.useHeight.1 * segment.yFactors.1
                        ),
                        control: .init(
                            x: xOffset + width * segment.useWidth.2 * segment.xFactors.2,
                            y: height * segment.useHeight.2 * segment.yFactors.2
                        )
                    )
                }
            }
            .fill(LinearGradient(
                gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: .init(x: 0.5, y: 0),
                endPoint: .init(x: 0.5, y: 0.6)
            ))
            .aspectRatio(1, contentMode: .fit)
        }
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
