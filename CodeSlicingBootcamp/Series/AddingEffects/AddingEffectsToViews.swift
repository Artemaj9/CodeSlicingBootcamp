//
//  AddingEffectsToViews.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI
import PureSwiftUI

struct AddingEffectsToViews: View {
    var body: some View {
        /*
        LikeButton()
            .frame(200)
            .shadowColor(.white(0.3), 5)
         */
    //Problem: adds shadow to circle and thumb, this is not good!
            /*Solution 1: in this case we can use becouse we now
             shape, but problem: shadow opacity and view opacity
             doesn't connected when we tap on buton
             */
            //.background(Circle().fill(.white).shadowColor(.white(0.3), 5))
        
        /* Solution 2: drawingGroup() then Shadow
         when we apply drawing group view hierarchy flattened and rasterized to bitmap
         But problem: we can't interact with this view. Ex.: Textfield*/
        
        // ******** TextField and drawingGroup *******
       /*
        TextEntry()
            .frame(300, 100)
            .drawingGroup()
            .shadowColor(.white(0.3), 5)
        */
           // .drawingGroup()
           // .shadowColor(.white(0.3), 5)
        LikeButton()
            .frame(200)
            .compositingGroup()
            .shadowColor(.white(0.3), 5)
    }
}

private struct LikeButton: View {
    
    @State private var isLiked = false
    
    var body: some View {
        GeometryReader { (geo: GeometryProxy) in
            let minDimension = geo.minDimension
            Button {
                isLiked.toggle()
            } label: {
                ZStack {
                    Circle()
                        .fill(.blue)
                    SFSymbol(isLiked ? .hand_thumbsup_fill : .hand_thumbsup)
                        .resizedToFit(minDimension * 0.5)
                        .yOffset(-minDimension * 0.02)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

private struct TextEntry: View {
    
    @State private var text = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(20)
                .foregroundColor(.blue)
            TextField("Enter something awesome", text: $text)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .hPadding()
        }
    }
}

struct AddingEffectsToViews_Previews: PreviewProvider {
    static var previews: some View {
        AddingEffectsToViews()
    }
}
