import Swift

// 1. 스위프트 상속
// 상속은 클래스, 프로토콜 등에서 가능
// 열거형, 구조체는 상속이 불가능
// 스위프트 클래스는 단일 상속만 지원

// 2. 문법
//class 이름: 상속받을클래스이름{
//    /*구현부*/
//}

// 3. 사용
// final 키워드를 사용하면 재정의(override) 방지
// static 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능
// class 키워드를 사용해 타입 메서드를 만들면 재정의가 가능
// class 앞에 final을  붙이면 static 키워드를 사용한 것과 동일하게 동작
// override 키워드를 통해 부모 클래스의 메서드 재정의 가능

// 기반 클래스 Person
class Person {
    var name: String = ""
    
    func selfIntroduce(){
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의 방지
    final func sayHello(){
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 부락 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod(){
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도
    // final 키워드를 사용하면 재정의 할 수 없다.
    // 메서드 앞에 `static`과 `final class`는 똑같은 역할을 한다.
    final class func finalClassMethod(){
        print("type method - final class")
    }
}


// Person을 상속받는 Student
class Student: Person{
    var major: String = ""
    
    override func selfIntroduce(){
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod(){
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없다.
    // override static func typeMethod(){ }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없다.
    // override func sayHello(){ }
    // override class func finalClassMethod() { }
}

// 4. 구동 확인
let han: Person = Person()
let hana: Student = Student()

han.name = "han"
hana.name = "hana"
hana.major = "Swift"

han.selfIntroduce()

hana.selfIntroduce()

Person.classMethod()

Person.typeMethod()

Student.classMethod()

Student.typeMethod()

Student.finalClassMethod()
