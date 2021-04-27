import Swift

// 1. 고차 함수
// 고차 함수는 '다른 함수를 전달 인자로 받거나 함수 실행의 결과를 함수로 반환하는 함수'를 뜻한다.
// 스위프트의 함수(클로저)는 일급 시민(일급 객체)이기 때문에 함수의 전달 인자로 전달할 수 있으며, 함수의 결과값으로 반환할 수 있다.

// 2. map
// map 함수는 컨테이너 내부의 기존 데이터를 변형하여 새로운 컨테이너를 생성

// 변형하고자 하는 numbers와 변형 결과를 받을 doubledNumbers, strings

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int]
var strings: [String]

// 기존 for 구문 사용시
doubledNumbers = [Int]()
strings = [String]()

for number in numbers{
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)
print(strings)

// map 메서드 사용 시

// numbers의 각 요소를 2배하여 새로운 배열 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// numbers의 각 요소를 문자열로 변환하여 새로운 배열 반환
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)
print(strings)

// 매개변수, 반환 타입, 반환 키워드 생략, 후행 클로저
doubledNumbers = numbers.map{ $0 * 2 }
print(doubledNumbers)

// 3. filter
// filter 함수는 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
// 기존의 for 구문 사용

// 변수 사요에 주목하세요
var filtered: [Int] = [Int]()

for number in numbers{
    if number % 2 == 0{
        filtered.append(number)
    }
}

print(filtered)

// filter 메서드 사용
// numbers의 요소 중 짝수를 걸러내서 새로운 배열로 반환
let evenNumbers: [Int] = numbers.filter{ (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

// 매개변수, 반환 타입, 반환 키워드(return) 생략, 후행 클로저
let oddNumbers: [Int] = numbers.filter{
    $0 % 2 != 0
}
print(oddNumbers)

// 4. reduce
// reduce 함수는 컨테이너 내부의 콘텐츠를 하나로 통합

// 통합하고자 하는 someNumbers
let someNumbers: [Int] = [2, 8, 15]

// 기존의 for문 사용
// 변수 사용에 주목하세요
var result: Int = 0

// someNumbers의 모든 요소를 더한다
for number in someNumbers {
    result += number
}

print(result)

// reduce 메서드 사용
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더한다
let sum: Int = someNumbers.reduce(0, {(first: Int, second: Int) -> Int in
    print("\(first) + \(second)")
    return first + second
})
print(sum)

// 초깃값이 0이고 someNumbers 내부의 모든 값을 뺀다
var subtract: Int = someNumbers.reduce(0, {(first: Int, second: Int) -> Int in
    return first - second
})

print(subtract)

// 초깃값이 3이고 someNubers 내부의 모든 값을 더합니다
var sumFromThree = someNumbers.reduce(3) { $0 + $1 }
print(sumFromThree)
