import Swift

// 1. 구조체란?
// 스위프트 대부분 타입은 구조체로 이루어져 있다.
// 구조체는 값(value) 타입
// 타입 이름은 대문자 카멜케이스 사용

// 2. 구조체 문법
//struct 이름{
//    /*구현부*/
//}

struct Sample{
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty:Int = 100
    
    // 불변 프로펕티(값 변경 불가능)
    let immutableProperty:Int = 100
    
    // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty:Int = 100
    
    // 인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod(){
        print("instance method")
    }
    
    // 타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드
    static func typeMethod(){
        print("type method")
    }
}

// 구조체 사용
// 가변 인스턴스 생성
var mutable:Sample = Sample()

mutable.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다.
// 컴파일 오류 발생
//mutable.immutableProperty = 200

// 불변 인스턴스
let immutable:Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없다.
// 컴파일 오류 발생
//immutable.mutableProperty = 200
//immutable.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod()

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutable.typeProperty = 400
//mutable.typeMethod()

// 3. 학생 구조체 만들어보기
struct Student{
    // 가변 프로퍼티
    var name:String = "unknown"
    
    // 키워드도 `로 묶어주면 이름으로 사용할 수 있다.
    var `class`:String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce(){
        print("학생타입입니다.")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭, 몇몇 경우를 제외하고는 선택사항이다.
    func selfIntrodce(){
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() //학생타입입니다.

// 가변 인스턴스 생성
var han:Student = Student()
han.name = "han"
han.class = "스위프트"
han.selfIntrodce()

// 불변 인스턴스 생성
let jina:Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
//jina.name = "jina"
jina.selfIntrodce()
