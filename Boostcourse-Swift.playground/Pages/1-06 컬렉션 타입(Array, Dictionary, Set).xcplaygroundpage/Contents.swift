// Array - 순서가 있는 리스트 컬렉션
// Dictionary - '키'와 '값'의 쌍으로 이루어진 컬렉션
// Set - 순서 없고 멤버가 유일한 컬렉션

// 1. Array 선언 및 생성
var integers:Array<Int> = Array<Int>()

// 동일 표현
var integers1:Array<Int> = [Int]()
var integers2:Array<Int> = []
var integers3:[Int] = Array<Int>()
var integers4:[Int] = [Int]()
var integers5:[Int] = []
var integers6 = [Int]()

// 2. Array의 활용
integers.append(1)
integers.append(100)

// Int 타입이 아닌 것은 Array에 넣을 수 없습니다.
//integers.append(100.1)

print(integers)

// 멤버 포함 여부 확인
print(integers.contains(100))
print(integers.contains(99))

// 멤버 교체
integers[0] = 99

// 멤버 삭제
integers.remove(at:0)
integers.removeLast()
integers.removeAll()

// 멤버 수 확인
print(integers.count)

// 인덱스를 벗어난 접근을 하면 익셉션 런타임 오류 발생
//integers[0]

// 불변 Array:let 을 사용하여 Array 선언
let immutableArray = [1,2,3]

// 수정이 불가능한 Array여서 멤버를 추가하거나 삭제할 수 없다
//immutableArray.append(4)
//immutableArray.removeAll()


// 1. Dictionary의 선언과 생성
// Key가 String, Value가 Any인 빈 Dictionary 생성
var anyDictionary:Dictionary<String, Any>=[String:Any]()

// 위와 동일한 표현
var anyDictionary1:Dictionary<String, Any> = Dictionary<String, Any>()
var anyDictionary2:Dictionary<String, Any> = [:]
var anyDictionary3:[String:Any]=Dictionary<String, Any>()
var anyDictionary4:[String:Any]=[String:Any]()
var anyDictionary5:[String:Any]=[:]
var anyDictionary6 = [String:Any]()

// 2. Dictionary 활용
// 키에 해당하는 값 할당
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

print(anyDictionary)

// 키에 해당하는 값 변경
anyDictionary["someKey"] = "dictionary"
print(anyDictionary)

// 키에 해당하는 값 제거
anyDictionary.removeValue(forKey:"anotherKey")
anyDictionary["someKey"] = nil
print(anyDictionary)

// 3. 불변 Dictionary: let을 이용해 Dictionary 선언
let emptyDictionary:[String:String]=[:]
let initalizedDictionary:[String:String] = ["name":"han", "gender":"male"]

// 불변 Dictionary이므로 값 변경 불가

// 1. Set 생성 및 확인
var integerSet:Set<Int> = Set<Int>()

// insert : 새로운 멤버 입력
// 동일한 값은 여러번 insert해도 하나만 저장
integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(100)

print(integerSet)

// contains : 멤버 포함 여부 확인
print(integerSet.contains(1))
print(integerSet.contains(2))

// remove: 멤버 삭제
integerSet.remove(99)
integerSet.removeFirst()

// count: 멤버 개수
integerSet.count

// 2. Set의 활용
// 멤버의 유일성 보장
let setA:Set<Int> = [1,2,3,4,5]
let setB:Set<Int> = [3,4,5,6,7]

// 합집합
let union:Set<Int> = setA.union(setB)
print(union)

// 합집합 오름차순 정렬
let sortedUnion:[Int]=union.sorted()
print(sortedUnion)

// 교집합
let intersection:Set<Int> = setA.intersection(setB)
print(intersection)

// 차집합
let subtracting:Set<Int> = setA.subtracting(setB)
print(subtracting)
