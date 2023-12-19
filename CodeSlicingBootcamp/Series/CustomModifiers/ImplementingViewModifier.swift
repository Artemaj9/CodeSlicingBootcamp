//
//  ImplementingViewModifier.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

private let gradient = LinearGradient([Color.red, Color.yellow], to: .bottomTrailing)

struct ImplementingViewModifier: View {
    var body: some View {

        VStack {
            Rectangle()
                .innerShadow(fill: gradient, radius: 5, offset: .point(12))
//                .fill(gradient)
//                .overlay(
//                    ZStack {
//                        Circle().fill(Color.gray)
//                        Circle().fill(Color.white)
//                            .blur(5)
//                            .offset(1, 1)
//                    }
//                        .clipShape(Circle())
//                        .drawingGroup()
//                        .blendMode(.multiply)
//                )
                .frame(200)
        }
    }
}

private struct InnerShadowShapeModifier<S: Shape>: ViewModifier {
    
    let shape: S
    let radius: CGFloat
    let offset: CGPoint
    
    func body(content: Content) -> some View {
        content.overlay(
            ZStack {
                shape.fill(Color.gray)
                shape.fill(Color.white)
                    .blur(radius)
                    .offset(offset)
            }
            .clipShape(shape)
            .drawingGroup()
            .blendMode(.multiply)
        )
    }
}

private extension Shape {
    
    func innerShadow<FS: ShapeStyle> (fill: FS, radius: CGFloat, offset: CGPoint = .zero) -> some View {
        self.fill(fill)
            .modifier(InnerShadowShapeModifier(shape: self, radius: radius, offset: offset))
    }
    
    
    func innerShadow<FS: ShapeStyle> (fill: FS, radius: CGFloat, offsetAngle: Angle, offset: CGFloat = .zero) -> some View {
        innerShadowWithExtension(fill: fill, radius: radius, offset: .point(offset, offsetAngle))
  
    }
    
    func innerShadowWithExtension<FS: ShapeStyle> (fill: FS, radius: CGFloat, offset: CGPoint = .zero) -> some View {
        self.fill(fill)
            .overlay(
                ZStack {
                    self.fill(Color.gray)
                    self.fill(Color.white)
                        .blur(radius)
                        .offset(offset)
                }
                .clipShape(self)
                .drawingGroup()
                .blendMode(.multiply)
            )
    }
}


struct ImplementingViewModifier_Previews: PreviewProvider {
    struct ImplementingViewModifier_Harness: View {
        var body: some View {
            ImplementingViewModifier()
        }
    }
    
    static var previews: some View {
        ImplementingViewModifier_Harness()
    }
}
