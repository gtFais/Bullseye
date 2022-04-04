//
//  Shapes.swift
//  Bullseye
//
//  Created by Flavius on 14/03/2022.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200.0, height: 100.0)
                    .transition(.opacity)
            }
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
                .animation(.easeInOut, value: wideShapes)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100.0, height: 100.0)
            Button {
                withAnimation {
                    wideShapes.toggle()
                }
            } label: {
                Text("Animate!")
            }

        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
