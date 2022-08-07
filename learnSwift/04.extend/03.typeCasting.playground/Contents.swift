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
 
 */
