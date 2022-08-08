/**
            > 타입 캐스팅
 
    스위프트는 데이터 타입 안전을 위해서 각기 다른 타입끼리 값 교환을 엄격하게 제한한다. 또, 다른 프로그래핑 언어에서 대부분 지원하는 암시적 데이터 타입 변환(Implicit Type Conversion)은 지원하지 않는다. C 언어의 경우 데이터 타입 변환을 통해 손쉽게 다른 데이터 타입으로 변환해줄 수 있었다. 에를 들어 int num = (int)2.3f;와 같이 표현하거나 int num = 2.3f;처럼 표현하여 데이터 타입을 변환할 수 있다.
 
    스위프트에서 Int(2,3) 처럼 부동 소수 타입을 정수 타입으로 변환해주는 형태와 C 언어의 데이터 타입 변환의 형태는 크게 다를 것 없어 보이지만 사실은 다르다.
 
        // C
        double value = 3.3;
        int convertedValue = (int) value;
        printf("%d", convertedValue) // 3
        convertedValue = 5.5 // double->int 암시적 데이터 타입 변환
 
        //Swift
        var value: Double = 3.3;
        var convertedValue: Int = Int(value)
        print(convertedValue) // 3
        convertedValue = 5.5 //error!
 
    c 언어 코드를 살펴보면 부동 소수 타입인 double에서 정수 타입인 int 로 데이터 타입을 변경했다. C에서는 이를 타입 변환이라고 한다. 그러나 스위프트 코드를 보면 Int(value)라는 형태로 데이터 타입의 형태를 변경해주는데, 이는 앞서 배운 이니셜라이저이다. 즉, 기존 값을 전달인자로 받는 이니셜라이저를 통해 새로운 Int 구조체의 인스턴스를 생성한다. 스위프트에서는 이를 타입 변환 혹은 타입캐스팅이라고 칭하지 않는다. 다만 이니셜라이저를 통해 새로운 인스턴스를 생성하는 것이다. 그래서 Int 구조체의 정의를 들여다보면 다양한 이니셜라이저가 정의되어 있음을 확인할 수 있다.
 
// Int 구조체의 다양한 이니셜라이저 정의
 public struct Int: FixedWidthInteger, SignedInteger {
    /* 중략 */
 
    public init(bitPattern x: UInt)
    public init(_ source: Float)
    public init?(exactly source: Float)
    public init(exactly source: Double)
            (중략 ...)
 
    public convenience init?<S>(_ test: S, radix: Int = default)
        where S : StringProtocol
    public convenience init(integerLiteral value: Int)
    public convenience init()
            (중략 ...)
 }
 
 Int의 이니셜라이저는 대부분 실패하지 않는 이니셜라이저로 정의되어 있다. 그러나 좀 더 살펴보면 시랲 가능한 이니셜라이저도 포함되어 있다. StringProtocol 타입을 매개변수로 받는 public convenince init?<S> (_ text: S, radix: Int = default) where S: StringProtocol가 실패 가능한 이니셜라이저이다. StringProtocol 타입의 데이터 text를 Int 타입으로 변경할 때, 적절하지 못한 매개변수가 전달된다면 새로운 인스턴스가 생성되지 않을 수 있다는 뜻이다.
 
 */

//실패 가능한 Int 이니셜라이저
var stringValue: String = "123"
var integerValue: Int? = Int(stringValue)

print(integerValue) //Optional(123)

stringValue = "A123"
integerValue = Int(stringValue)

print(integerValue) //nil === Optional.none

/**
        2. 스위프트 타입캐스팅
 스위프트에서는 다른 언어의 타입 변환 혹은 타입 캐스팅을 이니셜라이저로 단순화했다. 그렇다면 스위프트에선 타입 캐스팅이 없을가? 아니다. 스위프트에도 타입캐스팅은 있으며 대신 조금 다른 의미로 사용한다. 스위프트의 타입캐스팅은 인스턴스의 타입을 확인하거나 자신을 다른 타입의 인스턴스인양 행세할 수 있는 방법으로 사용할 수 있다. 스위프트의 타입캐스팅은 is와 as 연산자로 구현했다. 이 두 연산자로 값의 타입을 확인하거나 다른 타입으로 전환할 수 있다. 또한 타입 캐스팅을 통해 프로토콜을 준수하는지도 확인할 수 있다. 스위프트의 타입캐스팅은 실제로 참조 타입에 주로 사용된다.
 */
class Coffee {
    let name: String
    let shot: Int
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot;
        self.name = "coffee"
    }
}
class Lattee: Coffee {
    var flavor: String
    override var description: String {
        return "\(shot) shot(s) \(flavor) lattee"
    }
    init(flavor: String, shot: Int) {
        self.flavor = flavor;
        super.init(shot: shot)
    }
}
class Americano: Coffee {
    let iced: Bool
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot" ) americano"
    }
    init(shot: Int, iced: Bool) {
        self.iced = iced;
        super.init(shot: shot)
    }
}
/**
    위 그림을 보면 Latte와 Americano 클래스는 Coffee 클래스를 상속받은 것을 확인할 수 있다. Coffee 클래스가 갖는 특성들을 Latte나 Americano가 모두 포함한다는 사실을 알 수 있다. 다시 말하면 Coffee나 Lattee나 Americano 인 척할 수는 없지만 Latee, Americano는 Coffee인 척할 수 있다는 뜻이다. 왜냐하면 Latte, Americano는 Coffee가 갖는 특성을 모두 갖기 떄문이다.
 
 
        3. 데이터 타입 확인
    타입 확인 연산자인 is를 사용하여 인스턴스가 어떤 클래스 (혹은 어떤 클래스의 자식 클랙스)의 인스턴스인지 타입을 확인해 볼 수 있다. 타입 확인 연산자는 인스턴스가 해당 클래스의 인스턴스이거나 그 자식 클래스의 인스턴스라면 true, 그렇지 않으면 false를 반환한다. is 연산자는 클래스의 인스턴스뿐만 아니라 모든 데이터 타입에 사용할 수 있다.
 */
let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Lattee = Lattee(flavor: "GreenTea", shot: 3)
print(yourCoffee.description)

print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Lattee)

print(myCoffee is Coffee)
print(yourCoffee is Coffee)

print(myCoffee is Lattee)
print(yourCoffee is Lattee)
/**
 coffee는 Coffee 타입이며 Latte, Americano가 될 수 없다. 그러나 myCoffee는 Americano 타입이고 yourCoffee는 Lattee 타입이며 Coffee 타입에서 ture를 반환한다. 하지만 myCoffee, youCoffee는 서로 특성이 다르며 부모 자식 관계가 아니기 때문에 다른 타입이다.
 
 is 연산자 외에도 타입을 확인해볼 수 있는 방법이 있다. 메타 타입(MetaType) 타입을 이용하는 것이다. 메타 타입 타입은 타입의 타입을 의미한다. 클래스 타입, 구조체 타입, 열거형 타입, 프로토콜 타입 등의 타입의 타입이다. 즉, 타입 자체가 하나의 타입으로 또 표현할 수 있다는 것이다.
 
 클래스, 구조체, 열거형의 이름은 타입의 이름이다. 그 타입 이름 뒤에 .Type을 붙이면 이는 메타 타입을 나타낸다. 프로토콜 타입의 메타타입은 .Protocol이라고 붙여주면 된다. 예를 들어서 SomeClass라는 클래스의 메타 타입은 SomeClass.Type이라고 표현하며, SomeProtocol의 메타 타입은 SomeProtocol.Protocol이라고 표현한다.
 
 또, self를 사용해신 타입을 값처럼 표현할 수 있다. 예를 들어 SomeClass.self라고 표현하면 SomeClass의 인스턴스가 아니라 SomeClass 타입의 값으로 표현한 값을 반환한다. 그리고 SomeProtocol.self라고 표현하면 SomeProtocol을 준수하는 타입의 인스턴스가 아니라 SomeProtocol 프로토콜을 값으로 표현한 값을 반환한다.
 
 
 */
protocol SomeProtocol {}
class SomeClass: SomeProtocol { }

let intType:Int.Type = Int.self
let classType:SomeClass.Type = SomeClass.self
let protocolProtocol:SomeProtocol.Protocol = SomeProtocol.self
let stringType: String.Type = String.self

var someType: Any.Type
someType = intType
print(someType) //Int
someType = stringType
print(someType)//String
someType = classType
print(someType)//SomeClass
someType = protocolProtocol
print(someType)//SomeProtocol

/**
    위에서 정의된 SomeProtocol, SomeClass 등의 메타 타입이 하나의 값으로 취급되어 SomeType 변수에 할당될 수 있음을 확인할 수 있다. 또 Int, String도 스위프트에서 구조체로 구현한 타입이므로 메타 타입을 값으로 취급해 할당될 수 있음을 확인할 수 있다.
 
    만약 프로그램 실행 중에 인스턴스 타입을 표현한 값을 알아보고자 한다면 type(of:) 함수를 사용한다. 그래서 type(of: someInstance).self라도 표현하면 someInstance의 타입을 값으로 표현한 값을 반환한다.
 
    {
            인스턴스 self와 타입 self의 의미
        .self 표현은 값 뒤에 써주면 그 값 자신을, 타입 이름 뒤에 써주면 타입을 표현하는 값을 반환한다. "stringValue".self는 "stringValue" 그 자체를, String.self는 String타입을 나타내는 값이다.
    }
 */
//type(of:) 함수와 .self의 사용
print(type(of: coffee) == Coffee.self)
print(type(of: coffee) == Americano.self)
print(type(of: coffee) == Lattee.self)

print(type(of: coffee) == Americano.self)
print(type(of: myCoffee) == Americano.self)
print(type(of: yourCoffee) == Americano.self)

print(type(of: coffee) == Lattee.self)
print(type(of: myCoffee) == Lattee.self)
print(type(of: yourCoffee) == Lattee.self)

/**
        4. 다운 캐스팅
    어떤 클래스 타입의 변수 또는 상수가 정말로 해당 클래스의 인스턴스를 참조하지 않을 수도 있다. 예를 들어 Latte 클래스의 인스턴스가 Coffee 클래스의 인스턴스인양 Coffee행세를 할 수도 있다.
 
 */
//Lattee 타입의 인스턴스를 참조하는 Coffee 타입의 actingConstant 상수
let actingConstant: Coffee = Lattee(flavor: "vanilla", shot: 2)
print(actingConstant.description)
/**
    actingConstant 상수는 Coffee 인스턴스를 참조하도록 선언했지만, 실제로는 Coffee 타입인척 하는 Lattee타입의 인스턴스를 참조하고 있다. 이런 상황에서 actingConstant가 참조하는 인스턴스를 진짜 타입인 Lattee 타입으로 사용해야할 때가 있다. 가령 Lattee 타입에 정의되어 있는 메소드를 사용하거나 프로퍼티에 접근해야할 때 Lattee 타입으로 변수의 타입을 변환해주어야 한다. 이를 스위프트에서는 다운 캐스팅(DownCasting)이라고 한다.
 
    클래스 상속 모식도에서 자식클래스보다 더 상위에 있는 부모 클래스의 타입을 자식 클래스의 타입으로 캐스팅한다고 해서 다운 캐스팅이라고 부르는 것이다. 물론 다운 캐스팅이 클래스의 인스턴스에서만 사용하는 것은 아니다. Any 타입 등에서 다른 타입으로 캐스팅할 때도 다운 캐스팅을 사용한다.
 
    타입캐스트 연산자(Type Cast Operator)에는 as?와 as! 두 가지가 있다. 타입 캐스트 연산자를 사용하여 자식클래스 타입으로 다운 캐스팅할 수도 있다.
 
    ?와 !를 보면 알 수 있겠지만 다운캐스팅은 실패의 여지가 충분히 있기 떄문에 ?가 붙은 연산자와 !가 붙은 연산자 두 종류가 있다. 다운 캐스팅을 시도해보는 조건부 연산자인 as?는 다운 캐스팅 실패시 nil을 반환하고 다운 캐스팅을 강제하는 as!는 연산자는 다운 캐스팅에 실패할 경우 런타임 오류가 발생한다. 따라서 as? 연산자는 반환 타입이 옵셔널이며, as!은 연산자의 반환 타입이 옵셔널이 아니다.
 
    다운캐스팅에 실패할 가능성이 있다면 조건부 연산자인 as?를 사용해야한다. 조건부 연산자 as?를 사용하면 다운 캐스팅에 성공ㅎ할 경우 옵셔널 타입으로 인스턴스를 반환하며, 실패할 경우 nil을 반환한다. 다운캐스팅이 무조건 성공할 것이라고 확신한다면, 즉 해당 변수 또는 상수가 참조하는 인스턴스가 다운캐스팅하고자 하는 확실하다면 강제 연산자인 as!를 사용할 수 있다. as! 연산자를 사용하여 다운 캐스팅이 성공할 경우 옵셔널이 아닌 인스턴스가 반환되며, 실패할 경우 런타임 오류가 발생한다.
 */
//다운 캐스팅
if let actingOne: Americano = coffee as? Americano {
    print("this is Americano")
} else {
    print(coffee.description)
}

if let actingOne: Lattee = coffee as? Lattee {
    print("this is latte")
} else {
    print(coffee.description)
}

if let actingOne: Coffee = coffee as? Coffee {
    print("this is just coffee")
} else {
    print(coffee.description)
}

if let actingOne: Americano = myCoffee as? Americano {
    print("this is americano")
} else {
    print(coffee.description)
}

if let actingOne: Lattee = myCoffee as? Lattee {
    print("this is latte")
} else {
    print(coffee.description)
}

if let actingOne: Coffee = myCoffee as? Coffee {
    print("this is just coffe")
} else {
    print(coffee.description)
}

//success
let castedCoffee: Coffee = yourCoffee as! Coffee

//런타임 오류
//let castedAmericano: Americano = coffee as! Americano

/**
    위의 코드에서 if let actingOne: Americano = coffee as? Americano를 보면 "만약 Coffee가 참조하는 인스턴스가 Americano 타입의 인스턴스라면 actingOne이라는 임시 상수에 할당하라"로 해석할 수 있다. 또, lastCastedAmericano: Americano = cofee as! Americano만 놓고 보면 "coffee가 참조하는 인스턴스를 Americano 타입으로 강제 변환하여 castedAmericano 상수에 할당하라. 오류가 날 수도 있다."로 해석해볼 수 있다.
 
    컴파일러가 다운 캐스팅을 확신할 수 있는 경우에는 as?나 as!를 사용할 수도 있다. 항상 성공하는 것을 아는 경우에는 캐스팅하려는 타입이 같은 타입이거나 부모 클래스 타입이라는 것을 알 떄이다.
 
 */
//항상 성공하다는 것을 컴파일러도 알 고 있다.
let castedCoffee: Coffee = yourCoffee as Coffee
/**
    {
            타입캐스팅의 의미
      캐스팅은 실제로 인스턴스를 수정하거나 값을 변경하는 작업이 아니다. 인스턴스는 메모리에 똑같이 남아 있다. 다만 인스턴스를 사용할 때 어떤 타입으로 다루고 어떤 타입으로 접근해야 할지 판단할 수 있도록 힌트를 주는 것뿐이다.
    }
 
 
 
 
            5. Any, AnyObject의 타입 캐스팅
    스위프트에는 특정 타입을 지정하지 않고 여러 타입의 값을 할당할 수 있는 Any, AnyObject라는 특별한 타입이 있다. Any는 함수 타입을 포함한 모든 타입을 뜻하고, AnyObject는 클래스 타입만을 뜻한다.
 
        *** Any와 AnyObject를 사용하면 예기치 못한 오류가 발생할 확률이 높아지므로 되도록이면 사용을 지양하는 것이 좋다.
    
    스위프트 표준 라이브러리에서는 Any나 AnyObject를 찾아보기 어렵지만 다른 프로그래머나 기업에서 만들어 제공하는 프레임워크의 API를 보면 Any 또는 AnyObject의 사용을 자주 볼 수 있다. API를 통해 어떤 타입의 데이터라도 전달할 수 있다는 의미로 해석해볼 수 있다. API를 통해 어떤 타입의 데이터라도 전달할 수 있다는 의미로 해석해볼 수 있다. 그런데 문제는 반환되는 타입도 Any나 AnyObject라면 전달받은 데이터가 어떤 타입인지 확인하고 사용해야 한다. 왜냐하면 스위프트는 암시적 타입 변환을 허용하지 않으며, 타입에 굉장히 엄격하기 때문이다.
 

 */
//AnyObject
func checkType(of item: AnyObject) {
    if item is Lattee {
        print("item is Latte")
    } else if item is Americano {
        print("item is Americano")
    } else if item is Coffee {
        print("item is Coffee")
    } else {
        print("unknown type")
    }
}

checkType(of: coffee)
checkType(of: myCoffee)
checkType(of: yourCoffee)
checkType(of: actingConstant)
