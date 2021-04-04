import Swift

// 1. if-else 구문
// if 뒤 조건 값에는 Bool 타입의 값만 위치해야한다.

//if 조건{
//    구문
//}else if 조건{
//    구문
//}else{
//    구문
//}

let someInteger = 100

if someInteger<100{
    print("100 미만")
}else if someInteger>100{
    print("100 초과")
}else{
    print("100")
}

// 2. switch 구문
// 정수타입 뿐만 아니라 대부분 기본타입을 지우너하고, 다양한 패턴과 응용이 가능
// case 내부에는 실행가능한 코드가 반드시 위치
// 한정적인 값(enum의 case)이 아닌 한 default 구문은 반드시 작성
// fallthrough 키워드를 사용해 break를 무시할 수 있다.
// 쉼표를 사용해 하나의 case에 여러 패턴 명시 가능

//switch 비교값{
//case 패턴:
//    구문
//default:
//    구문
//}

switch someInteger{
case 0:
    print("zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("unknown")
}

switch "han"{
case "jake":
    print("jake")
case "mina":
    print("mina")
case "han":
    print("han")
default:
    print("unknown")
}
