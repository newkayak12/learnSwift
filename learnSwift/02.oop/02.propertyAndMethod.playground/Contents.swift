import UIKit
/**
    > 프로퍼티와 메소드
 프로퍼티는 클래스, 구조체 또는 열거형 드엥 관련된 값을 뜻한다. 메소드는 특정 타입에 관련된 함수를 뜻한다. 앞서 봤던 변수, 상수, 함수 등이 어떤 목적으로 쓰이고 어디에 쓰이느냐에 따라 용어가 조금씩 달라진다.
 
 
    > 프로퍼티
 프로퍼티는 크게 저장 프로퍼티(Stored Properties)와 연산 프로퍼티(Computed Properties), 타입 프로퍼티(Type Properties)로 나눌 수 있다. 저장 프로퍼티는 인스턴스의 변수 또는 상수를 의미한다. 연산 프로퍼티는 값을 저장한 것이 아니라 특정 연산을 실행한 결과값을 의미한다. 연산 프로퍼티는 클래스, 구조체, 열거형에 쓰일 수 있다. 저장 프로퍼티는 구조체와 클래스에서만 사용할 수 있다. 저장 프로퍼티와 연산 프로퍼티는 특정 타입의 인스턴스에 사용되는 것을 뜻하지만 특정 타입에 사용되는 프로퍼티도 존재한다. 이를 타입 프로퍼티라고 한다.
 
 정리하자면 기존 언어의 인스턴스 변수는 저장 프로퍼티, 클래스 변수는 타입 프로퍼티로 구분 지을 수 있다. 더불어 , 프로퍼티의 값이 변하는 것을 감시하는 프로퍼티 감시자(Property Observers)도 있다. 프로퍼티 감시자는 프로퍼티의 값이 변할 떄 값의 변화에 따른 특정 작업을 실행한다. 프로퍼티 감시자는 저장프로퍼티에 적용할 수 있으며 부모 클래스로부터 상속받을 수 있다.
 
 
    1. 저장 프로퍼티
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
 */
