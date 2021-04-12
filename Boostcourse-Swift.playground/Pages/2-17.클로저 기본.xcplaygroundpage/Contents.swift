// 1.클로저
// 클로저는 실행가능한 코드 블럭이다.
// 함수와 다르게 이름정의는 필요하지는 않지만, 매개변수 전달과 반환 값이 존재할 수 있다.
// 함수는 이름이 있는 클로저
// 일급객체로 전달인자, 변수, 상수 등 저장 및 전달이 가능

import Swift

// 2. 기본 클로저 문법
// 클로저는 중괄호 {}로 감싸져있음
// 괄호를 이용해 파라미터 정의
// ->을 이용해 반환 타입 명시
// "in" 키워드를 이용해 실행 코드와 분리

//{(매개변수) -> 반환타입 in
//    실행코드
//}

// 3. 클로저 사용

// sum이라는 상수에 클로저를 할당
let sum:(Int, Int) -> Int = {(a:Int, b:Int) in
    return a + b
}

let sumResult:Int = sum(1,2)
print(sumResult)

// 4. 함수의 전달 인자로서의 클로저
// 클로저는 주로 함수의 전다린자로 많이 사용된다.
// 함수 내부에서 원하는 코드블럭을 실행할 수 있다.

let add:(Int, Int) -> Int
add = {(a:Int, b:Int) in
    return a + b
}

let subtract:(Int, Int) -> Int
subtract = {(a:Int, b:Int) in
    return a - b
}

let devide:(Int, Int) -> Int
devide = {(a:Int, b:Int) in
    return a/b
}

func calculate(a:Int, b:Int, method:(Int, Int) ->Int) -> Int{
    return method(a, b)
}

var calculated:Int

calculated = calculate(a:50, b:10, method:add)

print(calculated)

calculated = calculate(a:50, b:10, method:subtract)

print(calculated)

calculated = calculate(a:50, b:10, method:devide)

print(calculated)

// 따로 클로저를 상수/변수에 넣어 전달하지 않고,
// 함수를 호출할 때 클로저를 작성하여 전달할 수도 있다.

calculated = calculate(a:50, b:10, method:{(left:Int, right:Int) -> Int in
    return left * right
})

print(calculated)
