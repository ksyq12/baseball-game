//
//  ScoreCalculator.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/14/25.
//

import Foundation

class ScoreCalculator {
    // 스트라이크와 볼 개수
    var strikeCount = 0
    var ballCount = 0
    
    func calculateStrikeAndBall(userNumArray: [Int], answerNumArray: [Int]) -> (strike: Int, ball: Int) {
        // 스트라이크 및 볼 개수 초기화
        strikeCount = 0
        ballCount = 0
        
        // 스트라이크 및 볼 개수 판별
        for (index, num) in userNumArray.enumerated() {
            if num == answerNumArray[index] {
                strikeCount += 1
            } else if answerNumArray.contains(num) {
                ballCount += 1
            }
        }
        
        return (strikeCount, ballCount)
    }
}
