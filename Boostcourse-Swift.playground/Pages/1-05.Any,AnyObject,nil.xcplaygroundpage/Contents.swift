// Any - Swift의 모든 타입을 지칭
// AnyObject - 모든 클래스 타입을 지칭하는 프로토콜
// nil - 없음을 의미하는 키워드

var someAny:Any=100
someAny = "어떤 타입도 수용 가능"
someAny = 123.12

// Any 타입에 Double 자료를 넣을 순 있지만 Any는 Double 타입이 아니기 때문에 할당 불가
// 명시적으로 타입을 변환해주어야 한다
//let someDouble:Double = someAny //컴파일 오류 발생

class SomeClass {}
var someAnyObject:AnyObject = SomeClass()

// AnyObject는 클래스의 인스턴스만 수용 가능, 인스턴스가 아니면 할당 불가
//someAnyObject = 123.12

// someAny는 Any 타입, someAnyObject는 AnyObject 타입이기 때문에 nil을 할당할 수 없다
var someAny = 100
var someAnyObject:AnyObject = SomeClass()

someAny = nil // 컴파일 오류
someAnyObject = nil // 컴파일 오류

