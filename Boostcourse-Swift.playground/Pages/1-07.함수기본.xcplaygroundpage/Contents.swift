/* 함수 */
import Swift

// 함수의 선언

//func 함수이름(매개변수1이름:매개변수1타입, 매개변수2이름:매개변수2타입 ...) -> 반환타입{
//    함수 구현부
//    return 반환값
//}

func sum(a:Int, b:Int) -> Int{
    return a+b
}

//func 함수이름(매개변수1이름:매개변수1타입, 매개변수2이름:매개변수2타입...) -> Void{
//    함수 구현부
//    return
//}

func printMyName(name:String)->Void{
    print(name)
}

//반환 값이 없는 경우, 반환 타입(Void) 생략 가능
func printYourName(name:String){
    print(name)
}

// 3. 매개변수가 없는 함수
//func 함수이름()->반환타입{
//    함수 구현부
//    return 반환값
//}

func maximumIntegerValue()->Int{
    return Int.max
}

// 4. 매개변수와 반환값이 없는 함수
//func 함수이름()->Void{
//    함수 구현부
//    return
//}

//함수 구현이 짧은 경우
//가독성을 해치지않는 범위에서 줄바꿈을 하지않고 한줄로 표현해도 된다

func hello()->Void{print("hello")}

// 반환값이 없는 경우, 반환타입 생략 가능

func bye(){print("bye")}

// 5. 함수의 호출
sum(a:3, b:5)

printMyName(name:"Han")

printYourName(name:"haha")

maximumIntegerValue()

hello()

bye()
