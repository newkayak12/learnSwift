import UIKit

/**
    3. 스위프트의 데이터 타입
    스위프트의 기본 데이터 타입은 구조체를 타입의 기반으로 삼아 스위프트의 다양한 기능 (익스텐션, 제네릭 등)을 두루 사용하여 구현되어 있다. 그중 가장 주목해야할 점 스위프트의 기본 데이터 타입이 모두 구조체를 기반으로 구현되어 있다는 것이다.
 
    스위프트의 모든 데이터 타입 이름은 첫 글자가 대문자로 시작하는 대문자 카멜케이스를 사용한다.
 
 
    1. Int, UInt
    정수 타입이며 Int는 +, -를 구분하며 UInt는 0 이상의 정수를 표현한다. 이 둘은 Int8, Int16, Int32, Int64 UInt8, UInt16, UInt32 UInt64가 있다. 시스템 아키텍쳐에 따라 Int, UInt가 달라진다. 32비트 아키텍쳐에서는 Int32가 Int로, UInt32가 UInt타입으로 지정된다. 그리고 64비트 아키텍쳐에서는 Int64가 Int, UInt64가 UInt 타입으로 지정된다.
 */

var integer:Int = -100;
var unsignedInteger: UInt = 50;
print("inter 값 : \(integer), unsignedInteger: \(unsignedInteger)")
print("Int 최대값 : \(Int.max), Int 최소값: \(Int.min)")
print("UInt 최대값 : \(UInt.max), UInt 최소값: \(UInt.min)")

let largeInteger: Int64 = Int64.max
let smallUnSignedInteger: UInt8 = UInt8.max
print("Int64 최대값 : \(largeInteger), uInt 최대값 : \(smallUnSignedInteger)")

//let tooLarge:Int = Int.max+1 // Int의 표현범위 초과 (arithmetic operation '9223372036854775807 + 1' (on type 'Int') results in an overflow)

//let cannotBeNegative:UInt = -5 //UInt는 음수가 될 수 없다.

//integer = unsignedInteger // Int, UInt는 다른 타입
integer = Int(unsignedInteger) //타입 변환

