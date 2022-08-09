import Foundation
/**
                프로토콜
    
 스위프트에서 프로토콜 지향 프로그래밍(Protocol Oriented Programming)이 큰 화두로 떠올랐다.
 
        1. 프로토콜이란
 프로토콜(Protocol)은 특정 역할을 하기 위한 메소드, 프로퍼티, 기타 요구사항 등의 청사진을 정의한다. 구조체, 클래스, 열거형은 프로토콜을 채택(Adopted)해서 특정 기능을 실행하기 위한 프로토콜을 요구 사항을 실제로 구현할 수 있다. 어떤 프로토콜을 요구사항을 모두 따르는 타입은 '해당 프로토콜을 준수한다.(conform)'고 표현한다. 타입에서 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 청사진의 기능을 모두 구현해야한다. 즉, 프로토콜은 정의를 하고 제시를 할 뿐이지 스스로 기능을 구현하지는 않는다.
 
        2. 프로토콜 채택
 프로토콜은 구조체, 클래스, 열거형의 모양과 비슷하게 정의할 수 있으며, protocol 키워드를 사용한다.
 
        protocol [protocol Name] {
                [protocol definition]
        }
 구조체, 클래스, 열거형 등에서 프로토콜을 채택하려면 타입 이름 뒤에 콜론(:)을 붙여준 후 채택할 프로토콜 이름을 쉼표(,)로 구분하여 명시한다.
 
         struct SomeSturct: AProtocol, AnotherProtocol {
                        //구조체 정의
         }
 
         class SomeClass: AProtocol, AnotherProtocol {
                         //클래스 정의
         }
         
         enum SomeEnum: AProtocol, AnotherProtocol {
                         //열거형 정의
         }
 
 위의 예시는 AProtocol, AnotherProtocol을 채택한 것이다 만약 클래스가 다른 클래스를 상속받는다면 상속받을 클래스 이름 다음에 채택할 프로토콜을 나열해준다.
 
        class someClass: SuperClass, AProtocol, AnotherProtocol{
                        //클래스 정의
        }
 
 SomeClass는 SuperClass를 상속받았으며 동시에 AProtocol과 AnotherProtocol 프로토콜을 채택한 클래스이다.
 
 
            3. 프로토콜 요구사항
 프로토콜은 타입이 특정 기능을 실행하기 위해 필요한 기능을 요구한다. 프로토콜 자신을 채택한 타입에 요구하는 사항은 프로퍼티나 메소드와 같은 기능이다.
 
            3.1 프로퍼티 요구
 프로토콜은 자신을 채택한 타입이 어떤 프로퍼티를 구현해야 하는지 요구할 수 있다. 그렇지만 프로토콜은 그 프로퍼티의 종류(연산 프로퍼티인지, 저장 프로퍼티인지 등)는 따로 신경쓰지 않는다. 프로토콜을 채택한 타입은 프로토콜이 요구하는 프로퍼티의 이름과 타입만 맞도록 구현해주면 된다. 다만 프로퍼티를 읽기 전용으로 할지 혹은 읽고 쓰기가 모두 가능하게 할지는 프로토콜이 정해야한다.
 
 만약 프로토콜이 읽고 쓰기가 가능한 프로퍼티를 요구한다면 읽기만 가능한 상수 저장 프로퍼티 또는 읽기 전용 연산 프로퍼티를 구현할 수 없다. 만약 프로토콜이 읽기 가능한 프로퍼티를 요구한다면 타입에 프로퍼티를 구현할 때 상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티를 포함해서 어떤 식으로든 프로퍼티를 구현할 수 있다. 쓰기만 가능한 프로퍼티는 없으니 타입에 구현해주는 프로퍼티는 무엇이 되어도 상관없다.
 
 프로토콜의 프로퍼티 요구사항은 항상 var 키워드를 사용한 변수 프로퍼티로 정의한다. 읽기와 쓰기가 모두 가능한 프로퍼티는 프로퍼티의 정의 뒤에 { get set }이라고 명시하며, 읽기 전용 프로퍼티는 프로퍼티 정의 뒤에 { get }이라고 명시해준다.
 */

//프로퍼티 요구
protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBeSettalbeProperty: String { get }
}
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherTypeProperty: Int { get }
}
/**
    위에서 SomeProtocol에 정의된  settableProperty는 읽기, 쓰기 모두를 요구했고, notNeedToBeSettalbeProperty는 읽기만 가능하다면 어떻게 구현되어도 상관없다는 요구사항이다.
 
    타입 프로퍼티를 요구하려면 static 키워드를 사용한다. 클래스 타입 프로퍼티에는 상속 가능한 타입 프로퍼티인 class타입 프로퍼티와 상속 불가능한 static 타입 프로퍼티가 있다만 이 두 타입 프로퍼티를 따로 구분하지 않고 static 키워드를 사용하여 타입 프로퍼티를 요구하면 된다. AnotherPorotocol에 정의된 someProperty와 anotherProperty는 모두 타입 프로퍼티를 요구한다.
 */
//Sendable 프로토콜과 Sendable 프로토콜을 준수하는 Message와 Mail클래스
protocol Sendable {
    var from: String { get }
    var to: String { get }
}

class Message: Sendable {
    var sender: String
    var from: String {
        return self.sender
    }
    var to: String
    
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {
    var from: String
    var to: String
    init(sender: String, receiver: String) {
        self.from = sender
        self.to = receiver
    }
}
/**
    Sendable 프로토콜은 무언가의 전송을 가능하게 하기 위한 프로퍼티인 from과 to를 요구한다. 그래서 Sendable 프로토콜을 채택하여 준수하는 Message, Mail 클래스는 모두 from, to 프로퍼티를 갖는다. 다만 Message 클래스의 from프로퍼티는 읽기전용 연산 프로퍼티라는 점이 Mail 클래스의 from 프로퍼티와 다를 뿐이다. Sendable 프로토콜에서 요구한 프로퍼티는 읽기 가능한 프로퍼티였지만 실제로 프로토콜을 채택한 클래스에서 구현할 떄는 읽고 쓰기가 가능한 프로퍼티로 구현해도 문제가 없다.
 
 
            3.2 메소드 요구
    프로토콜은 특정 인스턴스 메소드나 타입 메소드를 요구할 수도 있다. 프로토콜이 요구할 메소드는 프로토콜 정의에서 작성한다. 다만 메소드의 실제 구현부인 중괄효( {} ) 부분은 제외하고 메소드의 이름, 매개변수, 반환 타입 등만 작성하며 가변 매개변수도 허용한다.
 
    프로토콜의 메소드 요구에서는 매개변수 기본값을 지정할 수 없다. 타입 메소드를 요구할 때는 타입 프로퍼티 요구와 마찬가지로 앞에 static 키워드를 명시한다. static 키워드를 사용하여 요구한 타입 메소드를 클래스에서 실제 구현할 때는 static 키워드나 class 키워드 어느 쪽을 사용해도 무방하다.
 */

//Receiveable, Sendable 프로토콜과 두 프로토콜을 준수하는 Message와 Mail 클래스
//무언가 수신 받을 수 있는 기능
protocol Receiveable2 {
    func received(data: Any, from: Sendable2)
}

//무언가 발신할 수 있는 기능
protocol Sendable2 {
    var from: Sendable2 { get }
    var to: Receiveable2? { get }
    func send(data: Any)
    static func isSendableInstance(_ instance: Any) -> Bool
}

//수신 발신이 가능한 Message 클래스
class Message2: Sendable2, Receiveable2 {
    //발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 한다.
    var from: Sendable2{
        return self
    }
    
    //상대방은 수신 가능한 객체, 즉 Receiveable 프로토콜을 준수하는 타입의 인스턴스여야 한다.
    var to: Receiveable2?
    
    //메시지를 발신한다.
    func send(data: Any) {
        guard let receiver: Receiveable2 = self.to else {
            print("Message has no receiver")
            return
        }
        //수신 가능한 인스턴스의 received 메소드를 호출한다.
        receiver.received(data: data, from: self.from)
    }
    //메시지를 수신한다.
    func received(data: Any, from: Sendable2) {
        print("Message received \(data) from \(from)")
    }
    
    //class 메소드이므로 상속이 가능하다.
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable2 = instance as? Sendable2 {
            return sendableInstance.to != nil
        }
        return false
    }
}


class Mail2: Sendable2, Receiveable2 {
    var from: Sendable2 {
        return self
    }
    var to: Receiveable2?
    
    func send(data: Any) {
        guard let receiver: Receiveable2 = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable2) {
        print("Mail received \(data) from \(from)")
    }
    
//    static 메소드이므로 상속이 불가능하다.
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable2 = instance as? Sendable2 {
            return sendableInstance.to != nil
        }
        return false
    }
}

//두 개의 Message 인스턴스 생성
    let myPhoneMessage: Message2 = Message2()
    let yourPhoneMessage: Message2 = Message2()
    
//아직 수신 받을 인스턴스가 없다.
    myPhoneMessage.send(data: "hello")
    
//Message 인스턴스는 발신과 수신이 모두가능하므로 메시지를 주고 받을 수 있다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "hello")

//두 Mail 인스턴스를 생성한다.
let myMail: Mail2 = Mail2()
let yourMail: Mail2 = Mail2()

myMail.send(data: "HI")

//Mail과 Message 모두 Sendable과 Receiveable 프로토콜을 준수하므로 서로 주고 받을 수 있다.
myMail.to = yourMail
myMail.send(data: "HI")

myMail.to = myPhoneMessage
myMail.send(data: "BYE")
/**
    위 예시의 Receiveable 프로토콜은 수신받을 수 있는 received(data:from) 메소드롤 요구한다. Sendable 프로토콜은 데이터를 발신할 수 있는 Sendable 프로토콜 타입의 인스턴스를 할당할 수 있는 from 프로퍼티와 데이터를 수신할 수 있는 Receiveable 프로토콜 타입의 인스턴스를 할당할 수 있는 from 프로퍼티와 데이터를 수신할 수 있는 Receiveable 프로토콜 타입의 인스턴스를 할당할 수 있는 to 프로퍼티를 요구한다. 또, 데이터를 발신하는 메소드인 send(data:) 인스턴스 메소드를 요구하며, 전달받은 인스턴스가 발신 가능한 상태인지 확인하는 isSendableInstance(_:) 타입 메소드를 요구한다.
 
    Message와 Mail 클래스는 Sendable과 Receiveable 프로토콜을 준수한다. 그래서 두 프로토콜에서 요구하는 프로퍼티와 메소드를 모두 구현해야한다. 두 프로토콜에서 요구한 프로퍼티와 메소드 각각의 이름과 타입은 같지만 실제 클래스에서 구현해줄 때는 조금 다른 동작과 용도로 구현하기도 한다.
 
    Mail과 Message 클래스의 isSendableInstace(_:) 메소드는 각각 class와 static 타입 메소드로 구현했다. 프로토콜에서 static 키워드를 통해 타입 메소드를 요구했지만 클래스에서 실제로 구현할 떄 classs 타입 메소드로 구현할지, static 타입메소드로 구현할지는 프로토콜을 채택하여 사용하는 클래스의 특성에 따라 골라서 사용하면 된다.
 
        {
                        타입으로서 프로토콜
            프로토콜은 요구만 하고 스스로 기능을 구현하지는 않는다. 그렇지만 프로토콜을 코드에서 완전하나의 타입으로 사용되기에 여러 위치에서 프로토콜을 타입으로 사용할 수 있다.
            - 함수, 메소드, 이니셜라이저에서 매개변수 타입이나 반환 타입으로 사용될 수 있다.
            - 프로퍼티, 변수, 상수 등의 타입으로 사용될 수 있다.
            - 배열, 딕셔너리 등 컨테이너 요소의 타입으로 사용될 수 있다.
        }
 
    
 
            3.3 가변 메소드 요구
    가끔은 메소드나 인스턴스 내부의 값을 변경할 필요가 있다. 값 타입(구조체와 열거형)의 인스턴스 메소드에서 자신 내부의 값을 변경하고자 할 때는 메소드의 func 키워드 앞에 mutating 키워드를 적어 메소드에서 인스턴스 내부의 값을 변경한다는 것을 확실히 해준다.
 
    프로토콜이 어떤 타입이든 간에 인스턴스 내부의 값을 변경해야 하는 메소드를 요구하려면 프로토콜의 메소드 정의 앞에 mutating 키워드를 명시해야 한다. 참조 타입인 클래스의 메소드 앞에는 mutating 키워드를 명시하지 않아도 인스턴스 내부의 값을 바꾸는 데 문제가 없지만, 값 타입인 구조체와 열거형의 메소드 앞에는 mutating 키워드를 붙인 가변 메소드 요구(Mutating Method Requiredments)가 필요하다. 프로토콜에 mutating 키워드를 사용한 메소드 요구가 있다고 하더라도 클래스 구현에는 mutating 키워드를 써주지 않아도 된다.
 
 */
protocol Resettable {
    mutating func reset()
}
class Person: Resettable {
    var name: String?
    var age: Int?
    func reset() {
        self.name = nil
        self.age = nil
    }
}
struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}
enum Direction: Resettable {
    case east, west, south, north, unknown
    mutating func reset() {
        self = Direction.unknown
    }
}
/**
    Resettable 프로토콜 rest()이라는 가변 메소드를 요구한다. Resettable 프로토콜을 채택한 Person 클래스에는 mutating 키워드를 제외하고 reset() 메소드를 구현했고, 값 타입인 Point 구조체와 Direction 열거형은 mutating 키워드를 포함하여 구현했다. '만약 Ressettable 프로토콜에서 가변 메소드를 요구하지 않는다면, 값 타입의 인스턴스 내부 값을 변경하는 mutating 메소드는 구현이 불가능'하다.
 
    
 
            3.4 이니셜라이저 요구
    프로토콜은 프로퍼티, 메소드 등과 마찬가지로 특정한 이니셜라이저를 요구할 수도 있다. 프로토콜에서 이니셜라이저를 요구하려면 메소드 요구와 마찬가지로 이니셜라이저를 정의하지만 구현은 하지 않는다. 즉, 이니셜라이저의 매개변수를 지정하기만 할 뿐, 중괄호를 포함한 이니셜라이저 구현은 하지 않는다.
 */
//프로토콜의 이니셜라이저 요구와 구조체의 이니셜라이저 요구 구현
protocol Named {
    var name: String { get }
    init(name: String)
}
struct Pet: Named {
    var name: String
    init(name: String){
        self.name = name
    }
}

/**
    위 Pet구조체는 Named 프로토콜을 채택하여 요구 프로퍼티와 이니셜라이저를 모두 구현했다. 구조체는 상속할 수 없기 때문에 이니셜라이저 요구에 대해 크게 신경쓸 필요가 없지만 클래스의 경우라면 조금 다르다.
 */
// 클래스의 이니셜라이저 요구 구현
class Person1: Named {
    var name: String
    required init(name: String){
        self.name = name
    }
}
/**
    클래스 타입에서 프로토콜의 이니셜라이저 요구에 부합하는 이니셜라이저를 구현할 때는 이니셜라이저가 지정인지 편의인지는 중요하지 않다. 그러나 이니셜라이저 요구에 부합하는 이니셜라이저를 구현할 때는 required 식별자를 붙인 요구 이니셜라이저로 구현해야한다. 위 예시의 Person 클래스를 상속받는 모든 클래스는 Named 프로토콜을 준수해야하며, 이는 곧 상속받는 클래스에 해당 이니셜라이저를 모두 구현해야한다는 뜻이다. 그렇기 때문에 Named에서 요구하는 init(name:) 이니셜라이저를 required 식별자를 붙인 요청 이니셜라이저로 구현해야한다. 만약 클래스 자체가 상속받을 수 없는 final 클래스라면 required를 붙여줄 필요가 없다. 상속할 수 없는 클래스의 요청 이니셜라이저 구현은 불필요하기 때문이다.
 */
final class Person2: Named {
    var name: String
    init(name: String) {
        self.name = name
    }
}
/**
    만약 특정 클래스에 프로토콜이 요구하는 이니셜라이저가 이미 구현되어 있는 상황에서 그 클래스를 상속받는 클래스가 있다면  required, override 식별자를 모두 명시하여 프로토콜에서 요구하는 이니셜라이저를 구현해야한다.
 */
class School {
    var name: String
    init(name: String){
        self.name = name
    }
}
class MiddleSchool: School, Named {
    required override init(name: String) {
        super.init(name: name)
    }
}

/**
    위 코드에서 School은 Named 프로토콜을 채택하지 않았지만 Named 프로토콜이 요구하는 이니셜라이저가 이미 있다. 그런데 MiddleSchool는 School을 상속받고 Named 프로토콜을 채택했다. 그래서 School에서 상속받은 init(name:)을 재정의하며 동시에 Named 프로토콜 이니셜라이저 요구도 충족해야한다. 그래서 override, ruquired 식별자를 모두 표기해야한다. 이때 순서는 상관이 없다.
 
    프로토콜은 일반 이니셜라이저 외에도 실패 가능한 이니셜라이저를 요구할 수도 있다. 실패 가능한 이니셜라이저를 요구하는 프로토콜을 준수하는 타입은 해당 이니셜라이저를 구현할 떄 실패 가능한 이니셜라이저로 구현해도, 일반적인 이니셜라이저로 구현해도 무방하다.
 */
protocol Named2 {
    var name: String { get }
    init?(name: String)
}
struct Animal3: Named2 {
    var name: String
    init!(name: String) {
        self.name = name
    }
}
struct Pet3: Named2 {
    var name: String
    init(name: String){
        self.name = name
    }
}
class Person3: Named2 {
    var name: String
    required init(name: String){
        self.name = name
    }
}
class School3: Named2 {
    var name: String
    required init?(name: String){
        self.name = name
    }
}

/**
            4. 프로토콜의 상속과 클래스 전용 프로토콜
    프로토콜은 하나 이상의 프로토콜을 상속받아 기존 프로토콜의 요구사항보다 더 많은 요구 사항을 추가할 수 있다. 프로토콜 상속 문법은 클래스의 상속과 유사하다.
 */
//프로토콜의 상속
protocol Readable {
    func read()
}
protocol Writeable {
    func write()
}
protocol ReadSpeakable: Readable {
    func speak()
}
protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SomeSomeClass: ReadWriteSpeakable{
    func read(){
        print("read")
    }
    func write(){
        print("write")
    }
    func speak(){
        print("speak")
    }
}
              
/**
    ReadWriteSpeakable은 Readable, Writeable 프로토콜을 상속 받았다. 그래서 ReadWriteSpeakable을 채택한 SomeClass는 세 프로토콜이 요구하는 read(), write(), speak()를 모두 구현해야한다.
 
    프로토콜의 상속 리스트에 class 키워드를 추가해 프로토콜이 클래스 타입에만 채택될 수 있도록 제한할 수도 있다. 클래스 전용 프로토콜로 제한을 주기 위해서는 프로토콜의 상속 리스트의 맨 처음에 class 키워드가 위치해야한다.
 */

protocol ClassOnlyProtocol: class, Readable, Writeable {
    //추가 요구 사항
}

class SomeClass3: ClassOnlyProtocol {
    func read() {
        
    }
    func write() {
        
    }
}

//        ERROR! ClassOnlyProtocol은 클래스 타입만 채택 가능하다.
//        struct SomeStruct: ClassOnlyProtocol{
//
//        }


/**
        5. 프로토콜 조합과 프로토콜 준수 확인
    하나의 매개변수가 여러 프로토콜을 모두 준수하는 타입이어야 한다면 하나의 매개변수에 여러 프로토콜을 한 번에 조합(Composition)하여 요구할 수 있다. 프로토콜을 조합하여 요구할 때는  SomeProtocol & AnotherProtocol과 같이 표현한다. 또, 하나의 매개변수가 프로토콜을 둘 이상 요구할 수도 있다. 이때도 마찬가지로 앰퍼샌드(&)를 여러 프로토콜 이름 사이에 써주면 된다.
    더불어 특정 클래스의 인스턴스 역할을 할 수 있는지 함께 확인할 수 있다. 구조체나 열거형 타입은 조합할수 없다. 그리고 조합 중 클래스 타입은 한 타입만 조합할 수 있다.
 
 */

protocol Named5 {
    var name: String { get }
}
protocol Aged5 {
    var age: Int { get }
}
struct Person5: Named5, Aged5 {
    var name: String
    var age: Int
}
class Car5: Named5 {
    var name: String
    init(name: String){
        self.name = name
    }
}
class Truck5: Car5, Aged5 {
    var age: Int
    init(name: String, age: Int){
        self.age = age
        super.init(name: name)
    }
    
}
func celebrateBirthDay(to celebrator: Named5 & Aged5){
    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
}
let yj5: Person5 = Person5(name: "YJ", age: 99)
celebrateBirthDay(to: yj5)

let myCar5: Car5 = Car5(name: "BOONGBOONG")
//celebrateBirthDay(to: myCar5)
//
//error: 05.protocol.playground:429:23: error: argument type 'Car5' does not conform to expected type 'Aged5'
//celebrateBirthDay(to: myCar5)
//                      ^
//                             as! Aged5
//Aged 충족 안됨

//클래스 & 프로토콜 조합에서 클래스는 한 타칩만 조합할 수 있다.
//var someVariable: Car5 & Truck5 & Aged5
//expression failed to parse:
//error: 05.protocol.playground:438:26: error: protocol-constrained type cannot contain class 'Truck5' because it already contains class 'Car5'
//var someVariable: Car5 & Truck5 & Aged5
//                         ^

//Car 클래스의 인스턴스 역할도 수행할 수 있고, Aged 프로토콜을 준수하는 인스턴스만 할당할 수 있다.
var someVariable: Car5 & Aged5

someVariable = Truck5(name: "truck", age: 5)
//truck의 경우 요구 조건을 충족한다.

//someVariable = myCar5
//myCar의 경우는 Aged를 준수하지 않는다.
/**
    타입 캐스팅에 사용하던 is, as 연산자를 사용해서 대상이 프로토콜을 준수하는지 확인할 수도 있고, 특정 프로토콜로 캐스팅할 수 있다. 프로토콜을 준수하는지 확인하거나 다른 프로토콜로 타입 캐스팅 하는 방법은
    
    - is 연산자를 통해 해당 인스턴스가 특정 프로토콜을 준수하는지 확인하기
    - as? 다운캐스팅 연산자를 통해 다른 프로토콜로 다운 캐스팅 시도하기
    - as!로 강제 다운 캐스팅하기
 
    등이 있다.
 */

print(yj5 is Named5)
print(yj5 is Aged5)
print(myCar5 is Named5)
print(myCar5 is Aged5)

if let castedInstance: Named5 = yj5 as? Named5 {
    print("\(castedInstance) is Named")
}
if let castedInstance: Aged5 = yj5 as? Aged5 {
    print("\(castedInstance) is Aged")
}
if let castedInstance: Named5 = myCar5 as? Named5 {
    print("\(castedInstance) is Named")
}
if let castedInstance: Aged5 = myCar5 as? Aged5 {
    print("\(castedInstance) is Aged")
//    캐스팅 실패
}
/**
  결과적으로 이전의 예제, 위의 예제는 같다는 것을 알 수 있다.
 
 
 
            6. 프로토콜의 선택적 요구
  프로토콜의 요구사항 중 일부를 선택적 요구 사항으로 지정할 수도 있다. 다만 먼저 고려해야 할 사항이 있다. 선택적 요구 사항을 정의하고 싶은 objc 속성이 부여된 프로토콜이어야 한다. objc 속성은 해당 프로토콜을 Objective-C 코드에서 사용할 수 있도록 만드는 역할을 한다. 그렇지만 해당 프로토콜을 Objective-C 코드와 공유하고 싶지 않더라도, 혹은 프로젝트를 Objective-C 코드와 공유하지 않더라도 objc 속성이 부여되어야만 선택적 요구사항을 정의할 수 있다.
 
  여기서 더 생각해보아야 할 것은 objc 속성이 부여되는 프로토콜은 Objective-C 클래스를 상속받은 클래스에서만 채택할 수 있다는 점이다. 즉, 열거형이나 구조체 등에서는 objc 속성이 부여된 프로토콜은 아예 채택할 수 없다.
 
        {
            Foundation 프레임워크
            objc 속성을 사용하면 애플의 Foundation 프레임워크 모듈을 임포트해야 한다.
        }
  선택적 요구를 하면 프로토콜을 준수하는 타입에 해당 요구사항을 필수로 구현할 필요가 없다. 선택적 요구사항은 optional 식별자를 요구사항 정의 앞에 붙여주면 된다. 만약 메소드나 프로퍼티를 선택적 요구사항으로 요구하게 되면 그 요구사항의 타입은 자동적으로 옵셔널이 된다. 예를들어 (Int) -> String 타입의 메소드는 ((Int) -> String)? 타입이 된다. 메소드의 매개변수나 반환 타입이 옵셔널이 된 것이 아니라 메소드(함수) 자체의 타입이 옵셔널이 된다.
 
  선택적 요구사항은 그 프로토콜을 준수하는 타입에 구현되어 있지 않을 수 있기 때문에 옵셔널 체이닝을 통해 호출할 수 있다. 프로퍼티뿐만 아니라 메소드도 마찬가지이다.
 */
//프로토콜의 선택적 요구
import Foundation
@objc protocol Moveable {
    func walk()
    @objc optional func fly()
}
class Tiger: NSObject, Moveable {
    func walk() {
        print("TigerWalk")
    }
}


class Bird: NSObject, Moveable {
    func walk() {
        print("BirdWalk")
    }
    func fly() {
        print("BirdFly")
    }
}

let tiger: Tiger = Tiger();
let bird: Bird = Bird()
tiger.walk()
bird.walk()
bird.fly()

var moveableInstance: Moveable = tiger
moveableInstance.fly?()
moveableInstance = bird
moveableInstance.fly?()
/**
    Moveable 프로토콜은 선택적 요구사항인 fly() 메소드를 포함하므로 objc 속성을 부여했다. objc 속성의 프로토콜을 사용하기 위해서 Tiger, Bird는 Objective-C의 클래스인 NSObject를 상속받았다. 이후 tiger은 walk, bird는 walk, fly를 구현했다. 각 클래스의 인스턴스를 구현하여 사용할 때는 타입에 메소드가 있는지 확인할 수 있지만, Moveable 프로토콜 변수에 할당되었을 때는 인스턴스의 타입에 실제로 fly() 메소드가 구현되어 있는지 모르므로 옵셔널 체인을 이용하여 fly() 메소드를 시도했다.
 
 
 
            7. 프로토콜 변수와 상수
    프로토콜 이름을 타입으로 갖는 변수 또는 상수에는 그 프로토콜을 준수하는 타입의 어떤 인스턴스라도 할당할 수 있다.
 */
var someNamed: Named2 = Animal3(name: "Animal")
someNamed = Pet3(name: "pet")
someNamed = Person3(name: "person")
someNamed = School3(name: "school")
/**
    프로토콜은 프로토콜 이름만으로 자기 스스로 인스턴스를 생성하고 초기화할 수는 없다. 그러나 위와 같이 프로토콜 변수, 상수를 생성하여 특정 프로토콜을 준수하는 타입의 인스턴스를 할당할 수는 있다.
 
 
            8. 위임을 위한 프로토콜
    위임(Delegation)은 클래스나 구조체가 자신의 책임이나 임무를 다른 타입의 인스턴스에게 위임하는 디자인 패턴이다. 책무를 위임하기 위해 정의한 프로토콜을 준수하는 타입은 자신에게 위임될 일정 책무를 할 수 있다는 것을 보장한다. 그렇기 때문에 다른 인스턴스에게 자신이 해야할 일을 믿고 맡길 수 있다. 이임은 사용자의 특정 행동에 반응하기 위해 사용되기도 하며, 비동기 처리에도 많이 사용한다.
 
    위임 패턴(Delegation Pattern)은 애플의 프레임워크에서 사용하는 주요한 패턴 중 하나이다. 언어 자체로의 기능이 아닌 하나의 디자인 패턴이지만 애플의 프레임워크에서 중요하게 사용되는 만큼, 개념을 알아두면 애플리케이션을 만들 떄 도움이 된다. 애플의 프레임워크에 사용하는 위임 패턴을 위해 다양한 프로토콜이 '0000Delegate'라는 식의 이름으로 정의되어 있다. 예를 들어 UITableView 타입의 인스턴스가 해야하는 일을 위임받아 처리는 UITableViewDelegate 프로토콜을 준수하면 된다. 위임받은 인스턴스, 즉 UITableViewDelegate 프로토콜을 준수하는 인스턴스는 UITableView의 인스턴스가 해야하는 일을 대신 처리해줄 수 있다. 
 */
