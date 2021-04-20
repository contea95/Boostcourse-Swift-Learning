import Swift

// 애플리케이션이 동작 도중 생성하는 다양한 연산 결과값을 동적으로 확인하고 안전하게 처리할 수 있도록 확인하고 빠르게 처리할 수 있다
// 1. Assertion
// assert(_:_:file:line:) 함수 사용
// assert 함수는 디버깅 모드에서만 동작
// 배포하는 애플리케이션에서는 제외
// 예상했던 조건의 검증을 위해 사용

var someInt:Int = 0

// 검증 조건과 실패시 문구 작성
// 검증 조건에 부합하므로 지나감
assert(someInt == 0, "someInt != 0")

someInt = 1
//assert(someInt == 0)
//assert(someInt == 0, "someInt !=0")

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다." )
    print("당신의 나이는 \(age!)세입니다.")
}

functionWithAssert(age: 50)

// 2. guard(빠른 종료-Early Exit)
// guard를 사용하여 잘못된 값 전달 시 특정 실행 구문을 빠르게 종료
// 디버깅 모드 이외에 다른 조건에서도 동작
// guard의 else 블록 내부에는 특정 코드블럭을 종료하는 지시어(return, break)가 필요하다.
// 타입 캐스팅, 옵셔널과 자주 사용
// 그 외에도 단순 조건 판단 후 빠르게 종료할 때도 용이

func functionWithGuard(age: Int?){
    guard let unwrappedAge = age,
          unwrappedAge < 130,
          unwrappedAge >= 0 else{
        print("나이값 입력이 잘못되었습니다.")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세 입니다")
}

var count = 1

while true{
    guard count < 3 else{
        break
    }
    print(count)
    count += 1
}

func someFunction(info: [String: Any]){
    guard let name = info["name"] as? String else{
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else{
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "han", "age": 10])

// ** if let / guard 를 이요한 옵셔널 바인딩 비교
// 1. if let 옵셔널 바인딩
if let unwrapped: Int = someValue {
// do something
   unwrapped = 3
}
// if 구문 외부에서는 unwrapped 사용이 불가능 합니다.
// unwrapped = 5

// 2. guard 옵셔널 바인딩
// guard 구문 이후에도 unwrapped 사용 가능
guard let unwrapped: Int = someValue else{
    return
}
unwrapped = 3
