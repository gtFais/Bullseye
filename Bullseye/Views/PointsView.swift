//
//  PointsView.swift
//  Bullseye
//
//  Created by Flavius on 14/03/2022.
//

import SwiftUI

struct PointsView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: "The Slider's value is ")
            BigNumberText(text: String(Int(sliderValue)))
            BodyText(text: "You scored \(self.game.points(sliderValue: Int(sliderValue))) points \n🎉🎉🎉")
            Button {
                withAnimation {
                    alertIsVisible.toggle()
                }
                game.startNewRound(points: self.game.points(sliderValue: Int(sliderValue)))
            } label: {
                ButtonText(text: "Start New Round!")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
            .preferredColorScheme(.dark)
        PointsView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(true))
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
