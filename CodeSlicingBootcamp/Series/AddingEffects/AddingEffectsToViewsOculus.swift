//
//  AddingEffectsToViewsOculus.swift
//  CodeSlicingBootcamp
//
//  Created by Artem on 19.12.2023.
//

import SwiftUI

struct AddingEffectsToViewsOculus: View {
    var body: some View {
        ZStack {
            Capsule()
                .frame(200, 120)
            Capsule()
                .fill(.white)
                .frame(120, 40)
        }
        .compositingGroup()
        .opacity(0.5)
    }
}

struct AddingEffectsToViewsOculus_Previews: PreviewProvider {
    static var previews: some View {
        AddingEffectsToViewsOculus()
    }
}
