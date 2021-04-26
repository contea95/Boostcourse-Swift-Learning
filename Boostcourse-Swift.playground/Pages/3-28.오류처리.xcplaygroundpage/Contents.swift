import Swift

// 1. 오류 처리
// 스위프트에서 오류는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현
// Error 프로토콜은 요구사항이 없는 빈 프로토콜, 오류를 표현하기 위한 타입(주로 열거형)은 이 프로토콜을 채택
// 스위프트의 열거형은 오류의 종류를 나타내기에 좋은 기능
// 연관 값을 통해 오류에 관한 부가 정보를 제공할 수 있다.

// 2. 오류 표현
// Error 프로토콜과 열거형을 통해 오류를 표현
enum VendingMachineError: Error {
    case invalidInput
    case insufficientFunds(moneyNeeded: Int)
    case outOfStock
}

// 3. 함수에서 발생한 오류 던지기
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 돈 받기 메서드
    func receiveMoney(_ money: Int) throws {
        // 입력 돈이 0 이하인 경우
        guard money > 0 else{
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건 팔기 메서드
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String{
        
        // 원하는 아이템의 수량이 잘못 입력되었으면 오류 던지기
        guard numberOfItemsToVend > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다.
        guard numberOfItemsToVend * itemPrice <= deposited else{
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류
        guard itemCount >= numberOfItemsToVend else{
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상 처리
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?

// 4. 오류 처리
// 오류를 던질 수도 있지만, 오류가 던져지는 것에 대비해 던져진 오류를 처리하기 위한 코드도 작성해야 한다. 예를 들면 던져진 오류가 무엇인지 판단하여 다시 문제를 해결한다든지, 다른 방법으로 시도한다든지, 사용자에게 오류를 알리고 사용자에게 선택 권한을 넘겨주어 다음에 어떤 동작을 하게 할 것인지 결정하도록 유도하는 등의 코드 작성
// 오류 발생의 여지가 있는 throws 함수는 try를 사용하여 호출해야 한다. try, do-catch, try?, try!

// < do-catch>
// 오류 발생 여지가 잇는 throws 함수는 do-catch 구문을 활용하여 오류 발생에 대비
// 가장 정석적인 방법은 모든 오류 케이스에 대응

do{
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput{
    print("입력이 잘못되었습니다.")
} catch VendingMachineError.insufficientFunds(let moneyNeeded){
    print("\(moneyNeeded)원이 부족합니다.")
} catch VendingMachineError.outOfStock{
    print("수량이 부족합니다.")
}

do{
    try machine.receiveMoney(300)
}catch/*(let error)*/ {
    switch error{
    case VendingMachineError.invalidInput:
        print("입력이 잘못되었습니다.")
    case VendingMachineError.insufficientFunds(let moneyNeeded):
        print("\(moneyNeeded)원이 부족합니다.")
    case VendingMachineError.outOfStock:
        print("수량이 부족합니다.")
    default:
        print("알수없는 오류 \(error)")
    }
}

// 케이스 별로 오류처리 할 필요가 없으면 catch 구문 내부를 간략화해도 된다.
do{
    result = try machine.vend(numberOfItems: 4)
}catch{
    print(error)
}

// <try? 와 try!>
// 1. try?
// 별도의 오류처리 결과를 통보받지 않고 오류가 발생했으면 결과값을 nil로 돌려받을 수 있습니다.
// 정상동작 후에는 옵셔널 타입으로 정상 반환값을 돌려받습니다.
result = try? machine.vend(numberOfItems: 2)
result

result = try? machine.vend(numberOfItems: 2)
result

// 2. try!
// 오류가 발생하지 않을 것이라는 강력한 확신을 가질 때 try!를 사용하면 정상동작 후에 바로 결과값을 돌려받는다
// 오류가 발생하면 런타임 오류가 발생해 애플리케이션 동작이 중지
result = try! machine.vend(numberOfItems: 1)
result
//result = try! machine.vend(numberOfItems: 1)
//result

// 더 알아보기
// rethrows
// defer
