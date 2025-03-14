//
//  UserInputHandler.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/14/25.
//

import Foundation

class UserInputHandler {
    // 임시 숫자 저장 변수
    var remainingNumber = 0
    // 사용자 입력 숫자 배열
    var userNumArray: [Int] = []
    
    func processUserInput() -> [Int]? {
        print("숫자를 입력하세요")
        guard let userInput = readLine(),
              let userNum = Int(userInput), userNum / 1000 == 0
        else {
            print("올바르지 않은 입력값입니다")
            return nil
        }
        
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
        }
        
        return userNumArray
    }
}
