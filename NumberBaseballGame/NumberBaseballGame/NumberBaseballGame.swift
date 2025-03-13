//
//  NumberBaseballGame.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/10/25.
//

import Foundation

class NumberBaseballGame {
    // 사용할 숫자 배열
    var numArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    // 사용자 입력 숫자 배열
    var userNumArray: [Int] = []
    // 정답 숫자 배열
    var answerNumArray: [Int] = []
    // 임시 숫자 저장 변수
    var randomNumber = 0
    var remainingNumber = 0
    // 스트라이크와 볼 개수
    var strikeCount = 0
    var ballCount = 0
    // 게임 별 시도 횟수 저장 배열
    var attemptCountsPerGame: [Int] = []
    // 현재 게임 시도 횟수
    var attemptCount = 0
    
    // 서로 다른 3자리 정답 숫자 생성
    func generateUniqueAnswerNumbers() {
        while answerNumArray.count < 3 {
            randomNumber = numArray.randomElement()!
            // 첫번째 숫자가 0이면 다시 선택
            if answerNumArray.isEmpty && randomNumber == 0 {
                continue
            }
            // 중복 숫자 방지
            if answerNumArray.contains(randomNumber) {
                continue
            }
            answerNumArray.append(randomNumber)
        }
    }
    
    // 숫자 야구 게임 시작
    func startNumberBaseballGame() {
        print("< 게임을 시작합니다 >")
        while true {
            print("숫자를 입력하세요")
            guard let userInput = readLine(),
                  let userNum = Int(userInput), userNum / 1000 == 0
            else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            attemptCount += 1
            
            remainingNumber = userNum
            userNumArray = []
            
            // 사용자 입력값을 개별 숫자로 분리하여 배열에 저장
            while remainingNumber > 0 {
                if !userNumArray.contains(remainingNumber % 10) {
                    userNumArray.insert(remainingNumber % 10, at: 0)
                    remainingNumber /= 10
                } else {
                    print("올바르지 않은 입력값입니다")
                    break
                }
                if userNumArray.count == 2 && remainingNumber == 0 {
                    print("올바르지 않은 입력값입니다")
                    break
                }
            }
                
            if userNumArray.count != 3 {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
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
            
            if strikeCount == 0 && ballCount == 0 {
                print("Nothing")
            } else {
                print("\(strikeCount)스트라이크 \(ballCount)볼")
            }
            
            // 정답을 맞추었을 경우
            if strikeCount == 3 {
                print("정답입니다!")
                attemptCountsPerGame.append(attemptCount)
                break
            }
        }
    }
    
    // 게임 기록 출력
    func showGameRecords() {
        print("< 게임 기록 보기 >")
        for (index, item) in attemptCountsPerGame.enumerated() {
            print("\(index + 1)번째 게임 : 시도 횟수 - \(item)")
        }
    }
}
