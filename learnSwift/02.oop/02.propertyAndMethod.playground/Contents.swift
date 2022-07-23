import UIKit
/**
    > 프로퍼티와 메소드
 프로퍼티는 클래스, 구조체 또는 열거형 드엥 관련된 값을 뜻한다. 메소드는 특정 타입에 관련된 함수를 뜻한다. 앞서 봤던 변수, 상수, 함수 등이 어떤 목적으로 쓰이고 어디에 쓰이느냐에 따라 용어가 조금씩 달라진다.
 
 
    A. 프로퍼티
 프로퍼티는 크게 저장 프로퍼티(Stored Properties)와 연산 프로퍼티(Computed Properties), 타입 프로퍼티(Type Properties)로 나눌 수 있다. 저장 프로퍼티는 인스턴스의 변수 또는 상수를 의미한다. 연산 프로퍼티는 값을 저장한 것이 아니라 특정 연산을 실행한 결과값을 의미한다. 연산 프로퍼티는 클래스, 구조체, 열거형에 쓰일 수 있다. 저장 프로퍼티는 구조체와 클래스에서만 사용할 수 있다. 저장 프로퍼티와 연산 프로퍼티는 특정 타입의 인스턴스에 사용되는 것을 뜻하지만 특정 타입에 사용되는 프로퍼티도 존재한다. 이를 타입 프로퍼티라고 한다.
 
 정리하자면 기존 언어의 인스턴스 변수는 저장 프로퍼티, 클래스 변수는 타입 프로퍼티로 구분 지을 수 있다. 더불어 , 프로퍼티의 값이 변하는 것을 감시하는 프로퍼티 옵저버(Property Observers)도 있다. 프로퍼티 옵저버는 프로퍼티의 값이 변할 떄 값의 변화에 따른 특정 작업을 실행한다. 프로퍼티 옵저버는 저장프로퍼티에 적용할 수 있으며 부모 클래스로부터 상속받을 수 있다.
 
 
    1.1. 저장 프로퍼티
 클래스 또는 구조체의 인스턴스와 연관된 값을 저장하는 가장 단순한 개념의 프로퍼티 이다. 저장 프로퍼티는 var 키워드를 사용하면 변수 저장프로퍼티, let키워드를 사용하면 상수 저장 프로퍼티가 된다. 저장 프로퍼티를 정의할 때 프로퍼티의 기본값, 초기값을 지정해줄 수 있다.
 
    {
            > 구조체와 클래스의 저장 프로퍼티
        구조체의 저장 프로퍼티가 옵셔널이 아니더라도, 구조체는 저장 프로퍼티를 모두 포함하는 이니셜라이저를 자동으로 생성한다. 하지만 클래스의 저장 프로퍼티는 옵셔널이 아니라면 프로퍼티 기본 값을 지정해주거나 사용자 정의 이니셜라이저를 통해 반드시 초기화해주어야한다. 또, 클래스 인스턴스의 상수 프로퍼티는 인스턴스가 초기화 될 때 한 번만 값을 할당할 수 있으며, 자식클래스에서 이 초기화를 재정의 할 수 있다.
        
    }
 */
struct CoordinatePoint{
    var x: Int; //저장 프로퍼티
    var y: Int; //저장 프로퍼티
}

//구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다.
let yjPoint: CoordinatePoint = CoordinatePoint(x:10, y:5);

class Position {
    var point: CoordinatePoint
    //저장 프로퍼티(변수) -> 위치는 변경 될 수 있음을 뜻한다.
    let name: String // 저장 프로퍼티(상수)
    
    
    init(name: String, currentPoint: CoordinatePoint){
        self.name = name;
        self.point = currentPoint;
    }
}

//사용자 정의 이니셜라이저를 호출해야만 한다.
// 그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기에 인스턴스 생성이 불가하다.
let yjPosition: Position = Position(name: "YJ", currentPoint: yjPoint)
/**
    구조체는 프로퍼티에 맞는 이니셜라이저를 자동 제공하지만 클래스는 그렇지 않아서 클래스 인스턴스의 저장 프로퍼티를 사용하는 것은 번거롭다. 하지만 클래스의 저장 프로퍼티에 초깃값을 지정해주면 따로 사용자 정의 이니셜라이저를 구현할 필요가 없다.
 */


struct CoordiPoint{
    var x: Int = 0;
    var y: Int = 0;
}

let shPoint: CoordiPoint = CoordiPoint();
// 초기값이 있기 때문에 굳이 전달인자로 초기값을 던질 필요가 없다.
let yagomPoint: CoordiPoint = CoordiPoint(x: 10, y: 20)
//물론 초깃값을 할당할 수 있는 이니셜라이저를 사용할 수 있다.

print("shPoint: \(shPoint.x),\(shPoint.y)")
print("yagomPoint: \(yagomPoint.x), \(yagomPoint.y)")

class Position2{
    var point: CoordiPoint = CoordiPoint() //저장 프로퍼티
    var name: String = "UNKNOWN"
}
//초기값을 지정했다면 사용자 정의 이니셜라이저를 사용하지 않아도 된다.

let position2: Position2 = Position2();
position2.name = "SH"
position2.point = shPoint;

/**
 초기값을 미리 지정했더니 인스턴스를 만드는 과정이 훨씬 간편해졌다. 그러나 의도와 맞지 않게 인스턴스가 사용될 가능성이 있고, 인스턴스를 생성한 후 값을 일일이 할당하는 것이 불편하다. 또, Position2의 name같은 경우 한 번 할당한 후 변경을 하고 싶은데 미리 상수로 할당하면 변경이 불가능 하기 때문에 그렇게 할 수도 없다.
 
 인스턴스를 생성할 때 이니셜라이저를 통해 초깃값을 보내야하는 이유는 프로퍼티가 옵셔널이 아닌 값으로 선언되어 있기 떄문이다. 그러므로 인스턴스는 생성할 떄 프로퍼티에 값이 꼭 있는 상태여야 한다. 그런데 저장 프로퍼티의 값이 있어도 그만, 없어도 그만인 옵셔널이라면 굳이 초기값을 넣어주지 않아도 된다. 즉, 이니셜라이저에서 옵셔널 프로퍼티에 꼭 값을 할당할 필요는 없다는 것이다.
 
 옵셔널을 사용하면 아래와 같다.
 */


struct OptionalCoordi{
    var x: Int;
    var y: Int;
    //위치는 모두 있어야해서 옵셔널로 정의하지 않았다.
}


class OptionalPosition{
    var point: OptionalCoordi?
    let name: String
    init(name: String){
        self.name = name
    }
}

let optionalPosition: OptionalPosition = OptionalPosition(name: "YAGOM")
optionalPosition.point = OptionalCoordi(x: 1, y: 1)
/**
    이렇게 옵셔널과 이니셜라이저를 적절히 사용하면 다른 프로그래머가 사용할 떄, 내가 처음 의도했던 대로 구조체와 클래스를 사용할 수 있도록 유도할 수 있다.
 
 
 
    1.2. 지연 저장 프로퍼티
 
 인스턴스를 생성할 때 프로퍼티에 값이 필요 없다면 프로퍼티를 옵셔널로 선언해줄 수 있다. 그런데 그것과 조금 다른 용도로 필요할 때 값이 할당되는 지연 저장 프로퍼티(Lazy Stored Properties)가 있다. 지연 저장 프로퍼티는 호출이 있어야 값을 초기화하며, 이때 lazy 키워드를 사용한다.
 
 상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 필요할 떄 값을 할당하는 지연 저장 프로퍼티와는 맞지 않다. 따라서 지연 저장 프로퍼티는 var 키워드를 사용하여 변수로 정의한다.
 
 지연 저장 프로퍼티는 주로 복잡한 클래스나 구조체를 구현할 떄 많이 사용한다. 클래스 인스터스의 저장 프로퍼티로 다른 클래스 인스턴스나 구조체 인스턴스를 할당해야 할 떄가 있다. 이럴 때 인스턴스를 초기화하면서 저장 프로퍼티로 쓰이는 인스턴슫글이 한 번에 생성 돼야 한다면? 또, 굳이 모든 저장 프로퍼티를 사용할 필요가 없다면? 이 질문의 답이 지연 저장 프로퍼티의 사용이다. 지연 저장 프로퍼티를 잘 사용하면 불필요한 성능 저하나 공간 낭비를 줄일 수 있다.
 */

struct CoordinateLazy{
    var x: Int = 0;
    var y: Int = 0;
}

class PositionLazy{
    lazy var point: CoordinateLazy = CoordinateLazy()
    let name: String
    
    init(name: String){
        self.name = name;
    }
}

let lzyPosition: PositionLazy = PositionLazy(name: "LZY")
//lzyPosition의 point에 접근할 때 CoordinateLazy가 할당된다. (프록시 패턴인가?)
print(lzyPosition.point)

/**
    {
            > 다중 쓰레드와 지연 저장 프로퍼티
        다중 쓰레드 환경에서 지연 저장 프로퍼티에 동시다발적으로 접근할 때는 한 번만 초기화된다는 보장이 없다. 생성되지 않은 지연 저장프로퍼티에 많은 쓰레드가 동시에 접근하면 여러번 초기화 될 수 있다.
    }
 
    
 
    2.1. 연산 프로퍼티
 연산 프로퍼티는 실제 값을 저장하는 프로퍼티가 아니라. 특정 상태에 따른 값을 연산하는 플퍼티이다. 인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 접근자(getter)의 역할이나 은닉화된 내부의 프로퍼티 값을 간접적으로 설정하는 설정자(setter) 역할을 할 수동 있다. 클래스, 구조체, 열거형에 연산 프로퍼티를 정의할 수 있다.
 
 '굳이 메소드를 두고 왜 연산 프로퍼티를 쓰는가?'라는 의문에 대해서는 메소드로 구현하면 인스턴스 외부에서 메소드를 통해 인스턴스 내부 값에 접근하는 것, 매번 이를 구현해야하는 것, 가독성이 떨어지는 것 등의 이유가 있지만, 읽기 전용, 쓰기 전용 등의 상태를 구현할 수 없다는 단점이 있다는 것을 알 수 있다. 그리하여 프로퍼티가 메소드 형식보다 더 간편하고 직관적으로 보일 수 있다.
 다만 연산 프로퍼티는 접근자인 get 메소드만 구현해둔 것처럼 읽기 전용 상태로 구현하기 쉽지만, 쓰기 전용 상태로 구현할 수 없다는 단점이 있다. 메소드로는 설정자 메소드만 구현하여 쓰기 전용 상태로 구현할 수 있지만 연산프로퍼티는 그것이 불가하다.
 */

struct Navigation{
    var x: Int // 저장 프로퍼티
    var y: Int // 저장 프로퍼티

    // 대칭접을 구하는 메소드 - 접근자
    func oppositePoint() -> Self {
        return Navigation(x: -x, y: -y);
    }
    
    //대칭점을 설정하는 메소드 -> 설정자
    mutating func setOppositePoint(_ oppsite: Navigation){
        x = -oppsite.x
        y = -oppsite.y
    }
    
}

var yjPositioning: Navigation = Navigation(x: 10, y: 10)
print(yjPositioning)
print(yjPositioning.oppositePoint())

yjPositioning.setOppositePoint(Navigation(x: 15, y: 10))
print(yjPositioning)
/**
    opppsitePoint()로 대칭점을 구할 수 있으며, setOppositePoint(_:)로 대칭점을 설정해야한다. 위의 예시에서는 접근자와 설정자 이름의 일관성을 유지하기가 힘들며, 해당 포인트에 접근할 때와 설정할 때 사용되는 코드를 한 번에 읽기도 쉽지 않다. 하지만 연산 프로퍼티를 사용하면 이 두메소드를 좀 더 간결하고 확실하게 표현할 수 있다.
 */

struct Navigation2 {
    var x: Int;
    var y: Int;
    
    var oppostiePoint: Navigation2 {
        get {
            return Navigation2(x: -x, y: -y)
        }
        set(opposite){
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var myPoint: Navigation2 = Navigation2(x: 10, y: 20)
print(myPoint)
print(myPoint.oppostiePoint)
myPoint.oppostiePoint = Navigation2(x: 15, y: 10)
print(myPoint)

/**
 이런식으로 연산 프로퍼티를 사용하면 하나의 프로퍼티에 접근자와 설정자가 모두 모여있고, 해당 프로퍼티가 어떤 역할을 하는지 조금 더 명확하게 표현이 가능하다. 인스턴스를 사용하는 입장에도 마치 저장 프로퍼티인 것처럼 편하게 사용할 수 있다.
 설정자의 매개변수로 원하는 이름을 소괄호 안에 명시해주면 set 메소드 내부에서 전달받은 전달인자를 사용할 수 있다. 관용적인 표현으로 newValue로 매개변수 이름을 대신할 수 있다. 그럴 경우에는 매개변수를 따로 표기하지 말아야한다. 또, 접근자 내부의 코드가 단 한줄이고, 그 결과값의 타입이 프로퍼티 타입과 같다면 return 을 생략해도 그 결과값이 접근자의 반환값이 된다.
 */

struct Navigation3{
    var x: Int;
    var y: Int;
    
    var opposite: Navigation3 { // 연산 프로퍼티
        get{
            Navigation3(x: -x, y: -y) //return 생략
        }
        set{
            x = -newValue.x
            y = -newValue.y //newvalue로 매개변수 이름 대신했다.
        }
    }
}
/**
 굳이 대칭점을 설정해줄 필요가 없으면 읽기 전용으로 연산 프로퍼티를 사용할 수도 있다. 연산 프로퍼티를 읽기 전용으로 구현하려면 get 메소드만 사용하면 된다.
 */

struct Navigation4{
    var x: Int;
    var y: Int;
    
    var oppostie: Navigation4{
        get{
            Navigation4(x: -x, y: -y)
        }
    }
}

var myPositions: Navigation4 = Navigation4(x: 20, y: 30)
print(myPositions)
print(myPositions.oppostie)

//설정자를 구현하지 않았으므로 오류!
//myPositions.oppostie = Navigation4(x: 12, y: 431)



/**
    2.2. 프로퍼티 옵저버
 프로퍼티 옵저버(Property Observers)를 사용하면 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있다. 프로퍼티 옵저버는 프로퍼티의 값이 새로 할당될 때마다 호출한다. 이때 변경되는 값이 현재의 값과 같더라도 호출한다. 프로퍼티 옵저버는 지연 저장 프로퍼티에 사용할 수 없으며 오로지 일반 저장 프로퍼티에만 적용할 수 있다. 또한 프로퍼티 재정의해 상속받은 저장 프로퍼티 또는 연산 프로퍼티에도 적용할 수 있다. 물론 상속받지 않은 연산 프로퍼티에는 프로퍼티 옵저버를 사용할 필요가 없으며 할 수도 없다. 연산 프로퍼티의 접근자와 설정자를 통해 프로퍼티 옵저버를 구현할 수 있기 때문이다. 연산 프로퍼티는 상속받았을 때만 프로퍼티 재정의를 통해 프로퍼티 옵저버를 사용한다.
 
 프로퍼티 감시자에는 프로퍼티의 값이 변경되기 직전에 호출하는 willSet메소드와 프로퍼티으 값이 변경된 직후에 호출하는 didSet 메소드가 있다. willSet 메소드와 didSet에는 매개변수가 하나씩 있다. willSet 메소드에 전달되는 전달인자는 프로퍼티가 변경될 값이고, didSet 메소드에 전달되는 전달인자는 프로퍼티가 변경되기 전의 값이다. 그래서 매개변수의 이름을 따로 지정하지 않으면 willSet 메소드에는 newValue가 didSet에는 oldValue라는 매개변수 이름이 자동 할당된다.
 */


class Account {
    var credit: Int = 0 {
        willSet{
            print("잔액이 \(credit)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)에서 \(credit)으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account();
myAccount.credit=1000
/**
 클래스를 상속 받았다면 기존 연산 프로퍼티를 재정의하여 프로퍼비 옵저버를 구현할 수도 있다. 연산 프로퍼티를 재정의해도 기존 연산 프로퍼티 기능(접근자, 설정자, getter, setter)은 동작한다.
 아래는 연산 프로퍼티인 dollarValue가 포함되어있는 Account 클래스를 상속 받은 ForignAccount 클래스에서 기존 dollarValue 프로퍼티를 재정의하여 프로퍼티 옵저버를 구현하는 예제이다.
 */

class Account1{
    var credit: Int = 0{
        willSet{
            print("0. 잔액이 \(credit)에서 \(newValue)로 변경될 예정입니다.")
        }
        didSet{
            print("1. 잔액이 \(oldValue)에서 \(credit)으로 변경되었습니다.")
        }
    }
    var dollarValue: Double{
        get{
            return Double(credit)/1000.0
        }
        set{
            credit = Int(newValue * 1000)
            print("2. 잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account1{
    override var dollarValue: Double{
        willSet{
            print("3. 잔액이 \(dollarValue)에서 \(newValue) 달러로 변경될 예정입니다.")
        }
        didSet{
            print("4. 잔액이 \(oldValue)에서 \(dollarValue) 달러로 변경되었습니다..")
        }
    }
}

let myAccounts: ForeignAccount = ForeignAccount()
print("\n myAccounts.credit = 1000")
myAccounts.credit = 1000
print("\n myAccounts.dollarValue = 2")
myAccounts.dollarValue = 2
/**
 myAccounts.credit = 1000
0. 잔액이 0에서 1000로 변경될 예정입니다.
1. 잔액이 0에서 1000으로 변경되었습니다.

 myAccounts.dollarValue = 2
3. 잔액이 1.0에서 2.0 달러로 변경될 예정입니다.
0. 잔액이 1000에서 2000로 변경될 예정입니다.
1. 잔액이 1000에서 2000으로 변경되었습니다.
2. 잔액을 2.0달러로 변경 중입니다.
4. 잔액이 1.0에서 2.0 달러로 변경되었습니다..
 
 
 
        {
            입출력 매개변수와 프로퍼티 옵져버
            만약 프로프티 옵져버가 있는 프로퍼티를 함수의 입출력 매개변수의 전달인자로 전달한다면 항상 willSet과 didSet 옵져버를 호출한다. 함수 내부에서 값이 변경되든 되지 않든 간에 함수가 종료되는 시점을 값을 다시 쓰기 때문이다.
        }
 
    2.3. 전역변수와 지역변수
 앞서 설명한 연산 프로퍼티와 프로퍼티 감시자는 전역변수와 지역 변수 모두에 사용할 수 있다. 따라서 프로퍼티에 한정하지 않고, 전역에서 쓰일 수 있는 변수와 상수에도 두 기능을 사용할 수 있다. 함수나 메소드, 클로저 클래스, 구조체, 열거형 등의 범위 안에 포함되지 않았던 변수나 상수, 즉 우리가 프로퍼티를 다루기 전에 계속해서 사용했던 변수와 상수는 모두 전역변수 또는 전역 상수에 해당한다.
 우리가 이제 변수라고 통칭했던 전역변수 또는 지역변수는 저장변수라고 할 수 있다. 저장 변수는 마치 프로퍼티처럼 값을 저장하는 역할을 한다. 그런데 전역변수나 지역 변수를 연산변수로 구현할 수도 있으며, 프로퍼티 감시자를 구현할 수도 있다. 전역변수 또는 전역 상수는 지연 저장 프로퍼티처럼 처음 접근할 떄 최초로 연산이 이뤄진다. 즉, lazy로 연산을 늦출 필요가 없다는 것이다. 반대로 지역 변수 및 상수는 절대로 지연 연산되지 않는다.
 */

var wonInPocket: Int = 2000{
    willSet{
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)로 변경될 예정이다.")
    }
    didSet{
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경됐다.")
    }
}

var dollarInPocket: Double{
    get{
        Double(wonInPocket)/1000.0
    }
    set{
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중이다. ")
    }
}

dollarInPocket = 3.5;
/**
 주머니의 돈이 2000원에서 3500로 변경될 예정이다.
 주머니의 돈이 2000원에서 3500원으로 변경됐다.
 주머니의 달러를 3.5달러로 변경 중이다.
 */

/**
    3.1. 타입 프로퍼티
 프로퍼티 개념은 모두 타입을 정의하고 해당 타입의 인스턴스가 생성되었을 때 사용할 수 있는 인스턴스 프로퍼티이다. 인스턴스 프로퍼티는 인스턴스를 새로 새성할 때마다 초기값에 해당하는 값이 프로퍼티의 값이되고, 인스턴스마다 다른 값을 지닐 수 있다.
 
 각각 인스턴스가 아닌 타입 자체에 속하는 프로퍼티를 타입 프로퍼티라고 한다. 타입 프로퍼티는 타입 자체에 영향을 미치는 프로퍼티이다. 인스턴스의 생성 여부와 상관없이 타입 프로퍼티 값은 하나이며, 그 타입의 모든 인스턴스가 공통으로 사용하는 값(C 언어의 static constant 변수와 유사), 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수 (C언어의 static 변수와 유사) 등을 정의할 떄 유용하다.
 타입 프로퍼티는 두 가지인데 저장 프로퍼티는 변수 또는 상수로 선언할 수 있으며, 연산 타입 프로퍼티는 변수로만 선언할 수 있다. 저장 타입 파르포티는 반드시 초기값을 설정해야 하며 지연 연산된다. 지연 저장 프로퍼티와는 조금 다르게 다중 쓰레드 환경이라도 단 한 번만 초기화된다는 보장을 받는다. 지연 연산된다고 해서 lazy 키워드로 표시해주지는 않는다.
 */

class AClass {
    //저장 타입 프로퍼티
    static var typeProperty: Int = 0;
    //저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet{
            //Self.typeProperty는 AClass.typeProperty와 같은 표현이다.
            Self.typeProperty = instanceProperty + 100
        }
    }
    //연산 타입 프로퍼티
    static var typeComputedProperty: Int{
        get{
            typeProperty
        }
        set{
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
let classInstance: AClass = AClass()
classInstance.instanceProperty = 100
print(AClass.typeProperty) //200
print(AClass.typeComputedProperty) //200
/**
    타입 프로퍼티는 인스턴스를 생성하지 않고도 사용할 수 있으며 타입에 해당하는 값이다. 그래서 인스턴스에 접근할 필요 없이 이름만으로 프로퍼티를 사용할 수 있다.
 */
class Account2{
    static let dollarExchangeRate: Double = 1000.0 //타입 상수
    var credit: Int = 0; //저장 인스턴스 프로퍼티
    var dollarValue: Double{ //연산 인스턴스 프로퍼티
        get{
            //Self.dollarExchangeRate는 Account.dollarExchangeRate와 같다.
            (Double(credit)) / Self.dollarExchangeRate
        }
        set{
            credit = Int(newValue * Account2.dollarExchangeRate)
            print("전액을 \(newValue)달러로 변경 중이다.")
        }
    }
}

/**
 
    3.2 키 경로
 함수는 일급 객체(시민)로서 상수나 변수에 참조를 할당할 수 있다.
 */
func someFunction(paramA: Any, paramB: Any){
    print("someFunction Called")
}
func anotherFunction(paramA: Any, paramB: Any){
    print("someFunction Called")
}

var functionReference = someFunction(paramA:paramB:)
/**
 이렇게 함수를 참조해두고 나중에 원할 떄 호출할 수 있고, 다른 함수를 참조하도록 할 수도 있다.
 */
functionReference("A","B")
functionReference = anotherFunction(paramA:paramB:)
/**
 프로퍼티도 이처럼 값을 바로 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 할 수 있다. 바로 키 경로(KeyPath)를 활용하는 방법이다. 키 경로를 사용하여 간접적으로 특정 타입의 어떤 프로퍼티 값을 가리켜야 할지 미리 지정해두고 사용할 수 있다.
 
 키 경로 타입은 AnyKeyPath라는 클래스로부터 파생된다. 제일 많이 확장된 키 경로 타입은 WritableKeyPath<Root,Value>와 ReferenceWritableKeyPath<Root,Value> 타입이다. WritableKeyPath<Root,value> 타입은 값 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우에 적용되며, ReferenceWritableKeyPath<Root, Value> 타입은 참조 타입, 즉 클래스 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우에 적용된다. 키 경로는 역슬래시(\)와 타입, 마침표(.) 경로로 구성된다.
 
    \타입이름.경로.경로.경로
 
 여기서 경로는 프로퍼티 이름이라고 생각하면 된다.
 */

class Person {
    var name: String
    init(name: String){
        self.name = name
    }
}
struct Stuff{
    var name: String
    var owner: Person
}

print(type(of: \Person.name)) // ReferenceWritableKeyPath<Person, String>
print(type(of: \Stuff.name)) // WritableKeyPath<Stuff, String>

/**
 또한 키 경로는 기존의 키 경로에 하위 경로를 덧붙여 줄 수도 있다.
 */
let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)
/**
 각 인스턴스의 keyPath 서브스크립트 메소드에 키 경로르 전달하여 프로퍼티에 접근할 수 있다.
 */

let a1 = Person(name: "A1")
let b1 = Person(name: "B1")
let macbook = Stuff(name: "MacBook Pro", owner: a1)
let iMac = Stuff(name: "iMac", owner: a1)
let iPhone = Stuff(name: "iPhone", owner: b1)


let stuffNameKeyPath = \Stuff.name
let ownerKeyPath = \Stuff.owner

//\Stuff.owner.name과 같은 표현이 된다.
let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)

//키 경로와 서브 스크립트를 이용해서 프로퍼티에 접근하여 값을 가져온다.
print()
print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print()

print(macbook[keyPath: ownerNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])
print(iPhone[keyPath: ownerNameKeyPath])

//키 경로와 서브스크립트를 이용해서 프로퍼티에 접근하여 값을 변경한다.

iMac[keyPath:  stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerKeyPath] = b1

print(iMac[keyPath: stuffNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])

//상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키-경로 서브스크립트로도 값을 바꿔줄 수 없다.
//macbook[keyPath: stuffNameKeyPath] = "macbook pro air"

/**
    키 경로를 잘 활용하면 프로토콜과 마찬가지로 타입 간의 의존성을 낮추는 데 많은 도움을 준다. 또, 애플 프레임워크는 키-값 코딩 등 많은 곳에 키-경로를 활용하므로, 애플 프레임 워크 기반 애플리케이션을 만든다면 도움이 될 것이다.
    
    {
        접근 수준과 키 경로
        키 경로는 타입 외부로 공개된 인스턴스 프로퍼티 혹은 서브스크립트에 한하여 표현할 수 있다.
    }
 
 > 자신을 나타내는 키 경로인 \.self를 사용하면 인스턴스 그 자체를 표현하는 키 경로가 된다. 또, 컴파일러가 타입을 유추할 수 있는 경우에는 키-경로에서 타입 이름을 생략할 수 있다.
 
 
 
    
 
 
    B. 메소드
 메소드는 특정 타입에 관련된 함수를 뜻한다. 클래스, 구조체, 열거형 등은 실행하는 기능을 캡슐화한 인스턴스 메소드를 정의할 수 있다. 또한, 타입 자체와 관련된 기능을 실행하는 타입 메소드를 정의할 수도 있다. 타입 메소드는 기존의 프로그래밍 언어에서 클래스 메소드와 유사한 개념이다. 구조체와 열거형이 메소드를 가질 수 있다는 것은 기존 기존 프로그래밍 언어와 스위프트 간의 큰 차이점이다. 스위프트에서는 프로그래머가 정의하는 타입(클래스, 구조체, 열거형 등)에 자유롭게 메소드를 정의할 수 있다.
 
 
    1. 인스턴스 메소드
 인스턴스 메소드는 특정 타입의 인스턴스에 속한 함수를 뜻한다. 인스턴스 내부의 프로퍼티 값을 변경하거나 특정 연산 결과를 반환하는 등 인스턴스와 관련된 기능을 실행한다.인스턴스 메소드는 함수와 문법이 같다.
 다만 인스턴스 메소드는 함수와 달리 특정 타입 내부에 구현한다. 따라서 인스턴스가 존재할 때만 사용할 수 있다. 이 점이 함수와 유일한 차이점이다.
 */


class LevelClass{
    //현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0{
        //프로퍼티 값이 변경되면 호출하는 프로퍼티 옵저버
        didSet{
            print("Level \(level)")
        }
    }
    func levelUp(){
        print("LEVEL UP!")
        level+=1;
    }
    func levelDown(){
        print("LEVEL DOWN..")
        level-=1;
        if(level<0){
            reset()
        }
    }
    func reset(){
        print("reset")
        level = 0;
    }
    func jumpToLevel(to: Int){
        print("JUMP TO \(to)")
        level = to
    }
}


var levelClassInstance: LevelClass = LevelClass();
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.jumpToLevel(to: 3)
/**
 LevelClass는 level인스턴스 프로퍼티의 값을 수정하는 코드가 있다. 자신의 프로퍼티 값을 수정할 때 클래스의 인스턴스 메소드는 크게 신경 쓸 필요가 없지만, 구조체나 열거형 등은 값 타입이므로 메소드 앞에 mutating 키워드를 붙여서 해당 메소드가 인스턴스 내부의 값을 변경한다는 것을 명시해야한다.
 */

struct LevelStruct{
    var level: Int = 0{
        didSet{
            print("Level \(level)")
        }
    }
    func levelUp(){
        print("LEVEL UP!")
        level+=1;
    }
    func levelDown(){
        print("LEVEL DOWN..")
        level-=1;
        if(level<0){
            reset()
        }
    }
    func reset(){
        print("reset")
        level = 0;
    }
    func jumpToLevel(to: Int){
        print("JUMP TO \(to)")
        level = to
    }
}
var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.levelDown()
levelStructInstance.levelDown()
levelStructInstance.jumpToLevel(to: 4)


/**
    > self프로퍼티
 모든 인스턴스는 암시적으로 생성된 selft 프로퍼티를 갖는다. 자바의 this와 비슷하게 인스턴스 자신을 가리키는 프로퍼티이다. self 프로퍼티는 인스턴스를 더 명확히 지칭하고 싶을 때 사용한다. LevelClass의 예시 처럼 level 변수를 사용할 떄, 스위프트는 자동으로 메소드 내부에 선언된 지역변수를 먼저 사용하고, 그 다음 메소드 매개변수, 그 다음 인스턴스의 프로퍼티를 찾아서 level이 무엇을 지칭하는지 유추한다. 그런데 메소드 매개변수의 이름이 level인데 이 level매개변수가 아닌 인스턴스 프로퍼티인 level을 지칭하고 싶으면 self 프로퍼티를 사용한다.
 */

class LevelClass2{
    var level: Int = 0
    func jumpLevel(to level: Int){
        print("jump to \(level)")
        self.level = level
    }
}
/**
    위 예시의 jumpLevel의 매개변수 이름  level이 인스턴스 프로퍼티 level과 이름이 같다. 그럴 때 level = level 이라고 적어주면 컴파일러는 좌측의 level은 인스턴스 프로퍼티인 level보다는 매개변수로 넘어온 level을 지칭하는 것으로 판단한다. 그럴 때 좌측에 level대신 self.level이라고 적어주면 좌측의 elvel이 인스턴스 프로퍼티라는 것을 명확히 할 수 있따. 또, self 프로퍼티의 다른 용도는 값 타입 인스턴스 자체의 값을 치환할 수 있다. 클래스의 인스턴스는 참조 타입이라서 self 프로퍼티에 다른 참조를 할당할 수 없는데, 구조체나 열거형 등은 self 프로퍼티를 사용하여 자신 자체를 치환할 수도 있다.
 */

class LevelClass3 {
    var level: Int = 0;
    
    func reset(){
//        error!
        self = LevelClass3()
    }
}

struct LevelStruct3{
    var level: Int =0;
    mutating func levelUp(){
        print("LV up")
        level += 1
    }
    mutating func reset(){
        print("reset")
        self = LevelStruct3()
    }
}

var levelStructInstance2: LevelStruct3 = LevelStruct3()
levelStructInstance2.levelUp()
print(levelStructInstance2.level)

levelStructInstance2.reset()
print(levelStructInstance2.level)

enum OnOffSwitch {
    case on, off
    mutating func nextState(){
        self = (self == .on)? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)

/**
    2. 타입 메소드
 인스턴스 프로퍼티와 타입 프로퍼티가 있듯이 메소드에도 인스턴스 메소드와 타입 메소드가 있다. 타입 자체에 호출이 가능한 메소드를 타입 메소드( 흔히 객체 지향 프로그래밍에서 지칭하는 클래스 메소드와 유사)라고 부른다. 메소드 앞에 static 키워드를 사용하여 타입 메소드임을 나타내준다. 클래스 타입 메소드는 static키워드와 class 키워드를 사용할 수 있는데 static으로 정의하면 상속 후 매소드 오버라이드가 불가하고 class로 정의하면 오버라이드가 가능하다.
 */

class DClass {
    static func staticTypeMethod(){
        print("STATIC_TYPE_METHOD")
    }
    class func classTypeMethod(){
        print("CLASS_TYPE_METHOD")
    }
}

class RClass: DClass{
//    ERROR!
//    override static func staticTypeMethod{
//
//    }
    
    override class func classTypeMethod() {
        print("RCLASS!! CLASS_TYPE_METHOD");
    }
}

DClass.staticTypeMethod()
DClass.classTypeMethod()
RClass.staticTypeMethod()
RClass.classTypeMethod()

/**
 또, 타입 메소드는 인스턴스 메소드와 달리 self 프로퍼티가 타입 그 자체를 가리킨다는 점이 다르다. 인스턴스 메소드에서 self가 인스턴스를 가리킨다면 타입 메소드의 self는 타입을 가리킨다. 그래서 타입 메소드 내부에서 타입 이름과 self는 같은 뜻이라고 볼 수 있다. 그래서 타입 메소드에서 self프로퍼티를 사용하면 타입 프로퍼티 및 타입 메소드를 호출할 수 있다.
 */


struct SystemVolume{
    static var volume: Int =5
    
    static func mute(){
        self.volume = 0;
    }
}

class Navi{
    var volume: Int =5
    
    func guidWay(){
        SystemVolume.mute();
    }
    func finishGuidWay(){
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10
let myNavi: Navi = Navi()
myNavi.guidWay()
print(SystemVolume.volume)
myNavi.finishGuidWay()
print(SystemVolume.volume)


/**
 
 */
