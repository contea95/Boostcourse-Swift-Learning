import Swift

// 1. 프로퍼티 감시자
// 프로퍼티 감시자를 사용하면 프로퍼티 값이 변경될 때 원하는 동작을 수행할 수 있다.
// 값이 변경되기 직전에 willSet 블럭이, 값이 변경된 직후에는 didSet 블럭이 호출
// 둘 중 필요한 하나만 구현해도 무관
// 변경되려는 값이 기존 값과 똑같더라도 프로퍼티 감시자는 동작
// willSet 블럭에서는 암시적 매개변수 newValue, didSet 블럭에서는 oldValue를 사용할 수 있다.
// 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없다.
// 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등 지역/전역 변수에서 모두 사용 가능

struct Money{
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100{
        willSet(newRate){
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate){
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }
 
    // 프로퍼티 감시자 사용
    var dollar: Double = 0{
        // willSet의 암시적 매개변수 이름 newValue
        willSet{
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet{
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다.")
        }
    }
    
    // 연산 프로퍼티
    var won: Double{
        get{
            return dollar * currencyRate
        }
        set{
            dollar = newValue / currencyRate
        }
        
        /* 프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다.
         willSet{
         
         }
         */
    }
}

var moneyInMyPocket: Money = Money()

moneyInMyPocket.currencyRate = 1150

moneyInMyPocket.dollar = 10

print(moneyInMyPocket.won)
