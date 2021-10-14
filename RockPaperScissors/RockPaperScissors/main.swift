//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Player {
    case computer
    case user
    case none
}

enum GameNotice {
    static func printScissorsRockPaper() {
        print("가위(1), 바위(2), 보(3)! <종료 : 0>", terminator: " : ")
    }
    
    static func printTheEnd() {
        print("게임 종료")
    }
    
    static func printRockScissorsPaper(turn: Player) {
        switch turn {
        case .computer:
            print("[컴퓨터 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
        default:
            print("[사용자 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0>", terminator: " : ")
        }
    }
    
    static func printError(error: GameError) {
        switch error {
        case .wrongInput:
            print("잘못된 입력입니다. 다시 입력해주세요.")
        case .turnDecisionFail:
            print("턴 결정에 실패하였습니다.")
        }
    }
    
}

enum MatchResult: String {
    case computerWins = "졌습니다."
    case userWins = "이겼습니다."
    case draw = "비겼습니다."
    case stop
    
    func printResult() {
        print(self.rawValue)
    }
}

enum PlayerOption {
    case scissor
    case rock
    case paper
    case stop
    case none
    
    init(_ number: String) {
        switch number {
        case "0":
            self = .stop
        case "1":
            self = .scissor
        case "2":
            self = .rock
        case "3":
            self = .paper
        default:
            self = .none
        }
    }
    
    init(_ number: Int) {
        switch number {
        case 0:
            self = .stop
        case 1:
            self = .scissor
        case 2:
            self = .rock
        case 3:
            self = .paper
        default:
            self = .none
        }
    }
}

enum GameError: Error {
    case wrongInput
    case turnDecisionFail
}

func runProgram() {
    runGame()
    GameNotice.printTheEnd()
}

func runGame() {
    do {
        let (winnerOfScissorsRockPaper, gameExitFlag) = decideResultOfScissorsRockPaper()

        guard gameExitFlag == false else { return }

    } catch GameError.turnDecisionFail {
        GameNotice.printError(error: .turnDecisionFail)
    } catch {
        print("알 수 없는 오류입니다.")
    }
}

func decideWinner(from matchResult: MatchResult) -> Player {
    switch matchResult {
    case .computerWins:
        return .computer
    case .userWins:
        return .user
    default:
        return .none
    }
}

func decideResultOfScissorsRockPaper() -> (Player, Bool) {
    var matchResult: MatchResult
    
    repeat {
        matchResult = doScissorsRockPaper()
    } while matchResult == .draw
    
    let winner = decideWinner(from: matchResult)
    let gameExitFlag = (matchResult == .stop) ? true : false
    
    return (winner, gameExitFlag)
}

func doScissorsRockPaper() -> MatchResult {
    GameNotice.printScissorsRockPaper()
    
    let computersHand: PlayerOption = generateRandomHand()
    var (usersHand, isValidInput) = receiveUsersInput()
    
    while isValidInput == false {
        GameNotice.printError(error: .wrongInput)
        GameNotice.printScissorsRockPaper()
        (usersHand, isValidInput) = receiveUsersInput()
    }
    
    guard usersHand != .stop else {
        return MatchResult.stop
    }
    
    let matchResult = decideWinner(between: computersHand, and: usersHand)
    matchResult.printResult()
    return matchResult
}

func generateRandomHand() -> PlayerOption {
    let randomNumber: Int = Int.random(in: 1...3)
    
    return PlayerOption(randomNumber)
}

func receiveUsersInput() -> (PlayerOption, Bool) {
    guard let userInput = readLine() else {
        return (.none, false)
    }
    
    let isValidInput = verify(userInput: userInput)
    let usersHand = PlayerOption(userInput)
    
    return (usersHand, isValidInput)
}

func convertToInteger(from userInput: String) -> Int? {
    return Int(userInput)
}

func verify(userInput: String) -> Bool {
    guard let integerUserInput = convertToInteger(from: userInput) else {
        return false
    }
    
    return (0...3).contains(integerUserInput)
}

func decideWinner(between computersHand: PlayerOption, and usersHand: PlayerOption) -> MatchResult {
    if computersHand == usersHand {
        return MatchResult.draw
    }
    
    switch (computersHand, usersHand) {
    case (.rock, .scissor), (.scissor, .paper), (.paper, .rock):
        return MatchResult.computerWins
    case (.rock, .paper), (.scissor, .rock), (.paper, .scissor):
        return MatchResult.userWins
    default:
        return MatchResult.draw
    }
}

runProgram()
