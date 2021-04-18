import Swift

// 1. 옵셔널 체이닝
// 옵셔널 체이닝은 옵셔널 내부의 내부의 내부로 옵셔널이 연결되어있을 때 유용하게 사용 가능
// 매번 nil을 확인하지 않고 최종적으로 원하는 값이 있는지 없는지 확인 가능

// 예제 클래스
// 사람 클래스
class Person{
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String){
        self.name = name
    }
}

// 사람이 사는 집 클래스
class Apartment{
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?
    var owner: Person?
    
    init(dong: String, ho: String){
        buildingNumber = dong
        roomNumber = ho
    }
}

// 옵셔널 체이닝 사용
let han: Person? = Person(name: "han")
let apart: Apartment? = Apartment(dong:"101", ho: "202")
let superman: Person? = Person(name: "superman")


// 옵셔널 체이닝 실행 결과 후 nil일 수도 있으므로
// 결과 타입도 옵셔널

// 경비원의 직업이 궁금할 때

// 옵셔널 체이닝을 사용하지 않으면
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: han)

// 옵셔널 체이닝 사용 시
func guardJobWithOptionalChaning(owner: Person?){
    if let guardJob = owner?.home?.guard?.job{
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaning(owner: han)

han?.home?.guard?.job

han?.home = apart

han?.home
han?.home?.guard

// 경비원 할당
han?.home?.guard = superman

han?.home?.guard

han?.home?.guard?.name
han?.home?.guard?.job

han?.home?.guard?.job = "경비원"

guardJobWithOptionalChaning(owner: han)

// 2. nil 병합 연산자
// 중위 연산자 ??
// Optional ?? Value
// 옵셔널 값이 nil일 경우, 우측의 값으로 반환
// 띄어쓰기에 주의하여야 합니다

var guardJob: String

guardJob = han?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)

han?.home?.guard?.job = nil

guardJob = han?.home?.guard?.job ?? "슈퍼맨"
print(guardJob)
