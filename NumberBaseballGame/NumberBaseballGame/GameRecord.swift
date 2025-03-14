//
//  GameRecord.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/14/25.
//

import Foundation

class GameRecord {
    // 게임 별 시도 횟수 저장 배열
    var attemptCountsPerGame: [Int] = []
    
    // 시도 횟수 저장
    func addAttemptCount(attemptCount: Int) {
        attemptCountsPerGame.append(attemptCount)
    }
    
    // 게임 기록 출력
    func showGameRecords() {
        print("< 게임 기록 보기 >")
        for (index, item) in attemptCountsPerGame.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(item)")
        }
    }
}
