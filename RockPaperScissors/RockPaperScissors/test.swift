

func main() {
    STEP1()

    if input == "0" { return }

    STEP2()
}

func STEP2() {
    //큰 루프 
    while true {
        //작은 루프
        사용자옵션 = 사용자옵션결정()

        if 사용자옵션 == "0" { return }

        상대패결정()

        if 같은지체크() == true { break }

        턴변경()
        턴출력()
    }

    승리자출력()
}

func 사용자옵션결정() -> 사용자옵션 {
    var 입력검증결과 = false
    var 사용자옵션
    while 입력검증결과 == false {
        안내문구()
        사용자옵션 = 사용자입력()
        입력검증결과 = 입력검증(사용자입력)
        if 입력검증결과 == true { break }
        컴퓨터턴으로변경()
        턴출력()
    }
}

