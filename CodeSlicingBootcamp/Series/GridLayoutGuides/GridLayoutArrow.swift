//
//  GridLayoutArrow.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

private let strokeStyle = StrokeStyle(lineWidth: 1, lineJoin: .round)
private let shoulderRatio: CGFloat = 0.65
private let arrowLayoutConfig = LayoutGuideConfig.grid(columns: [0, shoulderRatio, 1], rows: 3)


struct ArrowNative: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let shoulderX = rect.minX + (rect.width * shoulderRatio)
        let rowHeight = rect.height / 3
        let row1Y = rect.minY + rowHeight
        let row2Y = row1Y + rowHeight
        
        path.move(to: CGPoint(x: rect.minX, y: row1Y))
        path.addLine(to: CGPoint(x: shoulderX, y: row1Y))
        path.addLine(to: CGPoint(x: shoulderX, y: rect.minY))
        path.addLine(to: CGPoint(x: shoulderX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: shoulderX, y: rect.maxY))
        path.addLine(to: CGPoint(x: shoulderX, y: row2Y))
        path.addLine(to: CGPoint(x: rect.minX, y: row2Y))
        path.closeSubpath()
        
        
        return path
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var g = arrowLayoutConfig.layout(in: rect)
        
        path.move(g[0, 1])
        path.line(g[1, 1])
        path.line(g[1, 0])
        path.line(g.trailing)
        path.line(g[1, 3])
        path.line(g[1, 2])
        path.line(g[0, 2])
        
        path.closeSubpath()
        
        return path
    }
}

struct GridLayoutArrow: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GridLayoutArrow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            Group {
                ArrowNative()
                    .stroke(style: strokeStyle)
                    .border(.black.opacity(0.2))
                    .frame(200, 100)
                Arrow()
                    .stroke(style: strokeStyle)
                    .layoutGuide(arrowLayoutConfig)
                    .showLayoutGuides(true)
                    .frame(200, 100)
            }
        }
        //.frame(200, 100)
        .padding()
        .previewSizeThatFits()
    }
}
