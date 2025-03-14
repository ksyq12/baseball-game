//
//  main.swift
//  NumberBaseballGame
//
//  Created by shinyoungkim on 3/11/25.
//

import Foundation

let game = GameManager()

while true {
    print("환영합니다! 원하시는 번호를 입력해주세요")
    print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
    guard let userInput = readLine(),
          let selectedNumber = Int(userInput),
        selectedNumber == 1 || selectedNumber == 2 || selectedNumber == 3 else {
        print("올바른 숫자를 입력해주세요!")
        continue
    }
    
    if selectedNumber == 1 {
        game.startNumberBaseballGame()
    } else if selectedNumber == 2 {
        game.showRecords()
        continue
    } else {
        print("< 숫자 야구 게임을 종료합니다 >")
        break
    }
}

