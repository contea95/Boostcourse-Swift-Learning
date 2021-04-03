import Swift

// 1. 매개변수 기본 값
// 매개변수에 기본적으로 전달될 값을 미리 지정할 수 있다.
// 기본값을 갖는 매개변수는 매개변수 목록 중 가장 뒤쪽에 위치하는 것이 좋다.
//func 함수이름(매개변수1이름:매개변수1타입, 매개변수2이름:매개변수2타입 = 매개변수 기본값) ->반환타입{
//    함수 구현부
//    return 반환값
//}

func greeting(friend:String, me:String = "Han"){
    print("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 호출시 생략할 수 있다
greeting(friend:"haha")
greeting(friend:"haha", me:"eric")

// 2. 전달인자 레이블
// 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역할을 좀 더 명확하게 표현하고자 할 때 사용
// 전달인자 레이블은 변경하여 동일한 이름의 함수를 중복으로 생성 가능

//func 함수이름(전달인자 레이블 매개변수1이름:매개변수1타입, 전달인자 레이블 매개변수2이름:매개변수2타입...)-> 반환타입{
//    함수 구현부
//    return
//}

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용
func greeting(to friend:String, from me:String){
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때 전달인자레이블을 사용해야 합니다
greeting(to:"haha", from:"han") // to 와 from은 바꿀 수 있다.


// 3. 가변 매개변수
// 전달 받을 값의 개수를 알기 어려울 때 사용
// 가변 매개변수는 함수당 하나만 가질 수 있다
// 기본값이 있는 매개변수와 같이 가변 매개변수도 뒤쪽에 위치하는 것이 좋다.

func sayHelloFriends(me:String, friend:String...) -> String{
    return "Hello \(friend)! I'm \(me)!"
}

print(sayHelloFriends(me:"han", friend:"haha", "eric", "wing"))

print(sayHelloFriends(me:"han"))

// 4. 데이터 타입으로서의 함수
var someFunction:(String, String) -> Void = greeting(to:from:)
someFunction("eric", "han")

someFunction = greeting(friend:me:)
someFunction("eric", "han")

// 타입이 다른 함수는 할당할 수 없다 - 컴파일 오류 발생
//someFunction = sayHelloFriends(me: friend:) // sayHelloFriend는 String으로 리턴하기 때문

func runAnother(function: (String, String)->Void){
    function("jenny", "mike")
}

// Hello jenny! I'm mike
runAnother(function:greeting(friend:me:))


runAnother(function:someFunction)
