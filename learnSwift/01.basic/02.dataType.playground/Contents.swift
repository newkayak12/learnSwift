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


????????????? 03.advancedDataType
import Foundation

/**
   > 데이터 타입 안심
   애플이 처음 스위프트를 발표할 때 스위프트의 특징 중 안정성을 엿볼 수 있는 부분이다. 스위프트는 타입에 굉장히 민감하고 엄격하다. 서로 다른 타입끼리의 데이터 교환은 꼭 타입 캐스팅(Type-Casting)을 거쳐야한다. 스위프트에서 값 타입의 데이터 교환은 엄밀히 말하면 타입 캐스팅이 아닌 새로운 인스턴스를 생성하여 할당하는 것이다.0

    1. 데이터 타입 안심이란
    스위프트는 데이터 타입을 안심하고 사용할 수 있는(type-safe)언어이다. 타입을 안심하고 사용할 수 있다는 말은 그만큼 실수를 줄일 수 있다는 의미이다. 예를 들어서 Int 타입 변수에 할당하려는 값이 Character 타입이라면 컴파일 오류가 발생한다. 이런 오류는 프로그래밍 도중에 눈치채기 어려워서 컴파일러가 알려주지 않으면 나주엥 오류를 찾아내기도 쉽지 않다. 그렇지만 스위프트는 컴파일 오류로 알려주므로 서로 다른 타입의 값을 할당하는 실수를 줄일 수 있다. 이렇게 스위프트가 컴파일 시 타입을 확인하는 것을 '타입 확인'이라고 한다. 타입 확인을 통해 여러 타입을 섞어 사용할 때 발생할 수 있는 런타임 오류를 피할 수도 있다.

    2. 타입 추론
    스위프트에서는 변수나 상수를 선언할 떄 특정 타입을 명시하지 않아도 컴파일러가 할당된 값을 기주능로 변수나 상수의 타입을 결정한다. 예를 들어서 let name = "YJ"이라는 코드를 작성하면, 컴파일러가 컴파일하면서 name의 타입을 String으로 결정한다.
*/

// 타입을 지정하지 않았으나 타입 추론을 통해서 name은 String 타입으로 선언된다.
var name = "YJ";

// 앞서 타입 추론에 의해 name은 String 타입의 변수로 지정되었기 떄문에
// 정수를 할당하려고 시도하면 오류가 발생한다.
// name = 100;

/**
    3. 타입 별칭
    스위프트에서 기본으로 제공하는 데이터 타입이든, 사용자가 임의로 만든 데이터 타입이든 이미 존재하는 데이터 타입에 임의로 다른 이름(별칭)을 부여할 수 있다. 그런 다음 기본 타입 이름과 이후에 추가한 별칭을 모두 사용할 수 있다.
*/
typealias MyInt = Int;
typealias YouInt = Int;
typealias MyDouble = Double;

let age: MyInt = 100; //MyInt는 Int의 또 다른 이름이다.
let year: YouInt = 2080; //YouInt는 Int의 또 다른 이름이다.

// MyInt도, YouInt도 Int이기 때문에 같은 타입으로 취급한다.
let month:Int = 7; //기존의 Int도 사용 가능하다.
let percentage:MyDouble = 9.99; // Int외의 자료형도 모두 별칭 사용이 가능하다.

/**
    4. 튜플
    '튜플(Tuple)'은 타입의 이름이 따로 지정되어있지 않은, 프로그래머 마음대로 만드는 타입이다. '지정된 데이터의 묶음'이라고 표현할 수 있다. C언어를 예로 들면 원시 구조체와 형태가 가깝다.
    스위프트의 튜플은 파이썬의 튜플과 유사하다. 튜플은 타입 이름이  따로 없으므로 일정 타입의 나열만으로 튜플 타입을 생성해줄 수 있다. 튜플에 포함될 데이터의 개수는 자유롭게 정할 수 있다. 하나가 될 수도, 두 개가 될 수도, 열 개가 될 수도 있다.
*/

//String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("YJ", 100, 12.9);

//인덱스를 통해서 값을 뺴 올 수 있다.
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 99 //인덱스로 값을 할당할 수도 있다.
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

/**
   튜플의 각 요소를 이름 대신 숫자로 표현하기 떄문에 간편해 보일 수 있지만, 차후에 다른 프로그래머가 코드를 볼 깨 각 요소가 어떤 의미가 있는지 유추하기가 어렵다. 이름 없이 인덱스만으로 각 요소의 데이터가 무엇을 나타내는 지 쉽게 파악하기 어렵기 때문이다. 그래서 튜플에 이름을 붙여줄 수 있다.
*/

var persons: (name:String, age:Int, height:Double) = ("YJ", 100, 192.2)

//요소의 이름으로 값을 뺴 올 수 있다.
print("이름: \(persons.name), 나이: \(persons.age), 신장: \(persons.height)")

persons.name = "HELLO"; //이름으로 값을 바꿀 수도 있다.
print("이름: \(persons.name), 나이: \(persons.age), 신장: \(persons.height)")

/**
    또, 튜플에는 타입 이름에 해당하는 키워드가 따로 없다 보니 사용에 불편함을 겪을 수도 있다. 매번 같은 모양의 튜플을 사용하고 싶은데 선언해줄 때마다 긴 튜플 타입을 모두 써줘야하는 불편함이 생길 수 있기 때문이다. 이럴 때 타입 별칭을 사용하여 조금 더 깔끔하게 사용할 수 있다.
*/

typealias PersonTuple = (name:String, age:Int, height:Double)

let personInfo: PersonTuple = ("yj", 190, 12);
print("이름: \(personInfo.name), 나이: \(personInfo.age), 신장: \(personInfo.height)")


???????? 04.Collections
/**
    스위프트는 튜플 외엥도 많은 수의 데이터를 묶에서 저장하고 관리할 수 있는 컬렉션 타입을 제공한다. 컬렉션 타입에는 배열(Array), 딕셔너리(Dictionary), 세트(Set)가 있다.


    1. 배열(Array)
    배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입이다. 각기 다른 위치에 같은 값이 중복해서 들어갈 수도 있다.
    배열 타입을 선언하는 방법은 다양하다. let 키워드를 사용해서 상수로 선언하면 변경할 수 없는 배열이되고, var 키워드로 배열을 선언하면 변경 가능한 배열이 된다. 실제로 배열을 사용할 때는 Array라는 키워드와 타입 이름의 조합으로 사용한다. 또, 대괄호로 값을 묶어 Array 타입임을 표현할 수 있다. 빈 배열은 이니셜라이저 또는 리터럴 문법을 통해서 생성해줄 수 있는데, isEmpty 프로퍼티로 비어있는 배열인지 확인해볼 수 있다. 그리고 배열에 몇 개의 요소가 존재하는지 알고 싶으면 count 프로퍼티로 확인하면 된다.typealias

        {
            스위프트의 Array는 C언어의 배열처럼 버퍼(buffer)이다. 단 C언어처럼 한 번 선언하면 크기가 고정되던 버퍼가 아니라, 필요에 따라 자동으로 버퍼의 크리를 조절해주므로 요소의 삽입 및 삭제가 자유롭다. 스위프트는 이런 리스트 타입을 Array, 즉 배열이라고 표현한다.
        }
*/

//대괄호를 사용하여 배열임을 표현한다.
var names: Array<String> = ["hello", "hi", "how are you?"]

//이를 더 축약할 수 있다.
var names2: [String] = ["a","b","c","d"];

var emptyArray:[Any] = [Any]() //Any 데이터 요소를 갖는 빈 배열을 생성한다.
var emptyArray2:[Any] = Array<Any>();


//배열의 타입을 정확히 명시해줬다면 []만으로도 빈 배열을 생성할 수 있다.
var emptyArray3:[Any] = []


/**
    배열은 각 요소에 인덱스를 통해서 접근할 수 있다. 인덱스는 0부터 시작한다. 잘못된 인덱스로 접근하려고 하면 Exception이 발생한다. 또, 맨 처음과 맨 마지막 요소는 first와 last 프로퍼티를 통해서 가져올 수 있다. index(of:) 메솧소드를 사요하면 해당 요소의 인덱스를 알아낼 수도 있다. 만약 중복된 요소가 있다면 제일 먼저 발견된 요소의 인덱스를 반환한다. 맨 뒤에 요소를 추가하고 싶다면 append(_:) 메소드를 사용한다.
    중간에 요소를 삽입하고 싶다면 insert(_:at:) 메소드를 사용하면 된다. 요소를 삭제하고 싶다면 remove(_:) 메소드를 사용하게 되는데, 메소드를 사용하면 해당 요소가 삭제된 후 반환된다.
*/

print(names[2])
// print(name[99]) //범위를 벗어났기 때문에 오류 발생

names.append("LOL"); //맨 마지막에 LOL 이 추가된다.
names.append(contentsOf:["john", "limbo"])//맨 마지막에 ["john", "limbo"]가 추가된다.
names.insert(contentsOf:["john", "limbo"], at:2) //인덱스 2에 ["john", "limbo"]가 삽입된다.

print(names.index(of:"john"))
print(names.first)
print(names.last)


let firstItem: String = names.removeFirst()
let lastItem: String = names.removeLast()
let indexZeroItem: String  = names.remove(at:0)

print(firstItem)
print(lastItem)
print(indexZeroItem) //삭제한 값을 반환한다. (pop 같다.)
print(names[1...3]) //스프레드도 가능

/**
    names[1...3]는 범위 연산자를 사용하여 names 배열의 일부만 가져온 것이다. 코드처럼 읽기 뿐만 아니라 names[1..3] = ["A", "B", "C"]와 같이 변경도 가능하다.
    스위프트의 배열을 비롯한 컬렉션 타입을 활용할 떄 서브스크립트(SubScript) 기능을 많이 사용한다.


    2. 딕셔너리(Dictionary)
    딕셔너리는 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입이다. 딕셔너리에 저장되는 값은 항상 키와 쌍을 이루게 되는데, 딕셔너리 안에는 키가 하나이거나 여러 개일 수 있다. 단, 하나의 딕셔너리 안에는 같은 이름의 키를 중복해서 사용할 수 없다.
    딕셔너리는 Dictionary라는 키워드와 키의 타입과 값의 타입 이름의 조합으로 써준다. 대괄호로 키와 값의 타입 이름의 쌍을 묶어 딕셔너리 타입임을 표현한다. let 키워드를 사용하여 상수로 선언하면 변경 불가능한 딕셔너리가 되고, var키워드를 사용하여 변수로 선언해주면 ㅂ3ㅕㄴ경 가능한 딕셔너리가 된다. 빈 딕셔너리는 이니셜라지저 또는 리터러 문법을 통해 생성할 수 있다. isEmpty 프로퍼티를 통해서 비어있는 딕셔너리인지 확인 할 수 있다. 그리고 count 프로퍼티로 딕셔너리의 요소 개수를 확인할 수 있다.
*/
//typealias를 통해서 조금 더 단순하게 표현할 수도 있다.
typealias StringIntDictionary  = [String: Int]
//키는 String, 값은 Int 타입인 빈 딕셔너리를 생성한다.
var numberForName: Dictionary<String, Int>  = Dictionary<String, Int>();
//위 선언과 같은 표현이다.
var numberForName2: [String:Int] = [String:Int]()
var numberForName3: StringIntDictionary = StringIntDictionary();

// 딕셔너리의 키와 값 타입을 정확히 명시했다면 [:]만으로도 빈 딕셔너리를 생성할 수 있다.
var numberForName4: [String:Int] = [:];

// 초기 값을 부여해서 생성할 수도 있다.
var numberForName5: [String:Int] = ["hello":1, "hi":2, "howAreYou":3];

/**
    딕셔너리는 각 값에 키로 접근할 수 있다. 딕셔너리 내부에서 키는 유일해야하며, 값은 유일하지 않아도 된다. 딕셔너리는 배열과 다르게 딕셔너리 냅주에 없는 키로 접근해도 오류를 반환하지 않는다. 다만 nil을 반환한다. 특정 키에 해당하는 값을 제거하려면 removeValue(forKey:) 메소드를 이용한다. 키에 해당하는 값이 제거된 후 반환된다.
*/
print(numberForName5["hello"]) //1
print(numberForName5["hello2"]) //nil

numberForName5["kkk"] = 1234
print(numberForName5["kkk"]) //1234

print(numberForName5.removeValue(forKey:"kkk")) //1234

//위에서 kkk에 대한 값이 삭제되었으므로 nil이 반환된다.
//키에 대한 값이 없으면 기본값을 반환하도록 할 수도 있다.
print(numberForName5.removeValue(forKey:"kkk"))

print(numberForName5["kkk", default: 0]);


/**
    3. 세트(Set)
    세트는 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션이다. 세트 내의 값은 모두 유일한 값, 즉 중복된 값이 존재하지 않는다. 그래서 세트는 보통 '순서가 중요하지 ㅇ낳거나 각 요소가 유일한 값이어야하는 경우'에 사용한다.또 세트의 요소로는 해시 가능한 값이 들어와야한다.(Hashable 프로토콜을 따른 다는 것을 의미한다. )

    세트는 Set 키워드와 타입 이름의 조합으로 써준다. 또, 배열과 마찬가지로 대괄호로 값을 묶어 세트 타입임을 표현한다. 배열과 달리 줄여서 표현할 수 있는 축향형이 없다. let으로 선언하면 변경불가, var로 선언하면 변경 가능한 세트가 된다. 빈 세트는 이니셜라이저 또는 리터럴 문법을 통해서 생성할 수 있다. isEmpty로 비어있는지 확인할 수 있고 count로 개수를 확인할 수도 있다.
*/

var nameSet : Set<String> = Set<String>();
var nameSet2: Set<String> = [];

//Array와 마찬가지로 대괄호를 사용한다.
var nameSet3: Set<String> = ["hi", "Hello", "howAreYou", "bye", "hi"];

//그렇기 때문에 타입 추론을 사용하게 되면 컴파일러는 Set이 아닌 Array로 타입을 지정한다.
var numberss = [100, 200, 300]
print(type(of:numberss); //Array<Int>

print(names3.isEmpty)
print(names3.count)

/**
    세트에 요소를 추가하고 싶으면 insert(_:)를 사용하면 되고 요소를 삭제하고 싶다면 remove(_:) 메소드를 사용하는데, 해당 요소가 삭제후 리턴된다.
*/
print(nameSet3.remove("hi")) //hi
/**
    세트는 자신 내부의 값들이 모두 유일함을 보장하므로, 집합관계를 표현하고자 할 떄 유용하게 쓰일 수 있으며, 두 세트의 교집합, 합집합 등을 연산하기에 매우 용이하다. 또한 sorted() 메소드를 통해서 정렬된 '배열'을 반환해줄 수도 있다.
*/

let englishClassStudent: Set<String> = ["john","clerk", "minsoo"]
let koreanClassStudent: Set<String> = ["jenny", "jaeSik", "minsoo", "john"]

//교집합
let intersectSet: Set<String> = englishClassStudent.intersection(koreanClassStudent)

//여집합의 합
let symmetricDiffSet: Set<String> = englishClassStudent.symmetricDiffernece(koreanClassStudent)

//합집합
let union: Set<String> = englishClassStudent.union(koreanClassStudent)

//차집합
let subtractSet: Set<String>  = englishClassStudent.subtracting(koreanClassStudent)

// 세트는 포함 관계를 연산할 수 있는 메소드도 구현되어 있다.

let 새: Set<String> = ["비둘기", "닭", "기러기"];
let 포유류:Set<String> = ["사자", "호랑이", "곰"];
let 동물:Set<String> = 새.union(포유류);

print(새.isDisjoint(with:포유류)) //서로 배타적인지 : true
print(새.isSubset(of:동물)) //새가 동물의 부분집합인가? : true
print(동물.isSuperset(of:포윺류)) //동물은 포유류의 전체집합인가 :true
print(동물.isSuperset(of:새)) //동물은 새의 전체집합인가 :true

/**
    {
      컬렉션에서 임의의 요소 추출과 뒤섞기
    }
*/
