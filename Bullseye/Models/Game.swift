//
//  Game.swift
//  Bullseye
//
//  Created by Flavius on 14/03/2022.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(score: 100)
            addToLeaderboard(score: 80)
            addToLeaderboard(score: 200)
            addToLeaderboard(score: 50)
            addToLeaderboard(score: 20)
            addToLeaderboard(score: 10)
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let result = 100 - abs(sliderValue - target)
        if result == 100 {
            return 200
        } else if result == 99 {
            return result + 50
        } else {
            return result
        }
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        target = Int.random(in: 1...100)
        score += points
        round += 1
        addToLeaderboard(score: points)
    }
    
    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
