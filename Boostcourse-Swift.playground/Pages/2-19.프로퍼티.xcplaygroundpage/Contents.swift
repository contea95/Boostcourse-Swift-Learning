import Swift

// 1. 프로퍼티 종류
// 인스턴스 저장 프로퍼티
// 타입 저장 프로퍼티
// 인스턴스 연산 프로퍼티
// 타입 연산 프로퍼티
// 지연 저장 프로퍼티

// 2. 정의와 사용
// 프로퍼티는 구조체, 클래스, 열거형 내부에 구현 가능
// 다만 열거형 내부에는 연산 프로퍼티만 구현이 가능하다.
// 연산 프로퍼티는 var로만 선언할 수 있다.
// 연산 프로퍼티를 읽기 전용으로 구현할 수 있지만, 쓰기 전용으로 구현할 수 없다.
// 읽기 전용으로 구현하려면 get 블럭만 작성하면 됨. 읽기 전용은 get 블럭을 생략할 수 있다.
// 읽기, 쓰기 모두 가능하게하려면 get블럭과 set블럭을 모두 구현해주면 된다.
// set 블럭에서 암시적 매개변수 newValue를 사용할 수 있다.

struct Student{
    
    // 인스턴스 저장 프로퍼티
    var name:String = ""
    var `class`:String = "Swift"
    var koreanAge:Int = 0
    
    // 인스턴스 연산 프로퍼티
    var westernAge:Int{
        get{
            return koreanAge - 1
        }
        
        set(inputValue){
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription:String = "학생"
    /*
    // 인스턴스 메서드
    func selfIntroduce(){
        print("저는 \(self.class) 반 \(name) 입니다.")
    }
    */
    
    // 읽기 전용 인스턴스 연산 프로퍼티
    // 위의 selfIntroduce() 메서드를 대체할 수 있다.
    var selfIntroduction:String{
        get{
            return "저는 \(self.class) 반 \(name) 입니다."
        }
    }
    /*
    // 타입 메서드
    static func selfintroduce(){
        print("학생타입입니다")
    }
    */
    
    // 읽기 전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있습니다.
    static var selfIntroduction:String{
        return "학생타입입니다."
    }
}
// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)


//인스턴스 생성
var han:Student = Student()
han.koreanAge = 10

// 인스턴스  저장 프로퍼티 사용
han.name = "han"
print(han.name)

// 인스턴스 연산 프로퍼티 사용
print(han.selfIntroduction)

print("제 한국나이는 \(han.koreanAge)살이고, 미쿡나이는 \(han.westernAge)살입니다.")

// 3. 응용
struct Money{
    var currencyRate:Double = 1100
    var dollar:Double = 0
    var won:Double{
        get{
            return dollar*currencyRate
        }
        set{
            dollar = newValue / currencyRate
        }
    }
}

var moneyInMyPocket = Money()

moneyInMyPocket.won = 11000

print(moneyInMyPocket.won)

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)


// 4. 지역변수 및 전역변수
// 저장 프로퍼티와 연산 프로퍼티의 기능은 함수, 메서드, 클로저, 타이 등의 외부에 위치한 지역/전역 변수에도 모두 사용 가능하다.
var a:Int = 100
var b:Int = 200
var sum:Int{
    return a+b
}

print(sum)
