//
//  TextViews.swift
//  Bullseye
//
//  Created by Flavius on 14/03/2022.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.black)
            .bold()
            .font(.largeTitle)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct smallNumberText: View {
    let text: String
    
    var body: some View {
        
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct HitMeText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title3)
    }
}

struct LabelText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .font(.caption)
            .kerning(1.5)
    }
}

struct NumberText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct ScoreText: View {
    let score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
        
    }
}

struct DateText: View {
    let date: Date
    
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
    }
}

struct BodyText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .foregroundColor(Color("TextColor"))
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12.0)
            .foregroundColor(Color.white)
    }
}

struct LeaderboardTitleText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .fontWeight(.black)
            .font(.title)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelText(text: "score")
            HitMeText(text: "0")
            BodyText(text: "You scored 200 points \n🎉🎉🎉")
            ButtonText(text: "Start New Round!")
            ScoreText(score: 100)
            DateText(date: Date())
            LeaderboardTitleText(text: "leaderboard")
        }
        .padding()
        
        
    }
}
