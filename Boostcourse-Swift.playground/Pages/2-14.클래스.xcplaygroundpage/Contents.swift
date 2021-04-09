import Swift

// 1. 클래스란?
// 클래스는 참조 타입
// 타입 이름은 대문자 카멜 케이스를 사용하여 정의한다.
// Swift의 클래스는 다중 상속이 되지 않는다.

// 2. 클래스 문법

//class 이름{
//    /*구현부*/
//}

// 프로퍼티 및 메서드 구현
class Sample{
    // 가변 프로퍼티
    var mutableProperty:Int = 100
    
    // 불변 프로퍼티
    let immutableProperty:Int = 100
    
    // 타입 프로퍼티
    static var typeProperty:Int = 100
    
    // 인스턴스 메서드
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드
    // 상속 시 재정의 불가 타입 메서드 - static
    static func typeMethod(){
        print("type method - static")
    }
    
    // 상속 시 재정의 가능 타입 메서드 - class
    
    class func classMethod(){
        print("type method - class")
    }
}

// 클래스 사용
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference:Sample = Sample()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200

// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference:Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었어도 인스턴스 내의 프로퍼티 값의 변경이 가능하다.
immutableReference.mutableProperty = 200

// 다만 참조 정보를 변경할 수는 없다
// 컴파일 오류 발생
//immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는
// 인스턴스 생성후에 수정할 수 없다
// 컴파일 오류 발생
//immutableReference.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없습니다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()

// 3. 학생 클래스 만들어보기
class Student{
    // 가변 프로퍼티
    var name:String = "unknown"
    
    // 키워드를 `로 묶어주면 이름으로 사용 가능
    var `class`:String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce(){
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭
    func selfIntroduce(){
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce()

// 인스턴스 사용
var han:Student = Student()
han.name = "han"
han.class = "스위프트"
han.selfIntroduce()

// 인스턴스 생성
let jina:Student = Student()
jina.name = "jina"
jina.selfIntroduce()


