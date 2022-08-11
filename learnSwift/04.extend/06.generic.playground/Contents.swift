/**
            > 제네릭
 제네릭(Generic)은 스위프트의 강력한 기능 중 하나이다. 제네릭을 이용해서 코드를 구현하면 어떤 타입에도 유연하게 대응할 수 있다. 또한, 제네릭으로 구현한 기능과 타입은 재사용하기도 쉽고, 코드의 중복을 줄일 수 있기에 깔끔하고 추상적인 표현이 가능하다.
 
스위프트 표준 라이브러리 또한 수많은 제네릭 코드로 구성되어 있다. 사실 우리는 지금까지 제네릭을 수없이 사용하고 있었다. 예를 들어 Array, Dictionary, Set 등의 타입은 모두 제네릭 컬렉션이다. Int나 String 타입을 요소를 갖은 배열을 만들거나 그 외의 어떤 타입도 배열을 요소로 가질 수 있었던 것은 모두 제네릭 덕분이다. 딕셔너리, 세트도 마찬가지이다.
 
         // 제네릭, 프로토콜, 서브스크립트 등 다양한 기능으로 구현된 Array 타입 선언부
         public struct Array<Element> : RandomAccessCollection, MutableCollection {
             public typealias Index = Int
             public typealias Iterator = IndexingIterator<[Element]>
             //중략
             public var startIndex: Int { get }
             public var endIndex: Int { get }
             //중략
             public subscript(index: Int) -> Element
             public subscript(bounds: Range<Int>) -> ArraySlice<Element>
             //중략
             public mutating func popLast() -> Element?
             //중략
             public func map<T>(_ transform: (Elemnt) throws -> T ) rethrows -> [T]
             //중략
             public var last: Element? { get }
             //중략..
             public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
         }

 제네릭을 사용하고자 할 때는 제네릭이 필요한 타입 또는 메소드의 이름 뒤의 홀화살괄호 기호 (<>) 사이에 제네릭을 위한 타입 매개변수를 써주어 제네릭을 사용할 것임을 표시한다.
 
    _____________________________________________________________
        제네릭을 사용하고자 하는 타입 이름 <타입 매개변수>
        제네릭을 사용하고자 하는 함수 이름 <타입 매개변수> ( 함수의 매개변수 ... )
    -------------------------------------------------------------
 
 위의 예시에는 Array는 타입 매개변수 Element가 있으며, map 메소드는 타입 매개변수 T가 있다. Array는 제네렉을 사용하는 제네릭 타입이고, map 메소드는 제네릭을 사용하는 제네릭 함수이기 때문이다.
 
                 
     //전위 연산자 구현과 사용
 */
prefix operator **

prefix func **(value: Int) -> Int {
    return value * value
}
let minusFive2: Int = -5
let sqrtMinusFive2: Int = **minusFive2

print(sqrtMinusFive2)

 
 /**
 위의 사용자 정의 연산자 **는 조금 한정된 범위에서만 사용할 수 있다. 즉, Int 타입에서만 사용자 정의 연산자를 사용할 수 있다. UInt 타입, 즉 부호가 없는 정수 타입에서는 Int 타입에 구현해준 연산자를 사용하지 못한다. 그래스 조금 더 범용적으로 프로토콜과 제네릭을 조합하여 BinaryInteger 프로토콜에 해당하는 값이면 연산자를 사용할 수 있도록 (제네릭을 이용하여) 구현해줄 수 있다. 그렇게 되면 UInt 타입에서도 해당 연산자를 사용할 수 있다.
 */
 //프로토콜과 제네릭을 이용한 전위 연산자 구현과 사용
prefix operator !!

prefix func !! <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = !!minusFive
let sqrtFive: UInt = !!five

print(sqrtMinusFive)
print(sqrtFive)
/**
다른 예시로 Int 타입의 두 변숫값을 교환하는 swapTwoInts(_:_:) 함수를 바꿔볼 것이다.
 */
//제네릭을 사용하지 않은 swapTwoInts(_:_:) 함수
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA: Int = a
    a = b
    b = temporaryA
}
var numberOne: Int = 5
var numberTwo: Int = 10

swapTwoInts(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

/**
 위 예시에서 Int가 아닌 Double, String의 값을 교환하고 싶다면 어떻게 할 것인가? Any를 사용하면 어떨까?
 */

func swapTwoValues(_ a: inout Any, _ b: inout Any){
    let temporaryA: Any = a
    a = b
    b = temporaryA
}
var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne) \(anyTwo)")

var stringOne: String = "B"
var stringTwo: String = "A"

anyOne = stringOne
anyTwo = stringTwo

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne) \(anyTwo)")
print("\(stringOne) \(stringTwo)")

//swapTwoValues(&stringOne, &stringTwo)
//Any와 다른 타입 전달 인자 전달 불가
/**
 swapTwoValues(_:_:)는 inout 매개변수로 두 Any 타입의 값을 받는다. Any 일 경우 교환에 무리가 없지만 다만 Any에 뭐가 들어있는지 제한이 불가능하다. Int, Int 혹은 String, String을 맞교환하고 싶을 때 이를 제한할 방법이 없다. 또한
 Any로 래핑하지 않는 한 다른 타입을 직접 전달할 수가 없다.
 
 
            1. 제네릭 함수
 위 예시들은 비제네릭인데  제네릭 함수를 통해서 위의 문제들을 해결할 수 있다. 즉, 같은 타입인 두 변수의 값 교환을 한다는 목적을 타입 관계없이 할 수 있다는 것이다.
 
        {
            swap 함수
            스위프트 표준 라이브러리에는 위 함수를 따로 구현할 필요 없이 swap(_:_:)으로 사용할 수 있다. 이 함수의 정의는
            public func swap<T>(_a: inout T, _b: inout T)와 같다.
        }
 */
//제네릭 사용 swapValueGeneric 함수
func swapValueGeneric<T> (_ a: inout T, _ b: inout T){
    let temporary: T = a
    a = b
    b = temporary
}
swapValueGeneric(&numberOne, &numberTwo) //Int
print("\(numberOne), \(numberTwo)")

swapValueGeneric(&stringOne, &stringTwo) //String
print("\(stringOne), \(stringTwo)") // "B, A"

swapValueGeneric(&anyOne, &anyTwo) //Any
print("\(anyOne), \(anyTwo)") // "Two", 1

//swapTwoValues(&numberOne, &stringOne) // 오류!! - 같은 타입끼리만 교환 가능

/**
 위 예시는 이전의 함수들과 특별히 다를 것이 없지만 <T>, 매개변수 뒤에 T가 추가 된 것을 볼 수 있다.
 제네릭 함수는 실제 타입 이름(Int, Double)을 써주는 대신 플래이스 홀더(Placeholder)를 사용한다. 플래이스 홀더(T)는 타입의 종류를 알려주지는 않지만 말 그대로 어떤 타입이라는 것은 알려준다. 즉, 매개변수로 플레이스홀터 타입이 T인 두 매개변수가 있으므로 두 매개변수의 타입이 같다는 것은 알 수 있다. T의 실제 타입은 함수 호출시 결정된다. 제네릭의 함수의 플레이스 홀더를 지정하는 방법은 함수 이름 홀화살괄호 기호(<>) 안 쪽에 플레이스 홀더 이름을 나열하는 것이다.
 
 플래이스홀더 타입 T는 타입 매개변수(type parameter)의 한 예로 들 수 있다. 타입 매개변수는 플에이스 홀더 타입의 이름을 지정하고 명시하는 역할을 하며, 함수의 이름 뒤 홀화살괄호 기호 안쪽에 위치한다.
 
 타입 매개변수를 지정하면 이를 함수의 매개변수 타입으로 사용할 수 있다. 또는 함수의 반환 타입으로도 사용할 수 있으며, 함수 내부 변수의 타입 지정을 위해서 사용할 수도 있다. 각각의 경우 타입 매개변수는 함수를 호출할 때마다 실제 타입으로 치환된다. 즉, Int 타입 두 개를 통해서 swapValueGeneric(_:_:)를 호출한다면 T는 Int로 치환되는 식으로 말이다. 이는 호출할 때마다 T가 다른 타입으로 작동한다는 뜻이다. 만약 여러 개의 타입 매개변수를 갖고 싶다면 '<>' 안에 여러 개의 타입 매개변수를 지정해줄 수 있다.
 <T, U, V>와 같이 말이다.
 
 타입 매개변수는 대부분 의미있는 이름을 갖게 되는 경우가 많다. 예를 들어 딕셔너리의 Key, Value와 같은 이름들이 예시이다. 의미 있는 이름으로 타입 매개변수 이름을 지정하면 제네릭 타입, 제네릭 함수의 타입 매개변수와의 관계를 조금 더 명확히 해줄 수 있다.
 
 
 
        2. 제네릭 타입
 제네릭 함수에 이어 제네릭 타입을 구현할 수도 있다. 제네릭 타입을 구현하면 사용자 정의 타입인 구조체, 클래스, 열거형 등이 어떤 타입과도 연관되어 동작할 수 있다. Array와 Dictionary 타입이 자신의 요소로 모든 타입을 대상으로 동작할 수 있는 것과 유사하다.
 
 Stack이라는 제네릭 컬렉션 타입을 만들어가면서 더 자세히 알아보자. 스택은 배열과 유사하게 순서가 있는 값들의 모음이다. 배열은 중간중간 요소를 삽입하거나 삭제할 수 있지만, 스택은 컬렉션의 끝 부분에서만 요소를 추가하고 삭제할 수 있다.
 */
struct IntStack {
    var items: [Int] = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var integerStack: IntStack = IntStack()

integerStack.push(3)
print(integerStack.items)

integerStack.push(2)
print(integerStack.items)

integerStack.push(3)
print(integerStack.items)

integerStack.push(5)
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

/**
    위 스택을 모든 타입을 대상으로 동작하도록 구현해보자 물론 itmes 배열을 Any로 선언하면 그만이지만 한 타입으로 계속 받고 싶다면 Any는 부적절하다. 그래서 여기서 스택을 사용해보자
 */

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack)

doubleStack.push(1.0)
print(doubleStack)

doubleStack.push(1.0)
print(doubleStack)

doubleStack.pop()
print(doubleStack)

var stringStack: Stack<String> = Stack<String>()

stringStack.push("A")
print(stringStack)

stringStack.push("B")
print(stringStack)

stringStack.push("S")
print(stringStack)

stringStack.pop()
print(stringStack)

var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(1.0)
print(anyStack)

anyStack.push("B")
print(anyStack)

anyStack.push(1)
print(anyStack)

anyStack.pop()
print(anyStack)
/**
    위와 같이 Any로 사용해도 되지만 타입을 지정하려면 <Element>에 <Int>와 같이 타입을 지정하면 그 타입에만 동작하도록 제한할 수 있어 더욱 안전하고 의도한 대로 기능을 사용할 수 있다.
 
 
 
            3. 제네릭 타입 확장
 
 만약 익스텐션을 통해서 제네릭을 사용하는 타입에 기능을 추가하고자 한다면 익스텐션 정의에 타입 매개변수를 명시하지 않아야한다. 대신 원래 제네릭 정의에 명시한 타입 매개변수를 익스텐션에서 사용할 수 있다.
 */
extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

print(doubleStack.topElement)
print(stringStack.topElement)
print(anyStack.topElement)
/**
 위 익스테션은 Stack 구조체를 확장한 것이다. Stack은 제네릭 타입이지만 익스텐션의 정의에는 따로 타입 매개변수를 명시하지 않는다. 대신 기존 제네릭 타입에 정의되어 있는 Element라는 타입을 사용할 수 있다.
 */
