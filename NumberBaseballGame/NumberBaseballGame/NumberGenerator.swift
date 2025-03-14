//
//  NumberGenerator.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/14/25.
//

import Foundation

class NumberGenerator {
    // 사용할 숫자 배열
    var numArray = [Int](0...9)
    // 정답 숫자 배열
    var answerNumArray: [Int] = []
    var randomNumber = 0
    
    // 서로 다른 3자리 정답 숫자 생성
    func generateUniqueAnswerNumbers() -> [Int] {
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
        
        return answerNumArray
    }
}
