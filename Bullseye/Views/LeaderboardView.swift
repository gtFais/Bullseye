//
//  Leaderboard.swift
//  Bullseye
//
//  Created by Flavius on 15/03/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10.0) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView(score: 1, date: Date())
                ScrollView {
                    VStack(spacing: 10.0) {
                        ForEach (game.leaderboardEntries.indices) { entry in
                            RowView(index: entry + 1, score: game.leaderboardEntries[entry].score, date: game.leaderboardEntries[entry].date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    LeaderboardTitleText(text: "leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    LeaderboardTitleText(text: "leaderboard")
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundendImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }

            }
            .padding(.top)
        }
    }
}

struct LabelView: View {
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "SCORE")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelText(text: "DATE")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(index: index)
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
