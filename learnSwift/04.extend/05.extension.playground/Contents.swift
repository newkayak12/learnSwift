/**
                익스텐션
 
 
            1. 익스텐션이란
익스텐션(extension)은 스위프트의 강력한 기능 중 하나로 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있다. 기능을 추가하려는 타입을 구현한 소스 코드를 알지 못하거나 볼 수 없다고 해도, 타입만 안다면 그 타입의 기능을 확장할 수도 있다. 익스텐션은 Objective-C의 카테고리와 유사한 기능이다. Objective-C의 카테고리는 카테고리마다 이름을 명명햇지만 스위프트의 익스텐션은 이름이 없다. 스위프트의 익스텐션이 타입에 추가할 수 있는 기능은 아래와 같다.
 
    - 연산 타입 프로퍼티/ 연산 인스턴스 프로퍼티
    - 타입 메소드/ 인스턴스 메소드
    - 이니셜라이저
    - 서브스크립트
    - 중첩 타입
    - 특정 프로토콜을 준수할 수 있도록 기능 추가

 '익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의할 수는 없다.' 클래스의 상속과 익스텐션을 비교해보자 이 둘은 비슷해보이지만 실제로는 꽤 다르다. 클래스의 상속은 클래스 타입에서만 가능하지만 익스텐션은 구조체, 클래스, 프로토콜 등에 적용이 가능하다. 또, 클래스의 상속은 특정 타입을 물려받아 하나의 새로운 타입을 정의하고 추가 기능을 구현하는 수직 확장이지만, 익스텐션은 기존의 타입에 기능을 추가하는 수평 확장이다. 상속을 받으면 기존 기능을 재정의할 수 있지만, 익스텐션은 재정의할 수 없다는 것도 큰 차이 중 하나이다. 상황과 용도에 맞게 상속과 익스텐션을 선택하여 사용하면 된다.
 
                        상속                                  익스텐션
    확장              수직 확장                                수평 확장
    사용          클래스 타입에서만 사용    클래스, 구조체, 프로토콜, 제네렉 등 모든 타입에서 사용
    재정의             재정의 가능                          재정의 불가능
 
 익스텐션을 사용하는 대신 원래 타입을 정의한 소스에 기능을 추가하는 방법도 있겠지만, 외부 라이브러리나 프레임워크를 사용했다면 원본 소스를 수정하지 못한다. 이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할 때 익스텐션을 사용한다. 따로 상속을 받지 않아도 되며, 구조체와 열거형에도 기능을 추가할 수 있으므로 익스텐션은 매우 편리하다.
 
 익스텐션은 모든 타입에 적용할 수 있다. 모든 타입이라고 하면 구조체, 열거형, 클래스, 프로토콜, 제네릭 타입 등을 의미한다. 즉, 익스텐션을 통해 모든 타입에 연산 프로퍼티, 메소드, 이니셜라이저, 서브스크립트, 중첩 데이터 타입 등을 추가할 수 있다.
 
 
 
            2. 익스텐션 문법
 익스텐션은 extension이라는 키워드를 사용하여 선언한다.
        extension [ 확장할 타입 이름 ] {
                //타입에 추가될 새로운 기능 구현
        }
 
 익스텐션은 기존에 존재하는 타입이 추가로 다른 프로토콜을 채택할 수 있도록 확장할 수도 있다. 이런 경우에는 클래스나 구조체에서 사용하던 것과 똑같은 방법으로 프로토콜을 이름을 나열해준다.
 
        extension 확장할 타입 이름: 프로토콜1, 프로토콜2, 프로토콜3 {
                //프로토콜 요구 사항 구현
        }

 스위프트 라이브러리를 살펴보면 실제로 익스텐션이 굉장히 많이 사용됨을 알 수 있다. Double 타입에는 수많은 프로퍼티와 메소드, 이니셜라이저가 정의되어 있으며 수많은 프로토콜 채택할 것으로 예상되지만, 실제로 Double 타입의 정의를 살펴보면 그 모든 것이 다 정의되어 있지는 않다.
 */
///A double-precision, floating-point value type

/**
             public struct Double {
                 public init()
                 public init(_ v: UInt8)
                 public init(_ v: Int8)
                 public init(_ v: UInt16)
                 public init(_ v: Int16)
                 public init(_ v: UInt32)
                 public init(_ v: Int32)
                 public init(_ v: UInt64)
                 public init(_ v: Int64)
                 public init(_ v: Int)
                 public init(_ other: Float)
                 public init(exactly other: Float)
                 public init(_ other: Double)
                 public init(exactly other: Double)
                 public init(_ other: Float80)
                 public init(exactly other: Float80)
             }
 
 
 
    그러면 Double 타입에서 채택하고 준수해야 하는 수많은 프로토콜은 어디에 있을까? 어디에서 채택하고 어디에서 준수하도록 정의하도록 정의되어 있을까? 당연히 답은 익스텐션이다. 위 예시는 Double 타입에 익스텐션 중 아주 일부이다.
 */
//스위프트 표준 라이브러리의 Double 타입에 구현한 익스텐션의 일부 코드
/**
             extension Double: CustomStringConvertible {
                 // A textual representation of the value.
                 public var description: String { get }
             }
             extension Double: CustomDebugStringConvertible {
                 // A textual representation of the value, suitable for debugging.
                 public var debugDescription: String { get }
             }
             extension Double: ExpressibleByIntegerLiteral {
                 // - Parameter value: The new value.
                 public init( integerLiteral value: Int64)
             }
             extension Double: Hashable {
                 // The number's hash value.
                 public var hashValue: Int { get }
             }
             extension Double: CustomReflectable {
                 // A mirror that reflects the 'Double' instance
                 public var customMirror: Mirror { get }
             }
 
 
    이처럼 스위프트 표준 라이브러리 타입의 기능은 대부분 익스텐션으로 구현되어 있다.
 
        3. 익스텐션으로 추가할 수 있는 기능
    
        3.1 연산 프로퍼티
    익스텐션을 통해서 타입에 연산 프로퍼티를 추가할 수 있다.
 */
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}
print(1.isEven)
print(2.isEven)
print(1.isOdd)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)

number = 2
print(number.isEven)
print(number.isOdd)
/**
    위의 예시의 익스텐션은 Int 타입에 두 개의 연산 프로퍼티를 추가한 것이다. Int 타입의 인스턴스가 홀수인지 짝수인지 판별하여 Bool 타입으로 알려주는 연산 프로퍼티이다. 익스텐션으로 Int 타입에 추가해준 연산 프로퍼티는 Int 타입의 어떤 인스턴스에도 사용이 가능하다. 위 코드처럼 인스턴스 연산 프로퍼티를 추가할 수도 있으며, static 키워드를 사용하여 타입 연산 프로퍼티도 추가할 수 있다.
    
    익스텐션으로 연산 프로퍼티를 추가할 수는 있지만, 저장 프로퍼티는 추가할 수 없다. 또, 타입에 정의되어 있는 기존의 프로퍼티에 프로퍼티 감시자를 추가할 수도 없다.
 
 
 
 
                3.2 메소드
    익스텐션을 통해 타입에 메소드를 추가할 수도 있다.
 */
extension Int {
    func multiply(by n: Int) -> Int {
        return self * n
    }
    mutating func multiplySelf(by n: Int) {
        self = self.multiply(by: n)
    }
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

print(3.multiply(by: 2)) //6
print(4.multiply(by: 5)) //20

var number2: Int = 3

number.multiplySelf(by: 2)
print(number2)

number.multiplySelf(by: 3)
print(number2)

Int.isIntTypeInstance(number2)
Int.isIntTypeInstance(3)
Int.isIntTypeInstance(3.0)
Int.isIntTypeInstance("3")

prefix operator ++

struct Position {
    var x: Int
    var y: Int
}

extension Position {
    // + 중위 연산 구현
    static func + (left: Position, right: Position) -> Position {
        return Position(x: left.x + right.x , y: left.y + right.y)
    }
    
    // - 전위 연산 구현
    static prefix func - (vector: Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }
    
    // += 복합할당 연산자 구현
    static func += ( left: inout Position, right: Position ) {
        left = left + right
    }
}
extension Position {
    // == 비교 연산자 구현
    static func == ( left: Position, right: Position ) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    // != 비교 연산자
    static func != ( left: Position, right: Position ) -> Bool {
        return !(left == right)
    }
}

extension Position {
    // ++ 사용자 정의 연산자 구현
    static prefix func ++ (position: inout Position) -> Position {
        position.x += 1
        position.y += 1
        return position
    }
}

var myPosition: Position = Position(x: 10, y: 10)
var yourPosition: Position = Position(x:-5, y:-5)


print(myPosition + yourPosition)
print(-myPosition)

myPosition += yourPosition
print(myPosition)

print(myPosition == yourPosition)
print(myPosition != yourPosition)

print(++myPosition)
/**
    위 예시에서는 익스텐션을 통해 Int 타입에 여러 종류의 메소드를 추가했다. 인스턴스 메소드인 multiply(by:) 메소드를, 가변 메소드인 multiplySelf(by:) 메소드를, 타입 메소드인 isIntTypeInstance(_:) 메소드를 추가했다. 또, 익스텐션을 통해 Position 구조체 타입에 사용할 연산자(타입 메소드)를 추가해줄 수도 있다. Position의 익스텐션처럼 여러 기능을 여러 익스텐션 블록에 나눠서 구현해도 문제가 없다. 관련 기능별로 하나의 익스텐션 블록에 묶어주는 것도 좋다.
 
 
            3.3 이니셜라이저
    인스턴스를 초기화(이니셜라이즈)할 때 인스턴스 초기화에 필요한 다양한 데이터를 전달받을 수 있도록 여러 종류의 이니셜라이저를 만들 수 있다. 타입의 정의 부분에 이니셜라이저를 추가하지 않더라도 익스텐션을 통해 이니셜라이저를 추가할 수 있다.
 
    하지만 익스텐션으로 클래스 타입에 편의 이니셜라이저는 추가할 수 있지만, 지정 이니셜라이저는 추가할 수 없다. 지정 이니셜라이저와 디이니셜라이저는 반드시 클래스 타입의 구현부에 위치해야한다.(값 타입은 상관 없다.)
 */
extension String {
    init(initTypeNumber: Int){
        self = "\(initTypeNumber)"
    }
    init(doubleTypeNumber: Double){
        self = "\(doubleTypeNumber)"
    }
}
let stringFromInt: String = String(initTypeNumber: 100)
let strinfFromDouble: String = String(doubleTypeNumber: 100.0)

class Person1 {
    var name: String
    init(name: String){
        self.name = name
    }
}

extension Person1 {
    convenience init() {
        self.init(name: "unknown")
    }
}

let someOne: Person1 = Person1()
print(someOne.name)


/**
    익스텐션으로 값 타입(열거형, 구조체 등)에 이니셜라이저를 추가했을 때, 해당 값 타입이 다음 조건을 모두 성립한다면 익스텐션으로 사용자 정의 이니셜라이저를 추가한 이후에도 해당 타입의 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 호출할 수 있다.
 
        - 모든 저장 프로퍼티에 기본값이 있다.
        - 타입에 기본 이니셜라이저와 멤버와이즈  이니셜라이즈 외에 추가 사용자 정의 이니셜라이저가 없다.
 
     익스텐션을 통해 추가하는 이니셜라이저는 타입의 기존 이니셜라이저가 갖는 책무를 동일하게
     수행해야 합니다. 즉, 이니셜라이저 호출이 종료되는 시점까지 인스턴스가 정상적으로 완벽하
     게 초기화되는 것을 책임져야 합니다
 */
struct Size {
 var width: Double = 0.0
 var height: Double = 0.0
}
struct Point {
 var x: Double = 0.0
 var y: Double = 0.0
}
struct Rect {
 var origin: Point = Point()
 var size: Size = Size()
}
let defaultRect: Rect = Rect()
let memberwiseRect: Rect = Rect(origin: Point(x: 2.0, y: 2.0),
 size: Size(width: 5.0, height: 5.0))
extension Rect {
 init(center: Point, size: Size) {
 let originX: Double = center.x - (size.width / 2)
 let originY: Double = center.y - (size.height / 2)
 self.init(origin: Point(x: originX, y: originY), size: size)
 }
}
let centerRect: Rect = Rect(center: Point(x: 4.0, y: 4.0),
 size: Size(width: 3.0, height: 3.0))
/**
    위의 Size 구조체와 Point 구조체의 모든 저장 프로퍼티는 기본 값을 가지며, 추가로 사용자 정의 이니셜라이저를 구현하지 않았기에 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 사용할 수 있다. 그렇기 떄문에 익스텐션에서 추가해주는 새로운 이니셜라이저는 멤버와이즈 이니셜라이저에게 초기화를 위임할 수 있다.
 
 
 
 
            3.4 서브스크립트
    익스텐션으로 서브스크립트를 추가할 수 있다.
 */
extension String {
    subscript(appedValue: String) -> String {
        return self + appedValue
    }
    subscript(repeatCount: UInt) -> String {
        var str: String = ""
        for _ in 0..<repeatCount {
            str += self
        }
        return str
    }
}
print("abc"["def"])
print("abc"[3])
/**
            3.5 중첩 데이터 타입
    익스텐션을 통해 타입에 중첩 데이터 타입(Nested Type)을 추가할 수 있다.
 */
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
        }
    }
}
print(1.kind)
print(0.kind)
print((-1).kind)

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
        }
    }
    
    print("")
}

printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])
/**
    익스텐션을 통해 Int 타입에 Kind라는 열거형 타입과 Kind 타입의 연산 프로퍼티를 추가해줬다. kind 프로퍼티는 인스턴스가 양, 음, 0인지 판단하여 Kind를 반환하는 연산프로퍼티이다. printIntegerKinds(numbers:)는 Int 배열을 전달받아 각 부호를 출력하는 함수이다. print에서 terminator를 ""로 한 이유는 줄바꿈을 하지 않기 위해서이다.
 */
