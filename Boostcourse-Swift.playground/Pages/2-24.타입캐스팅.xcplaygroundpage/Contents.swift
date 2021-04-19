import Swift

// 1. 스위프트 타입 캐스팅
// 인스턴스 타입을 확인하는 용도
// 클래스의 인스턴스를 부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인하는 용도
// is, as를 사용

// 2. 예제 클래스

class Person{
    var name: String = ""
    func breath(){
        print("숨을 쉽니다")
    }
}

class Student: Person{
    var school: String = ""
    func goToSchool(){
        print("등교를 합니다")
    }
}

class UniversityStudent: Student{
    var major: String = ""
    func goToMT(){
        print("멤버쉽 트레이닝을 갑니다")
    }
}

// 인스턴스 생성
var han: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()

// 2. 타입 확인
// is 사용

var result: Bool
result = han is Person
result = han is Student
result = han is UniversityStudent

result = hana is Person
result = hana is Student
result = hana is UniversityStudent

result = jason is Person
result = jason is Student
result = jason is UniversityStudent

if han is UniversityStudent {
    print("han은 대학생입니다")
} else if han is Student {
    print("han은 학생입니다")
} else if han is Person {
    print("han은 사람입니다")
} // han은 사람입니다

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다


// 3. 업 캐스팅
// as를 사용해 부모클래스의 인스턴스로 사용할 수 잇도록 컴파일러에게 타입 정보를 전환
// Any 혹은 AnyObject로도 타입 정보 변환 가능

// UniversityStudent 인스턴스를 생성해 Person 행세를 할 수 있도록 업캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person()

if mike is UniversityStudent {
    print("mike은 대학생입니다")
} else if mike is Student {
    print("mike은 학생입니다")
} else if mike is Person {
    print("mike은 사람입니다")
} // han은 사람입니다

if jina is UniversityStudent {
    print("jina은 대학생입니다")
} else if jina is Student {
    print("jina은 학생입니다")
} else if jina is Person {
    print("jina은 사람입니다")
} // han은 사람입니다

// 4. 다운 캐스팅
// as? 또는 as!를 사용해 자식 클래스의 인스턴스로 사용할 수 있도록 컴파일러에게 인스턴스 타입 정보를 전환해준다.

// A. 조건부 다운 캐스팅
// as?를 사용
// 캐스팅에 실패하면, 즉 캐스팅 하려는 타입에 부합하지 않는 인스턴스면 nil을 반환하기 때문에 결과 타입은 옵셔널 타입
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent
optionalCasted = jina as? UniversityStudent
optionalCasted = jina as? Student

// B. 강제 다운 캐스팅
// as!를 사용
// 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스면 런타임 오류 발생
// 캐스팅 성공하면 옵셔널이 아닌 일반 타입 반환
var forcedCasted: Student

forcedCasted = mike as! UniversityStudent
//forcedCasted = jenny as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! UniversityStudent // 런타임 오류
//forcedCasted = jina as! Student // 런타임 오류

// 5. 활용
// 타입에 따라서 조건 설정 가능
// as!를 사용하는 이유는 인자로 Person을 받는데 출력 조건은 Student나 UniversityStudent로 바꿔 내부의 func를 실행하기 위함
func doSomethingWithSwitch(someone: Person) {
    switch someone{
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person)
doSomethingWithSwitch(someone: mike)
doSomethingWithSwitch(someone: jenny)
doSomethingWithSwitch(someone: han)

func doSomething(someone:Person){
    if let universityStudent = someone as? UniversityStudent{
        universityStudent.goToMT()
    } else if let student = someone as? Student{
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: han) // 숨을 쉽니다
