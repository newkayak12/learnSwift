import Foundation
/**
                프로토콜 지향 프로그래밍
 Objective-C 등 객체지향 프로그래밍 패러다임에 기반을 둔 언어는 대부분 클래스의 상속을 사요앻서 타입에 공통된 기능을 구현한다. 그런데 스위프트의 표준 라이브러리에서 타입과 관련된 것을 보면 대부분 구조체로 표현되어 있다. 클래스로 구현된 타입은 그리 많지 않다. 상속도 되지 않는 구조체로 어떻게 다양한 공통 기능을 가질 수 있을까? 해답은 프로토콜, 익스텐션, 제네릭이다.
 
 
                1. 프로토콜 초기 구현
 익스텐션은 기존 타입의 기능을 확장하며, 프로토콜은 포로토콜을 채택한 타입이 원하는 기능을 강제로 구현한다는 점을 알고 있다. 그런데 특정 프로토콜을 정의하고 여러 타입에서 이 프로토콜을 준수하게 만들어 타입마다 똑같은 메소드, 프로퍼티, 서브스크립트 등을 구현해야한다면? 코드 중복을 피할 수 없을 뿐아니라, 유지보수 역시 어려워질 것이다. 이때 필요한 것이 익스텐션과 프로토콜의 결합이다. 이전의 예시를 돌아보면 Receiveable과 Sendable 프로토콜을 준수하기 위해서 Message, Mail 두 타입에 모두 같은 기능을하는 코드를 구현해야 했다. 이러한 중복 제거를 위해서 extension을 사용할 수 있다.
 */
protocol Receiveable {
    func received(data: Any, from: Sendable)
}
extension Receiveable {
    //메시지 수신
    func received(data: Any, from: Sendable){
        print("\(self) received \(data) from \(from)")
    }
}

//무언가를 발신할 수 있는 기능
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    func send(data: Any)
    static func isSendableInstance(_ instance: Any) -> Bool
}
extension Sendable {
    //발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 한다.
    var from: Sendable {
        return self
    }
    //메시지 발신
    func send(data: Any){
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    //수신 가능한 인스턴스의 received 메소드 호출
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}


//수, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable {
    var to: Receiveable?
}
//수, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

//두 Message 인스턴스 생성
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

//아직 수신 받을 인스턴스 없음
myPhoneMessage.send(data: "Hello")


//Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "HELLO!")

//Mail 인스턴스 두 개 생성
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

//Message, Mail 모두 Sendable, Receiveable 프로토콜을 준수하므로 서로 주고 받을 수 있다.
myMail.to = yourMail
myMail.send(data: "hi")

myMail.to = myPhoneMessage
myMail.send(data: "Buy")


//String은 Sendable 프로토콜 준수 X
Message.isSendableInstance("HELLO")

//Message와 Mail은 Sendable 준수
Message.isSendableInstance(myPhoneMessage)


//yourPhoneMessage는 to가 설정되지 않아 보낼 수 없다.
Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)
/**
    위 예시의 Message, Mail 클래스는 Receiveable과 Sendable 프로토콜을 채택하고 있지만, 실제로 구현한 것은 저장 인스턴스 프로퍼티인 to 뿐이다. 그 외의 기능은 이미 각 프로토콜의 익스텐션에 구현되어 있다.
    
    프로토콜을 정의할 때는 그 프로토콜을 채택한 타입에서 구현해줘야 하는 프로토콜의 요구 사항을 구현할 수 없다. 단지 요구사항을 정의할 할 수 있을 뿐이다. 그러나 프로토콜의 익스텐션에는 프로토콜이 요구하는 기능을 실제로 구현할 수 있다. 다만 익스텐션에는 저장 프로퍼티를 구현할 수 없으므로 저장 프로퍼티는 각각의 타입에서 직접 구현해야한다. 이렇게 프로토콜과 익스텐션을 결합하는 코드 재사용성이 증가한다.
 
    이처럼 프로토콜의 요구사항윽 익스텐션을 통해 구현하는 것을 프로토콜 초기구현(Protocol Default Implementaion)이라고 한다. 그런데 만약 프로토콜의 익스텐션에서 구현한 기능을 사용하지 안혹 타입의 특성에 따라 조금 변경해서 구현하고 싶다면 재정의하면 된다.
 */
class Mail2: Sendable, Receiveable {
    var to: Receiveable?
    func send(data: Any) {
        print("overrided")
    }
}
let mailInstance: Mail2 = Mail2()
mailInstance.send(data: "HELLO")

/**
 사실 위의 send(data:)는 재정의라고 할 수 없다. 이미 프로토콜을 준수하는 타입의 메소드를 호출했기 때문이다. 특정 프로토콜을 준수하는 타입에 프로토콜의 요구사항을 찾아보고 이미 구현되어 있다면 그 기능을 호출하고, 그렇지 않다면 프로토콜의 초기 구현을 호출한다.
 
 여기에 제네릭까지 더한다면 코드의 재사용성을 더욱 올라간다. 이전 Container 프로토콜 관련 코드를 제네릭, 프로토콜, 익스텐션을 통해서 변경해보자
 */

protocol SelfPrintable {
    func printSelf()
}
extension SelfPrintable where Self: Container {
    func printSelf(){
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}
extension Container {
    mutating func append(item: ItemType){
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}
extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}
extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
}
struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()

var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()


myIntStack.push(3)
myIntStack.printSelf()
myIntStack.push(2)
myIntStack.printSelf()
myIntStack.pop()
myIntStack.printSelf()

myStringStack.push("A")
myStringStack.printSelf()
myStringStack.push("B")
myStringStack.printSelf()
myStringStack.pop()
myStringStack.printSelf()

myIntQueue.insert(3)
myIntQueue.printSelf()
myIntQueue.insert(2)
myIntQueue.printSelf()
myIntQueue.delete()
myIntQueue.printSelf()

myStringQueue.insert("A")
myStringQueue.printSelf()
myStringQueue.insert("B")
myStringQueue.printSelf()
myStringQueue.delete()
myStringQueue.printSelf()
/**
 SelfPrintable 프로토콜을 비롯해서 Container, Popable, Insertable 프로토콜, 익스텐션 각각, Stack과 Queue 구조체의 구현으로 이뤄져 있다. Container 프로토콜은 연관 타입을 활용하여 제네릭에 더욱 유연하게 대응할 수 있도록 정의했다.
 
 예시의 Stack, Queue 구조체는 익스텐션을 통한 초기 구현으로 프로토콜을 채택했을 뿐인데, 구조체 내부에서는 프로토콜 준수를 위한 추가 구현이 필요 없다. 또, Popable과  Insertable 프로토콜은 Container를 추가로 상속방아 추가로 특정 목적을 갖는 컨테이너 타입에 필요한 기능을 요구한다. 그러나 이 프로토콜들도 초기 구현을 통해 미리 공통 기능을 구현했기에 실제 프로토콜을 따르는 타입은 추가 구현이 필요 없다.
 
 Stack 구조체와와 Queue 구조체는 서로 동작하는 방식은 다르지만, 특정 아이템을 가질 수 있는 컨테이너라는 특성은 공유한다. 따라서 그저 Container 프로토콜을 채택하기만 하면 된다. 그러나 세부 요구사하잉 조금 다르기 때문에 최종적으로는 Container 프로토콜을 상속 받는 다른 프로토콜을 채택한다.
 
 더불어 각각의 요소 타입은 제네릭을 통해 사용할 때 결정하므로 타입에 대해 매우 유연하게 동작할 수 있다. 이는 클래스의 상속보다도 훨씬 강력하게 기능의 단위를 공유할 수 있는 방법으로 사용한다. 스위프트의 클래스는 다중상속을 지원하지 않으므로 부모 클래스의 기능으로 부족하다면 자식클래스에서 다시 구현해야하지만, 프로토콜 초기 구현을 한 프로토콜을 채택했다면 상속도 추가 구현도 필요 없다. 게다가 상속을 지원하지 않는 값 타입인 구조체와 열거형도 상속이 불가하지만 초기 구현을 한 프로토콜만 채택하면 기능이야 얼마든지 추가할 수 있다.
 
 이처럼 프로토콜 초기구현을 통해 기능을 구현한다면 프로토콜 채택만으로 타입에 기능을 추가해서 사용할 수 있다. 이것이 프로토콜 지향 프로그램의 핵심 콘셉트 중 하나이다.
 
 
 
            2. 맵, 필터, 리듀스 직접 구현하기
 위의 Stack 컨테이너 타입에 맵, 필터, 리듀스를 구현해보자. 일단 이들 사용법에 대해서 다시 상기시켜보자
 */
//Array - Map
let items: Array<Int> = [1,2,3]
let mappedItems: Array<Int> = items.map { (item: Int) -> Int in item * 10}
print(mappedItems)
/**
 Int 타입이 요소로 저장된 Array로 맵을 호출하면 Array<Int> 타입의 결과물을 반환한다. 즉, 자신이 갖는 요소 타입인 Element를 특정 타입으로 변환하는 함수를 전달받아 바꾸고 그 결과를 반환한다고 생각하면 쉽다.
 */
extension Stack {
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        
        return transformedStack
    }
}

myIntStack.append(item: 1)
myIntStack.append(item: 5)
myIntStack.append(item: 2)
myIntStack.printSelf()
var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()
/**
    맵 메소드는 Stack의 요소를 변환하는 방법인 transform 함수를 전달받는다. 그리고 transform 함수는 Stack 요소의 타입인 Element의 값을 T타입으로 변환하고 자신이 속해있는 타입과 같은 컨테이너인 Stack의 모습으로 결과를 반환한다.
 
    필터 예시를 보고 필터도 비슷하게 구현해보자
 */
let filteredItems: Array<Int> = items.filter{ (items: Int) -> Bool in return items % 2 == 0}
print(filteredItems)

extension Stack {
    func filter(includeElement: (Element) -> Bool ) -> Stack<Element> {
        var filteredStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filteredStack.items.append(item)
            }
        }
        
        return filteredStack
    }
}

let filteredStack: Stack<Int> = myIntStack.filter{(item: Int) -> Bool in return item < 5}
filteredStack.printSelf()


/**
 이번에는 리듀스 예시와 리듀스 구현을 살펴보자. Array 타입의 리듀스는 함수를 통해 변환하고 합한 타입을 반환한다. 리듀스는 전달인자로 전달받은 초기값과 처리 함수를 통해 초기값과 동일한 타입의 결과를 반환한다.
 */
let combinedItems: Int = items.reduce(0) { ( result: Int, next: Int ) -> Int in return result + next}
print(combinedItems)

let combinedItemsDoubled: Double = items.reduce(0.0) { (result: Double, next: Int) -> Double in return result + Double(next) }
print(combinedItemsDoubled)

let combinedItemsString: String = items.reduce("") { (result:String, next: Int) -> String in return result + "\(next)"}
print(combinedItemsString)


extension Stack {
    func reduce<T> (_ initialResult: T, nextPartialResult: (T, Element) -> T) ->T {
        var result: T  = initialResult
        
        for item in items {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}

let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in return result + next}
print(combinedInt)

let combinedDouble: Double = myIntStack.reduce(100.0) { (result: Double, next: Int) -> Double in return result + Double(next)}
print(combinedDouble)

let combinedString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in return result + "\(next)"}
print(combinedString)

/**
    이처럼 제네릭은 타입에 한정되지 않도록 다양한 기능을 구현한다.
 
 
 
 
                3. 기본 타입 확장
    프로토콜 초기 구현을 통해서 스위프트의 기본 타입을 확장하여 내가 원하는 기능을 공통적으로 추가해볼 수도 있다. 스위프트 표준 라이브러리에 정의되어 있는 타입은 실제 구현 코드를 보고 수정할 수는 없기에 익스텐션, 프로토콜, 프로토콜의 초기 구현을 사용해서 기본 타입에 기능을 추가할 수 있다.
 */

protocol SelfPrintable2 {
    func printSelf()
}
extension SelfPrintable2 {
    func printSelf(){
        print(self)
    }
}


extension Int: SelfPrintable2 {}
extension String: SelfPrintable2 {}
extension Double: SelfPrintable2 {}

(1024).printSelf()
(3.14).printSelf()
("hana").printSelf()

/**
    위 예시는 코드를 수정할 수 없는 스위프트의 기본 타입인 Int, String, Double에 SelfPrintable2 프로토콜과 그 프로토콜의 초기 구현으로 공통 기능을 추가해본 것이다.
 */
