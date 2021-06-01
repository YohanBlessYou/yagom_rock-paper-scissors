//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func userInputNumber() -> Int {
    while true {
        print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
        if let userInput = readLine(), let convertNumber = Int(userInput), (0...3).contains(convertNumber) {
            return convertNumber
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
    }
}

func makeRandomNumber() -> Int {
    return Int.random(in:1...3)
}

func RockPaperScissorsGame() -> Int {
    let userNumber = userInputNumber()
    let computerNumber = makeRandomNumber()
    if userNumber == 0 {
        return 0
    }

    return 1
}

// Main
func console() {
    while true {
        
        if RockPaperScissorsGame() == 0 { break }
        
    }
}

console()
