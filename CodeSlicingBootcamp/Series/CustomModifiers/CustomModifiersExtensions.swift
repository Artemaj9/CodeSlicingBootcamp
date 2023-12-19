//
//  CustomModifiersExtensions.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

private let gradient = LinearGradient([Color.red, Color.yellow], to: .trailing)

struct CustomModifiersExtensions: View {
    var body: some View {
        Circle()
//            .fill(gradient)
//            .overlay(Circle().stroke(Color.black, lineWidth: 2))
          
            .strokeWithFill(Color.black, fill: gradient)
           // .shadow(5)
           // .frame(100)
            .grid(4, 5)
            .returnRectangleIf(false)
            .defaultSizeAndShadow()
    }
}

private extension View {
    
    func defaultSizeAndShadow() -> some View {
        shadow(5)
        .frame(100)
    }
    
    @ViewBuilder func returnRectangleIf(_ condition: Bool) -> some View {
        if condition {
            Rectangle()
        } else {
            self
        }
    }
    
    func grid(_ cols: Int, _ rows: Int, spacing: CGFloat = 10) -> some View {
        VStack(spacing: spacing) {
            ForEach(0..<rows) { _ in
                HStack(spacing: spacing) {
                    ForEach(0..<cols) { _ in
                        self
                    }
                }
                
            }
            
        }
    }
}


private extension Shape {
    
    func strokeWithFill<SS: ShapeStyle, FS: ShapeStyle>(_ strokeContents: SS, lineWidth: CGFloat = 2, fill: FS) -> some View {
        self.fill(fill)
        .overlay(self.stroke(strokeContents, lineWidth: lineWidth))
    }
}

struct CustomModifiersExtensions_Previews: PreviewProvider {
    struct ModifierDemo: View {
        var body: some View {
            CustomModifiersExtensions()
        }
    }
    
    
    static var previews: some View {
        ModifierDemo()
    }
}
