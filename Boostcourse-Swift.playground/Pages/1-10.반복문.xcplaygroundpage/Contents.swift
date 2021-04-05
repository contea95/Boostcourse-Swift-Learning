import Swift

// 1. for-in 구문
// for-each와 유사하다
// Dictionary의 경우 이터레이션 아이템으로 튜플이 들어옴

//for item in items{
//    구문
//}

var integers = [1,2,3]
let people = ["han" : 10, "eric":15, "mike":12]

for integer in integers{
    print(integer)
}

for (name, age) in people{
    print("\(name): \(age)")
}

// 2. while 구문

//while 조건{
//    실행 구문
//}

while integers.count > 1{
    integers.removeLast()
}
print(integers)

// 3.  repeat-while 구문
// 기존의 do-while과 동작 유사

//repeat{
//    구문
//}while 조건

repeat{
    integers.removeLast()
}while integers.count > 0

print(integers)
