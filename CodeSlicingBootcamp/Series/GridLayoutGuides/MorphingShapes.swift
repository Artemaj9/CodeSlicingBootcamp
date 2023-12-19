////
////  MorphingShapes.swift
////  CodeSlicingBootcamp
////
////  Created by Artem on 19.12.2023.
////
//
//import SwiftUI
//import PureSwiftUI
//
//private let strokeStyle = StrokeStyle(lineWidth: 1, lineJoin: .round)
//private let shoulderRatio: CGFloat = 0.65
//private let arrowLayoutConfig = LayoutGuideConfig.grid(columns: [0, 1 - shoulderRatio,  shoulderRatio, 1], rows: 3)
//
//struct MorphingArrow: Shape {
//    private var  factor: Double
//    
//    init(pointingRight: Bool = true) {
//        self.factor = pointingRight ? 0 : 1
//    }
//    
//    var animatableData: Double {
//        get {
//            factor
//        }
//        
//        set {
//            factor = newValue
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        var g = arrowLayoutConfig.layout(in: rect)
//        
//        
//        let factor = 1
//      //  let point = g.topLeading.to(g.topTrailing, 0.5)
//        
//        //path.ellipse(point, .square(20), anchor: .center)
//        
//        path.move(g[0, 1].to(g[1, 0], factor))
//       //∫ path.line(g[2, 1].to(g[1, 1], factor))
//        //path.line(g[2, 0].to(g[3, 1], factor))
//        path.line(g.trailing)
//        path.line(g[2, 3].to(g[3, 2], factor))
//       // path.line(g[2, 2].to(g[1, 2], factor))
//       // path.line(g[0, 2].to(g[1, 3], factor))
//        path.line(g.leading)
//        
//        path.closeSubpath()
//        
//        return path
//    }
//}
//
//
//struct MorphingLayoutArrow_Previews: PreviewProvider {
//    @State private var pointingRight = true
//    static var previews: some View {
//        VStack(spacing: 50) {
//            Group {
//
//                MorphingArrow(pointingRight: MorphingArrow(pointingRight: poin))
//                MorphingArrow(pointingRight: point)
//                    .stroke(style: strokeStyle)
//                    .layoutGuide(arrowLayoutConfig)
//                    .showLayoutGuides(true)
//                    .frame(200, 100)
//            }
//        }
//        //.frame(200, 100)
//        .padding()
//        //.previewSizeThatFits()
//    }
//}

