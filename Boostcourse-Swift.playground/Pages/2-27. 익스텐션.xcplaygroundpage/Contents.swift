// 1. 익스텐션
// 익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가 할 수 잇는 기능
// 기능을 추가하려는 타입의 구현된 소스 코드를 알지 못하거나 볼 수 없어도, 타입만 알고 있으면 그 타입의 기능을 확장할 수 있다.
// << 스위프트의 익스텐션이 타입에 추가할 수 있는 기능 >>
// 연산 타입 프로퍼티 / 연산 인스턴스 프로퍼티
// 타입 메서드 / 인스턴스 메서드
// 이니셜라이저
// 중첩 타입
// 특정 프로토콜을 준수할 수 있도록 기능 추가
// ** 익스텐션은 타입에 새로운 기능을 추가할 수 있지만, 기존에 존재하는 기능을 재정의할 수 없다.

// << 클래스의 상속과 익스텐션 비교 >>
// 클래스의 상속은 클래스 타입에서만 가능, 익스텐션은 구조체, 클래스, 프로토콜 등에 적용이 가능. 클래스의 상속은 특정 타입을 물려받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 수직 확장이지만, 익스텐션의 기존 타입에 기능을 추가하는 수평 확장.
// 상속을 받으면 기존 기능을 재정의할 수 있지만, 익스텐션은 재정의 할 수 없다는 것

// << 익스텐션 활용 >>
// 익스텐션을 사용하는 대신 원래 타입을 정의한 소스에 기능을 추가하는 방법도 있겠지만, 외부 라이브러리나 프레임워크를 가져다 썼다면 원본 소스를 수정하지 못한다. 이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 익스텐션을 사용. 따로 상속받지 않아도 되며, 구조체, 열거형에도 기능을 추가할 수 있으므로 익스텐션은 편리
// 익스텐션은 모든 타입에 적용 가능. 구조체, 열거형, 클래스, 프로토콜, 제네릭 타입 등
// 익스텐션을 모든 타입에 연산 프로퍼티, 메서드, 이니셜라이저, 서브 스크립트, 중첩 데이터 타입 등을 추가할 수 있다.
// 익스텐션은 프로토콜과 함께 사용하면 강력하다.

// 2. 정의
// extension 키워드 사용
//extension 확장타입이름 {
//    /* 기능 구현 */
//}
//
//// 익스텐션은 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장 가능
//extension 확장타입이름: 프로토콜1, 프로토콜2, 프로토콜3... {
//    /* 기능 구현 */
//}

// 스위프트 라이브러리를 살펴보면 실제로 익스텐션이 많이 사용되고 있다. Double 타입에는 수많은 프로퍼티와 메서드, 이니셜라이저가 정의, 수많은 프로토콜을 채택하고 있을 것 같지만, 실제로 다 정의되어있지 않다.

// 3. 구현
// << 연산 프로퍼티 추가 >>
// 아래 익스텐션은 Int 타입에 두 개의 연산 프로퍼티를 추가
// Int 타입의 인스턴스가 홀수이지 짝수인지 판별하여 Bool타입으로 알려주는 연산 프로퍼티
// 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int 타입의 어떤 인스턴스에도 사용 가능
// 인스턴스 연산 프로퍼티를 추가할 수 있으며, static 키워드를 사용하여 타입 연산 프로퍼티도 추가 가능

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(2.isEven)

var number: Int = 3
print(number.isOdd)

// << 이니셜라이저 추가 >>
// 인스턴스를 초기화할 때 인스턴스 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있다. 타입의 정의부에 이니셜라이저를 추가하지 않더라도 익스텐션을 통해 이니셜라이저를 추가할 수 있다.
// 익스텐션으로 클래스 타입에 편의 이니셜라이저는 추가 가능하지만 지정 이니셜라이저 추가 불가능. 지정 이니셜라이저와 디이니셜라이저는 반드시 클래스타입의 구현부에 위치

extension String{
    init(int: Int){
        self = "\(int)"
    }
    
    init(double: Double){
        self = "\(double)"
    }
}

let stringFromInt: String = String(int: 100)

let stringFromDouble: String = String(double: 100.0)
