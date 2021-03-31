// Swift의 기본 데이터 타입
// Bool, Int, UInt, Float, Double, Character, String

// Bool
var someBool:Bool = true
someBool = false

// Int
var someInt:Int = -100

// UInt
var someUInt:UInt = 100

// Float
var someFloat:Float = 3.14
someFloat = 3

// Doulbe
var someDouble:Double = 3.14
someDouble = 3
// someDouble = someFloat // 컴파일 오류 발생함! 스위프트는 데이터타입의 공유 엄격하게 제한

// Character
var someCharacter:Character = "😃"
someCharacter = "가"
// someCharacter = "가나다"  // 오류 발생
print(someCharacter)

// String
var someString:String = "하하하 🔥"
someString = someString + "웃으면 불이 와요"
print(someString)
