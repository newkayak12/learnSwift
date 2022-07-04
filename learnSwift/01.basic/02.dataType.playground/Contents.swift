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

/**
    2. Bool
    Bool은 불리언 타입이다. 불리언 타임은 true/false만 값으로 가진다.
 */
var boolean: Bool = true
boolean.toggle();
let iLoveyou: Bool = true;
let isTimeUnlimited: Bool=false;
print("시간은 무한합니까?? \(isTimeUnlimited)")

/**
    3. Float과 Double
 Float과 Double은 부동소수점을 사용하는 실수며 부동소수 타입이라고 한다. 흔히 우리가 말하는 소수점 자리가 있는 수이다. 부동소수 타입은 정수 타입보다 훨씬 넓은 범위의 수를 표현할 수 있다. 스위프트에는 64비트의 부동소수 표현을 하는 Double과 32비트 부동소수 표현을 하는 Float이 있다.
 
 64비트 환경에서 Double은 최소 15자리의 십진수를 표현할 수 있는 반면에 Float은 6자리의 숫자까지만 표현이 가능하다. 필요에 따라 둘 중 하나를 선택하여 사용할 텐데 무엇을 사용할지 모를 때 Double을 사용하는 것이 낫다.
 */

var floatValue: Float = 1234567890.1
//Float이 감당할 수 있는 범위를 넘어선다. 자신이 감당할 수 있는 수 까지만 남기므로 정확도가 떨어진다.

let doubleValue: Double = 1234567890.1
//Double은 수용할 수 있다.
print("floatValue: \(floatValue), doubleValue: \(doubleValue)")

//Float이 수용할 수 있는 범위의 수로 변경한다.
floatValue = 1233456.1

/**
 문자열 보간법을 사용하지 않고 단순히 변수, 상수 값만 보고 싶으면 print 함수의 전달 인자로 변수, 상수를 전달하면 된다.
    {
        부동 소숫값을 콘솔 로그에 출력해보면 우리가 평소에 볼 수 있는 10진수 표현이 아닌 다른 표현이 보이는 경우가 있다. 이는 콘솔 로그가 10진수로 표현할 수 있는 한계를 넘어서 지수로 표현된 값이다. 반대로 우리도 해당 표현을 사용해서 값을 넣어줄 수 있다. 10진수일 때와 16진수일 때 두 가지로 자릿수 확장 표현을 사용할 수 있다.
    }
 
 1.23e6 == 1.23E5 == 1.23 x 10^5
 
 **임의의 수 만들기
 -> Int.random(in: -100...100)
 -> UInt.random(in:1...30)
 -> Double.random(in: 1.5...4.3)
 -> Float.random(in: -0.5...1.5)
 
 
    4. Character
 Character는 말 그대로 '문자'를 의미한다. 단어, 문장처럼 문자의 집합이 아닌 단 하나의 문자를 의미한다. 스위프트는 유니코드 9 문자를 사용하므로 영어는 물론, 유니코드에서 지원하는 모든 언어 및 특수 기호 등을 사용할 수 있다. 문자를 표현하기 위해서는 값의 앞 뒤에 큰 따옴표를 사용하여 표현한다.
 */

let alphabetA: Character = "A"
print(alphabetA);

//Character 값에 유니코드 문자를 사용할 수 있다.
let commandCharater: Character = "💕";
let 한글변수이름: Character = "ㄱ";

//한글도 유니코드 문자에 속하므로 스위프트 코드의 변수 이름으로 사용할 수 있다.


/**
   5. String
 String은 문자의 나열, 즉 문자열이다. String은 Character와 마찬가지로 유니코드 9를 사용할 수 있으며, 값의 앞뒤에 큰 따옴표를 사용하여 표현한다.
 */

//상수로 선언된 문자열은 변경이 불가능하다.
let name: String = "YJ"

//이니셜라이저를 사용하여 빈 문자열을 생성할 수 있다.
//var 키워드를 사용하여 변수를 생성했으므로 문자열의 수정 및 변경이 가능하다.
var introduce: String = String();

//append() 메서드를 사용하여 문자열을 이어붙일 수 있다.
introduce.append("제 이름은")

//+ 연산자를 통해서도 문자열을 이어붙일 수 있다.
introduce = introduce + " " + name + "입니다.";
print(introduce);

//name에 해당하는 문자의 수를 셀 수 있다.
print("name의 글자 수 : \(name.count)")

//빈 문자열인지 확인해볼 수 있다.
print("introduce가 비어있습니까?: \(introduce.isEmpty)");

//유니코드의 스칼라값을 사용하면 값에 해당하는 표현이 출력된다.
let unicodeScalarValue: String = "\u{2665}"
print(unicodeScalarValue)

/**
    스위프트에서는 다른 언어들에 비해 비교적 손쉽게 문자열을 다룰 수 있다. String 타입에는 기본적으로 많은 메소드와 프로퍼티들이 구현되어 있으며, 문자열과 관련된 연산자도 많이 정의되어 있기 때문에 문자열을 조금이나마 다루기 쉽게 지원해준다.
 */

// 연산자를 통한 문자열 결합
let hello: String = "Hello";
let yj : String = "YJ";
var greeting:String = hello+" "+yj+"!"
print(greeting)

greeting=""
greeting += hello;
greeting+=" ";
greeting+=yj
greeting+="!"
print(greeting)

//연산자를 통한 문자열 비교
var isSameString: Bool = false;
isSameString = hello == "Hello"
print(isSameString)

isSameString = hello=="HELLO";
print(isSameString)

//메소드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix);

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix)

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)

//메소드를 통한 대소문자 변환
var converString : String = ""
converString = hello.uppercased()
print(converString)

converString = hello.lowercased()
print(converString)


//프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false;
isEmptyString = greeting.isEmpty;
print(isEmptyString)

greeting="안녕";
isEmptyString = greeting.isEmpty
print(isEmptyString)

greeting=""
isEmptyString = greeting.isEmpty
print(isEmptyString)

//프로퍼티를 이용해 문자열 길이 확인
print(greeting.count)

greeting="안녕하세요"
print(greeting.count)

greeting="안녕!"
print(greeting.count)

// 코드상에서 여러 줄의 문자열을 직접 쓰고 싶다면 큰따옴표 세 개를 사용하면된다.
// 큰따옴표 세 개를 써주고 한 줄을 내려써야한다.
//마지막 줄도 큰따옴표 세 개는 할 줄 내려써야한다.

greeting="""
안녕하세요 저는 야진이입니다.
스위프트 잘하고 싶어요!
잘 부탁합니다!
"""

/**
    6. 특수문자
 스위프트에는 문자열 내에서 일정 기능을 하는 특수문자(제어문)이 있다. 특수문자는 모두 백슬래시를 특정 문자와 조합해서 사용한다.  (이스케이핑)
 
    \n 줄바꿈
    \\ 문자열 내에서 백슬래시를 표현하고자 할 떄 사용
    \" 문자열 내에서 큰 따옴표를 표현하고자 할 경우
    \t 탭
    \0 문자열의 끝, null문자
 */
print("문자열 내부에 \n 이런 \"특수문자\"를 \t 사용하면 \\이런 문자를 볼 수 있다.")
print(#"문자열 내부에서 특수문자를 사용하지 싫다면 문자열 앞, 뒤에 #를 붙이면 된다."#)
let number:Int = 100;
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 #\(number) 해보세요"#)

/**
    7. Any, AnyObject와 nil
 Any는 스위프트의 모든 데이터 타입을 사용할 수 있다는 뜻이다. 변수 또는 상수의 타입이 Any로 지정되어 있다면 그 변수 또는 상수에는 어떤 종류의 데이터 타입이든지 상관없이 할당할 수 있다.
 AnyObject는 Any보다는 조금 한정된 의미로 클래스의 인스턴스만 할당할 수 있다.
 */
var someVar: Any = "YJ"
someVar = 50
someVar = 10.1
//정수, 실수, 문자열 어떤 것이든 할당할 수 있다.
/**
    {
        Any, AnyObject는 안쓰는 편이 좋다. 타입에 엄격한 스위프트의 특성상 Any, AnyObject로 선언된 변수의 값을 가져다 쓰려면 매번 타입 확인 및 변환을 해줘야하는 불편함이 있고 오류의 위험성을 증가시킨다. (Object와 유사)
    }
 
 nil은 사실 특정 타입이 아니라 '없음'을 나타내는 스위프트 키워드이다. 즉, 변수 또는 상수에 값이 들어있지 않고 비어있음을 나타내는 데 사용한다. 변수 또는 상수에 값이 없는 경우, 즉 nil이면 해당 변수 또는 상수에 접근했을 때 잘못된 메모리 접근(memoryAccess)로 런타임 에러가 발생한다. 잘못한 메모리에 접근하여 발생하는 런타임 오류중 흔히 NullPointerException과 같다. 추가적으로 데이터 타입 기본에서 설명하지는 않지만 특정 함수의 반환 타입으로 사용될 수 있는 Never라는 타입이 있다. 
 */

