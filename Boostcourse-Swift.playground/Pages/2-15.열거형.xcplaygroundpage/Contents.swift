import Swift

// 열거형
// 1. 열거형
// 유사한 종류의 여러 값을 한 곳에 모아 정의한 것
// enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용
// 각 case는 소문자 카멜케이스로 정의
// 각 case는 그 자체가 고유의 값
// 각 case는 한 줄에 개별로도, 한 줄에 여러개 정의 가능

enum 이름{
    case 이름1
    case 이름2
    case 이름3, 이름4, 이름5
    //...
}

enum BoostCamp{
    case iosCamp
    case andriodCamp
    case webCamp
}

// 2. 열거형 사용
// 타입 명확하면 이름 생략 가능
// swich 구문에서 사용하면 좋다

enum Weekday{
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용
var day:Weekday = Weekday.mon

// 타입이 명확하면 .케이스 처럼 표현 가능
day = .tue

print(day)

// switch의 비교값에 열거형 타입이 위치할 대
// 모든 열거형 케이스를 포함한다면
// default 작성할 필요가 없다

switch(day){
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금파티!!")
case .sat, .sun:
    print("주말")
}

// 3. rawValue(원시값)
// c언어의 enum같이 정수값을 가질 수 있다.
// rawValue는 case별로 각각 다른 값을 가져야 한다.
// 자동으로 1이 증가된 값이 할당

enum Fruit:Int{
    case apple = 0
    case grape = 1
    case peach
    
    // mango = 0은 apple과 같으므로 정의 불가
    //case mango = 0
}

print("Furit.peach.rawValue == \(Fruit.peach.rawValue)")
Fruit.peach.rawValue == 2

// 정수타입 뿐만 아니라 Hashable 프로토콜을 따르는 모든 타입을 원시값의 타입으로 지정할 수 있다.

enum School:String{
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case university
}

print("School.middle.rowValue == \(School.middle.rawValue)")

// 열거형의 원시값 타입이 String일 때 원시값이 지정되지 않았다면
// case의 이름을 원시값으로 사용
print("School.university.rawValue == \(School.university.rawValue)")

// 4.원시값을 통한 초기화
// rawValue를 통해 초기화 할 수 있다.
// rawValue가 case에 해당하지 않을 수 있으므로, rawValue를 통해 초기화 한 이느턴스는 옵셔널 타입이다.

// rawValue를 통해 초기화 한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아니다.
//let apple:Fruit = Fruit(rawValue: 0)
let apple:Fruit? = Fruit(rawValue: 0)

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있다.
if let orange:Fruit = Fruit(rawValue: 5){
    print("rawValue 5에 해당하는 케이스는 \(orange)이다")
} else{
    print("rawValue 5에 해당하는 케이스가 없다")
}

// 5. 메서드
// 열거형에는 메서드도 추가할 수 있다.

enum Month{
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage(){
        switch self{
        case .mar, .apr, .may:
            print("봄")
        case .jun, .jul, .aug:
            print("여름")
        case .sep, .oct, .nov:
            print("가을")
        case .dec, .jan, .feb:
            print("겨울")
        }
    }
}

Month.mar.printMessage()
