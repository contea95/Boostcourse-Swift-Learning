import Swift

// 1. 옵셔널 추출
// 옵셔널에 있는 값을 사용하기 위해 꺼내오는 것

// 2. 옵셔널 방식
// 옵셔널 바인딩
// - nil체크 + 안전한 추출
// - 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 꺼내옴
// - if-let 방식 사용

func printName(_ name:String){
    print(name)
}

var myName:String? = nil

//printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생

if let name:String = myName{
    printName(name)
}else{
    print("myName == nil")
}


var yourName:String! = nil

if let name:String = yourName{
    printName(name)
}else{
    print("yourName == nil")
}

// name 상수는 if-let 구문 내에서만 사용 가능
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
//printName(name)

// ,을 사용해 한 번에 여러 옵셔널을 바인딩할 수 있다.
// 모든 옵셔널에 값이 있을 때만 동작
myName = "Han"
yourName = nil

if let name = myName, let friend = yourName{
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않는다

yourName = "hana"

if let name = myName, let friend = yourName{
    print("\(name) and \(friend)")
}


// 강제 추출
// 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식, 만약 값이 없을 경우
// (nil) 런타임 오류가 발생하게 된다

var myName1:String? = "han"
var yourName1:String! = nil

printName(myName1!)
myName1 = nil

//print(myName1!)
// 강제 추출시 값이 없으므로 런타임 오류 발생

yourName1 = nil

//printName(yourName1)
// nil 값이 전달되기 때문에 런타임 오류 발생
