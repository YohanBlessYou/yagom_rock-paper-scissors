func main() {
    input = startA()

    if input == 0 { return }
    
    startB()
}

func startA() {
    repeat {
        input = 사용자입력받고검증()

        if input == 0 { return }

        승패 = 승패결정()

    } while 승패==비김

    승자출력
}

func 사용자입력받고검증() {
    repeat {
        input = 사용자입력
    } while isValidInput(input)
}


func startB() {
    
    repeat {
        input = 사용자입력받고검증()
 
        if input==0 { return }

        승패 = 승패결정()

    } while 승패!=비김

    승자출력
}

func 사용자입력받고검증() {
    repeat {
        input = 사용자입력
    } while isValidInput(input)
}