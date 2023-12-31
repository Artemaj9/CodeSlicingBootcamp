//
//  PhotosIcon.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 14.12.2023.
//

import SwiftUI
import PureSwiftUI

private let colors: [Color] = [

    .rgb8(245, 143, 46),
    .rgb8(255, 230, 51),
    .rgb8(189, 216, 60),
    .rgb8(97, 186, 120),
    .rgb8(79, 166, 223),
    .rgb8(139, 132, 187),
    .rgb8(198, 128, 183),
    .rgb8(240, 93, 93)
]

struct PhotosIcon: View {
    var body: some View {
        GeometryReader { (geo: GeometryProxy) in
            let petalHeight = geo.widthScaled(0.41)
            let petalWidth = geo.heightScaled(0.27)
            let petalOffset = petalHeight * -0.565
            ZStack {
                RoundedRectangle(geo.widthScaled(0.2))
                    .fillColor(.white)
                ForEach(0..<colors.count) { index in
                    Capsule()
                        .fill(LinearGradient([colors[index],colors[(index+1) % colors.count]], to: .bottom))
                        .frame(petalWidth, petalHeight)
                        .yOffset(petalOffset)
                        .rotate(45.degrees * index)
                        .blendMode(.multiply)

                }
                let insertRadius = petalWidth * 0.5
                let insertOffset = petalOffset + (petalHeight * 0.5) - insertRadius
                Insert(offset: insertOffset, radius: insertRadius)
                    .fillColor(.black, style: .init(eoFill: true))
                    .mask( Insert(offset: insertOffset, radius: insertRadius - 0.2, isMask: true))
                    .opacity(0.2)
            }
        }
    }
}

private struct Insert: Shape {
    let offset: CGFloat
    let radius: CGFloat
    
    var isMask = false
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if !isMask {
            path.rect(rect)
        }
        path.circle(rect.center.yOffset(offset), radius: radius)
        path.circle(rect.center.xOffset(offset), radius: radius)
        
        return path
    }
}

struct PhotosIcon_Previews: PreviewProvider {
    struct PhotosIcon_Harness: View {
        var body: some View {
            VStack {
                PhotosIcon()
                    .frame(400)
                    .greedyFrame()
                HStack {
                    PhotosIcon()
                        .frame(200)
                    PhotosIcon()
                        .frame(50)
                    
                }
            }
                .background(Color(white: 0.1).ignoresSafeArea())
        }
    }
    
    static var previews: some View {
        PhotosIcon_Harness()
            .previewDevice(.iPhone_12_Pro_Max)
    }
}
