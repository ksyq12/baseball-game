//
//  NumberBaseballGame.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/10/25.
//

import Foundation

class GameManager {
    let userInputHandler = UserInputHandler()
    let scoreCalculator = ScoreCalculator()
    let numberGenerator = NumberGenerator()
    let gameRecord = GameRecord()
    
    // 현재 게임 시도 횟수
    var attemptCount = 0
    
    // 숫자 야구 게임 시작
    func startNumberBaseballGame() {
        let answerNumArray = numberGenerator.generateUniqueAnswerNumbers()
        
        print("< 게임을 시작합니다 >")
        while true {
            guard let userNumArray = userInputHandler.processUserInput() else { continue }
            
            attemptCount += 1
            
            let (strikeCount, ballCount) = scoreCalculator.calculateStrikeAndBall(userNumArray: userNumArray, answerNumArray: answerNumArray)
            
            if strikeCount == 0 && ballCount == 0 {
                print("Nothing")
            } else {
                print("\(strikeCount)스트라이크 \(ballCount)볼")
            }
            
            // 정답을 맞추었을 경우
            if strikeCount == 3 {
                print("정답입니다!")
                gameRecord.addAttemptCount(attemptCount: attemptCount)
                break
            }
        }
    }
    
    // 게임 기록 출력
    func showRecords() {
        gameRecord.showGameRecords()
    }
}
