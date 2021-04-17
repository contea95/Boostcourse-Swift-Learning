import Swift

// 인스턴스 생성하는 이니셜라이저, 인스턴스 소멸 시 호출되는 디이니셜라이저
// 프로퍼티 초기값
// 이니셜라이저 init
// 디이니셜라이저 deinit

// 1. 프로퍼티 초기값
// 스위프트의 모든 인스턴스는 초기화와 동시에 모든 프로퍼티에 유효한 값이 할당되어 있어야 한다.
// 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다.

class PersonA{
    var name:String = "unknown"
    var age:Int = 0
    var nickName:String = "nick"
}

// 인스턴스 생성
let jason:PersonA = PersonA()

// 기본값이 인스턴스가 지녀야 할 값과 맞지 않으면
// 생성된 인스턴스 프로퍼티에 각각 값 할당
jason.name = "jason"
jason.age = 30
jason.nickName = "j"

// 2-1. 이니셜라이저
// 프로퍼티 초기값을 지정하기 어려운 경우 init을 통해 인스턴스가 가져야 할 초기값을 전달할 수 있다.
class PersonB{
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")

// 프로퍼티 초기값이 필요 없을 때
// 옵셔널 사용
// 클래스 내부 init을 사용할 때는 convenience 사용

class PersonC {
    var name: String
    var age: Int
    var nickName : String?
    
    init(name: String, age: Int, nickName: String){
        self.name = name
        self.age = age
        self.nickName = nickName
    }
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")

// 암시적 추출 옵셔널은 인스턴스 사용에 필요하지만, 초기값을 할당하지 않고자 할 때 사용

class Puppy{
    var name: String
    var owner: PersonC!
    
    init(name: String){
        self.name = name
    }
    
    func goOut(){
        print("\(name)가 주인 \(owner.name)과 산책을 합니다.")
    }
}

let happy: Puppy = Puppy(name: "happy")
happy.owner = jenny
happy.goOut()

// 2-2. 실패 가능한 이니셜라이저
// 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
// 인스턴스 생성에 실패하면 nil 반환
// 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입
// init? 사용

class PersonD{
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int){
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.count == 0{
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

//print(joker)
//print(batman)

// 3. 디이니셜라이저
// deinit은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출
// 인스턴스가 해제되는 시점에 해야할 일을 구현 가능
// deinit는 매개변수가 없음
// 자동으로 호출되므로 직접 호출은 불가
// 디이니셜라이저는 클래스 타입에만 구현할 수 있다.
// 인스턴스 메모리가 해제되는 시점은 ARC의 규칙에 따라 결정됨

class PersonE{
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC){
        self.name = name
        self.child = child
    }
    
    deinit{
        if let petName = pet?.name{
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다.")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // 메모리 해제
