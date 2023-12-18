//
//  PolarLayoutGuides.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

private let numSegments = 12
private let innerRadiusRatio: CGFloat = 0.4
private let strokeStyle = StrokeStyle(lineWidth: 1, lineJoin: .round)
private let starLayoutConfig = LayoutGuideConfig.polar(rings: [0, innerRadiusRatio, 1], segments: 12)

struct StarNative: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let outerRadius = min(rect.height, rect.width) / 2
        let innerRadius = outerRadius * innerRadiusRatio
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let stepAngle = 2 * .pi / CGFloat(numSegments)
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        for index in 0..<numSegments {
            
            let angle = CGFloat(index) * stepAngle
            let radius = index.isMultiple(of: 2) ? outerRadius : innerRadius
            let xOffset = radius * sin(angle)
            let yOffset = radius * cos(angle)
            
            path.addLine(to: CGPoint(x: center.x + xOffset, y: center.y - yOffset))
        }
        path.closeSubpath()
        
        return path
    }
}

struct Star: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var g = starLayoutConfig.layout(in: rect)
        
        path.move(g[2, 0])
        for segment in 1..<g.yCount {
            path.line(g[segment.isOdd ? 1 : 2, segment])
        }
        path.closeSubpath()
        return path
    }
}


struct Polygon: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
       // var g = starLayoutConfig.layout(in: rect)
        var g = LayoutGuide.polar(rect, rings: 1, segments: 3)
        path.move(g[1, 0])
        for segment in 1..<g.yCount {
            path.line(g[1, segment])
        }
        path.closeSubpath()
        return path
    }
}

struct PolarLayoutGuides: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PolarLayoutGuides_Previews: PreviewProvider {
    struct PolarLayoutStar: View {
        
        var body: some View {
            VStack(spacing: 50) {
                Group {
                    StarNative()
                        .stroke(style: strokeStyle)
                    
                    Star()
                        .stroke(style: strokeStyle)
                        .layoutGuide(starLayoutConfig)
                    
                    Polygon()
                        .stroke(style: strokeStyle)
                        .layoutGuide(.polar(rings: 1, segments: 3))
                }
                .frame(150)
            }
        }
        
    }
    
    static var previews: some View {
      PolarLayoutStar()
            .padding()
            .previewSizeThatFits()
            .showLayoutGuides(true)
            
        }
    }
