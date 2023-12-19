//
//  HeartShape.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

private let heartColor = Color(red: 225 / 255, green: 40 / 255, blue: 48 / 255)
private let heartLayoutConfig = LayoutGuideConfig.grid(columns: 8, rows: 10)
private typealias Curve = (p: CGPoint, cp1: CGPoint, cp2: CGPoint)



private struct Heart: Shape {
    
    let debug: Bool
    
    init(debug: Bool = false) {
        self.debug = debug
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        var g = heartLayoutConfig.layout(in: rect)
        
        let p1 = g[0, 3]
        let p2 = g[4, 2]
        let p3 = g[8, 3]
        let p4 = g[4, 10]
        
        var curves = [Curve]()
        // c1
        curves.append(
        Curve(p2,
              g[0,0],
              g[3,-1]))
        
        // c2
        curves.append(
        Curve(p3,
              g[5, -1],
              g[8, 0]))
        
        // c3
        curves.append(
        Curve(p4,
              g[8,5],
              g[5, 7]))
        
        // c3
        curves.append(
        Curve(p1,
              g[3,7],
              g[0, 5]))
        
        path.move(p1)
        
        
        for curve in curves {
            path.curve(curve.p, cp1: curve.cp1, cp2: curve.cp2, showControlPoints: true)
        }
        
        
        return path
    }
}




struct HeartShape_Previews: PreviewProvider {
    struct HeartShape: View {
        var body: some View {
            VStack(spacing: 50) {
                Heart()
                    .fill(heartColor)
                    .frame(200)
                ZStack {
                    Image("heart")
                        .resizedToFit(200)
                    Heart()
                        .stroke(.black, lineWidth: 2)
                        .layoutGuide(heartLayoutConfig)
                        .frame(200)
                }
            }
        }
    }
    
    static var previews: some View {
        HeartShape()
            .padding(50)
            .previewSizeThatFits()
            .showLayoutGuides(true)
    }
}
