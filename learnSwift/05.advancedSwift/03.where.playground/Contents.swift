/**
            > Where 절
 스위프트 where은 특정 패턴과 결합하여 조건을 추가하는 역할을 한다. 조건을 더 추가하고 싶을 때, 특정 타입에 제한을 두고 싶을 때 등등 다양한 용도로 사용된다.
 
 
 
            1. where 절의 활용
 where은 크게 두 가지 용도로 사용된다.
 
    - 패턴과 결합하여 조건 추가
    - 타입에 대한 제약 추가
 
 다시 말해서 특정 패턴에 Bool 타입 조건을 지정하거나 어떤 타입의 특정 프로토콜 준수 조건을 추가하는 등의 기능이 있다.
 */
let tuples: [(Int, Int)] = [(1,2), (1,-1), (1,0), (0,2)]
//값 바인딩, 와일드 카드 패턴
for tuple in tuples {
    switch tuple {
        case let (x, y) where x == y: print("x == y")
        case let (x, y) where x == -y: print("x == -y")
        case let (x, y) where x > y: print("x > y")
        case (1, _): print("x == 1")
        case (_, 2): print("y == 2")
        default: print("\(tuple.0), \(tuple.1)")
    }
}

var repeatCount: Int = 0
//값 바인딩 패턴
for tuple in tuples {
    switch tuple {
        case let (x, y) where x == y && repeatCount > 2: print("x == y")
        case let (x, y) where repeatCount < 2: print("\(x), \(y)")
        default: print("nothing")
    }
    repeatCount += 1
}

let firstValue: Int = 50
let secondValue: Int = 30
//값 바인딩 패턴
switch firstValue + secondValue {
    case let total where total > 100: print("total > 100")
    case let total where total < 0: print("wrong value")
    case let total where total == 0: print("zero")
    case let total: print(total)
}
/**
 또한 where 절은 옵셔널 패턴과도 결합할 수 있다.
 */
//옵셔널 패턴과 where 절의 활용
let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}

//타입 캐스팅 패턴과 where 절의 활용
let anyValue: Any = "ABC"
switch anyValue {
    case let value where value is Int: print("value is Int")
    case let value where value is String: print("value is String")
    case let value where value is Double: print("value is Double")
    default: print("unknown type")
}

var things: [Any] = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "HELLO, \(name)"})

for thing in things {
    switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I dont't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let stringConverter as (String) -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
    }
}
// Where 절을 표현 패턴과 결합할 수 있다.


var point: (Int, Int) = (1, 2)
switch point {
    case (0, 0): print("원점")
    case (-2...2, -2...2) where point.0 != 1: print("(\(point.0), \(point.1)은 원점에 가깝다.")
    default: print("point (\(point.0), \(point.1))")
}
/**
 프로토콜 익스텐션에 where절을 사용하면 이 익스텐션이 특정 프로토콜을 준수하는 타입에만 적용될 수 있도록 제약을 줄 수 있다. 다시 말해 익스텐션이 적용된 프로토콜을 준수하는 타입 중 where 절 뒤에 제시되는 프로토콜도 준수하는 타입만 익스텐션이 적용되도록 제약을 줄 수 있다는 뜻이다.
 */
//where절을 활용한 프로토콜 익스텐션의 프로토콜 준수 제약 추가
protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable {}
extension Int: SelfPrintable {}
extension UInt: SelfPrintable {}
extension String: SelfPrintable {}
extension Double: SelfPrintable {}

extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf(){
        print("FixedWidthInteger와  SignedInteger를 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf(){
        print("CustomStringConvertible를 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable {
    func printSelf(){
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

Int(-8).printSelf()
//FixedWidthInteger와  SignedInteger를 준수하면서 SelfPrintable을 준수하는 타입 Int
UInt(8).printSelf()
//CustomStringConvertible를 준수하면서 SelfPrintable을 준수하는 타입 UInt
String("yj").printSelf()
//CustomStringConvertible를 준수하면서 SelfPrintable을 준수하는 타입 String
Double(8.0).printSelf()
//CustomStringConvertible를 준수하면서 SelfPrintable을 준수하는 타입 Double
Person().printSelf()
//그 외 SelfPrintable을 준수하는 타입 Person
/**
    타입 매개변수와 연관 타입의 제약을 추가하는 데 where 절을 사용하기도 한다. 제네릭 함수(메소드)의 반환 타입 뒤에 where 절을 포함하면 타입 매개변수와 연관 타입에 요구 사항을 추가할 수 있다. 요구 사하잉 여러 개일 때는 쉼표로 구분한다. 이렇게 제네릭의 where 절을 사용한 요구 사항은 타입 매개변수가 특정 클래스를 상속 받았는지 또는 특정 프로토콜을 준수하는 지를 표현할 수 있다.
 
    제네릭의 타입 제약 기능은 where 절을 사용하지 않고  간편하게 타입 제약을 추가한 것이다. 그래서 타입 매개변수에 where 절로 똑같이 타입을 제약하는 기능을 구현할 수도 있다.
 */
//where 절을 활용한 타입 매개변수와 연관 타입의 타입 제약 추가
//타입 매개변수 T가 BinaryInteger 프로토콜을 준수하는 타입
func doubled1<T>(integerValue: T) -> T where T: BinaryInteger {
    return integerValue * 2
}
//위 함수와 같은 표현이다.
func doubled2<T: BinaryInteger>(integerValue: T) -> T {
    return integerValue * 2
}

//타입 매개변수 T와 U가 CustomStringConvertible 프로토콜을 준수하는 타입
func prints1<T, U>(first: T, second: U) where T: CustomStringConvertible, U: CustomStringConvertible {
    print(first)
    print(second)
}

//위 함수와 같은 표현이다.
func prints2<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, second: U){
    print(first)
    print(second)
}


// 타입 매개변수 S1, S2가 Sequence 프로토콜을 준수하며 S1, S2가 준수하는 프로토콜인 Sequence 프로토콜의 연관 타입인 Element가 같은 타입
func compareTwoSequence1<S1, S2>(a: S1, b: S2) where S1: Sequence, S1.Element: Equatable, S2: Sequence, S2.Element: Equatable {
    //...
}
//위 함수와 같은 표현
func compareTwoSequence2<S1, S2>(a: S1, b: S2) where S1: Sequence, S2: Sequence, S1.Element: Equatable, S1.Element == S2.Element {
    //...
}
//위 함수와 같은 표현
func compareTwoSequence3<S1: Sequence, S2: Sequence>(a: S1, b: S2) where S1.Element: Equatable, S1.Element == S2.Iterator.Element{
    //...
}

//프로토콜 연관 타입에도 타입 제약을 줄 수 있다.
protocol Container1 {
    associatedtype ItemType where ItemType: BinaryInteger
    
    var count: Int { get }
    
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
//위 표현과 같다.
protocol Container2 where ItemType: BinaryInteger {
    associatedtype ItemType
    
    var count: Int { get }
    
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
/**
    연관 타입이 특정 프로토콜을 준수하는 경우에만 제네릭 타입에 프로토콜을 채택하도록 제네릭 타입의 연관 타입에 제약을 줄 수 있다.
 
 //where 절을 활용한 제네릭 타입의 연관 타입 제약 추가
 */
protocol Talkable { }
protocol CallToAll {
    func callToAll()
}

struct Person1: Talkable { }
struct Animal { }

extension Array: CallToAll where Element: Talkable {
    func callToAll() { }
}

let people: [Person1] = []
let cats: [Animal] = []

people.callToAll()
//cats.callToAll() //컴파일 에러

/**
    위 예시의 Person1 타입은 Talkable을 준수하지만 Animal은 Talkable을 준수하지 않는다. Element 타입이 Talkable프로토콜을 준수하는 경우에만 Array 타입에 CallToAll을 채택했으므로 Animal 타입을 요소로 갖는 Array 타입은 CallToAll을 채택하지 않는다.
 
    이와 같이 where은 다른 패턴과 조합하면 원하는 추가 요구 사항을 자유롭게 더할 수 있으며, 익스텐션과 제네릭에 사용함으로써 프로토콜 또는 타입에 제약을 추가해줄 수도 있다. 조건 구문이나 논리 연산으로 구현한 코드보다는 훨씬 명확하고 간편하게 사용할 수 있다.
 */
