import UIKit
/**
    구조체와 클래스
 
 구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 묶어 표현하고자 할떄 유용하다. 구조체와 클래스는 프로퍼티 와 메소드를 사용해서 구조화된 데이터와 기능을 가질 수 있다. 하나의 새로운 사용자 정의 데이터 타입을 만들어 주는 것이다.
 
 객체지향 프로그래밍 패러다임을 안다면 클래스를 알 것이다. 그리고 객체 지향 프로그래밍 패러다임이 아니더라도 데이터를 구조화하여 관리하는데 구조체를 사용해봤을 것이다. 스위프트에서는 구조체와 클래스의 모습과 문법이 거의 흡사하다. 다만 구조체의 인스턴스는 값 타입 클래스의 인스턴스는 참조 타입이라는 것이 둘을 구분하는 가장 큰 차이점이다.
 
 일부 프로그래밍 언어는 소스 파일 하나에 구조체 또는 클래스 하나만 선언하고 구현할 수 있는 반면, 스위프트에서는 그런 제약 사항이 없다. 소스 파일 하나에 여러 개의 구조체와 여러 개의 클래스를 정의하고 구현해도 문제가 없다. 또, 중첩 함수와 마찬가지로 구조체 안에 구조체, 클래스 안에 클래스 등과 같은 중첩 타입 정의 및 선언이 가능하다.
 
 
    > 구조체
 구조체는 struct 키워드로 정의한다. 구조체를 정의한다는 것은 새로운 타입을 생성해주는 것과 마찬가지이다. 기본 타입(Int, String, Bool 등등)처럼 대문자 카멜케이스를 사용해서 명명한다.
 
    struct [구조체 이름] {
        [프로퍼티와 메소드들]
    }
 */
struct BasicInformation1{
    var name: String
    var age: Int
}

/**
    > 구조체 인스턴스의 생성 및 초기화
 구조체 정의를 마친 후, 인스턴스를 생성하고 초기화하고 할 때는 기본적으로 생성되는 멤버 와이즈 이니셜라이저를 사용한다. 구조체에 기본 생성된 이니셜라이저의 매개변수는 구조체의 프로퍼티 이름으로 자동 지정된다.
 
 인스턴스가 생성되고 초기화된 후 프로퍼티 값에 접근하고 싶다면 접근 연산자 '.'를 사용하면 된다. 구조체를 상수(let)로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없고, 변수(var)로 선언하면 내부 프로퍼티 선언 이후에도 변겨잉 가능하다.
 */

var yj1: BasicInformation1 = BasicInformation1(name: "YJ", age: 27)
yj1.name = "YJYJ"
yj1.age = 28

let yj2: BasicInformation1 = BasicInformation1(name: "YJ", age: 27)
//yj2.name = "YJYJ" // change 'let' to 'var' to make it mutable
//yj2.age = 28


/**
    > 클래스
 
 클래스를 정의할 때는 class라는 키워드를 사용한다. 클래스를 정의한다는 것은 새로운 타입을 생성하는 것과 마찬가지이므로 기본 타입 이름처럼 카멜케이스를 이용해서 이름을 짓는다.
 
    class [클래스 이름]{
        [프로퍼티와 메소드들]
    }
 
 클래스를 정의하는 방법은 구조체와 흡사하다. 다만 클래스는 상속을 받을 수 있기 때문에 상성 받을 떄는 클래스 이름 뒤에 콜론(:)을 써주고 부모 클래스 이름을 명시한다.
 
    class [클래스 이름] : [부모 클래스 이름] {
        [프로퍼티와 메소드들]
    }
 */
class Person1 {
    var height: Double = 0.0;
    var weight: Double = 0.0;
}

/**
    > 클래스 인스턴스 생성과 초기화
 클래스를 정의한 후, 인스턴스를 생성하고 초기화하고자 할 때는 기본적인 이니셜라이저를 사용한다. 위 예시 클래스에서 프로퍼티의 기본 값이 지정되어 있으므로 전달 인자를 통해서 따로 초기 값을 설정하지 않아도 된다.
 
 {
        인스턴스와 객체
    흔히 다른 언어에서는 클래스의 인스턴스를 객체라고 부른다. 물론 스위프트에서도 틀린 것은 아니지만 공식 문서에는 더 한정적인 용어인 인스턴스라는 용어를 사용한다.
 }
 
 인스턴스가 생성되고 초기화된 후 프로퍼티 값에 접근하고 싶다면 접근 연산자 '.'를 사용하면 된다. 구조체와 다르게 클래스의 인스턴스틑 참조 타입으므로 클래스의 인스턴스를 상수 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있다.
 */
var yj3: Person1 = Person1()
yj3.height = 155.2;
yj3.weight = 40;

let yj4: Person1 =  Person1();
yj4.weight = 152.2;
yj4.weight = 10;

/**
 
    > 클래스 인스턴스의 소멸
 클래스의 인스턴스는 참조 타입으므로 더는 참조할 필요가 없을 떄 메모리에서 해제된다. 이 과정을 소멸이라고하는데 소멸되기 직적 deinit이라는 메소드가 호출된다. 클래스 내부에 deinit 메소드를 구현해주면 소멸되기 직전 deinit 메소드가 호출된다. 이렇게 deinit은 디이니셜라이저(Deinitializer)라고 부른다. deinit 메소드는 클래스당 하나만 구현할 수 있으며, 매개변수와 반환 값을 가질 수 없다. deinit 메소드는 매개변수를 위한 소괄호도 적어주지 않는다.
 */

class Person2 {
    var height: Double = 0.0
    var weight: Double = 0.0
    
    deinit{
        print("Person Deinitialized")
    }
}
 
var yj5: Person2? = Person2()
yj5 = nil // deinit됨
/**
 보통 deinit 메소드에는 인스턴스가 메모리에서 해제되기 직전에 처리할 코드를 넣는다. 예를 들어 인스턴스 소멸 전에 데이터를 저장한다거나 다른 객체에 인스턴스 소멸을 알려야할 떄는 특히 deinit을 구현해야한다.
 
 
    > 구조체와 클래스의 차이
 구조체와 클래스는 서로 비슷하거나 같은 점이 많다.
 
 >  같은 점
 1. 값을 저장하기 위해서 프로퍼티를 정의할 수 있다.
 2. 기능 실행을 위해서 메소드를 정의할 수 있다.
 3. 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 값(프로퍼티)에 접근하도록 서브스크립트를 정의할 수 있다.
 4. 초기화될 때의 상태를 지정하기 위해서 이니셜라이저를 지정할 수 있다.
 5. 초기 구현과 더불어 새로운 기능 추가를 위해서 익스텐션을 통해 확장할 수 있다.
 6. 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 이싸.
 
 >  다른 점
 1. 구조체는 상속이 불가능하다.
 2. 타입 캐스팅은 클래스의 인스턴스에만 허용된다.(상속)
 3. 디이니셜라이저는 클래스 인스턴스에만 가능하다.
 4. 참조 횟수 계산(Reference Counting)은 클래스의 인스턴스에서만 적용된다.
 
 
 구조체와 클래스는 겉보기에는 저으이 방법, 인스턴스 방법, 프로퍼티와 메소드를 갖는다는 점에서 유사해보지미나 이 두 타입을 구분 짓는 가장 큰 차이점은 값, 참조 타입이라는 것이다.
 
    
 
 
    > 값 타입, 참조 타입
 구조체는 값 타입이고 클래스는 참조 타입이다. 값 타입과 참조 타입의 가장 큰 차이는 무엇이 전달되느냐 이다. 예를 들어 어떤 함수의 전달인자로 값 타입의 값을 넘긴다면 전달될 값이 복사되어 전달된다. 그러나 참조 타입이 전달인자로 전달될 때는 값을 복사하는 것이 아니라 참조(주소)가 전달된다. C, C++, Objective-C에서의 포인터와 유사하다. 그러나 참조하는 것을 표현하기 위해서 애스터리스크 (*)를 사용하지 않는다. 함수의 전달인자로 넘길 때도 참조가 전달되며 다른 변수 또는 상수에 할당될 때도 마찬가지로 참조가 할당된다.
 */

struct BasicInfo {
    let name: String;
    var age: Int
}

var yjInfo: BasicInfo = BasicInfo(name: "YJ", age: 29)
yjInfo.age=2000

//yjInfo의 값을 복사함
var shInfo: BasicInfo = yjInfo

print("yj's age: \(yjInfo.age)")
print("friend's age: \(shInfo.age)")

shInfo.age = 999

print("yj's age: \(yjInfo.age)")
print("friend's age: \(shInfo.age)")

class Person3 {
    var height: Double = 0.0
    var weight: Double = 0.0
}

var yagom: Person3 = Person3()
var friends: Person3 = yagom;

print("yagom's height: \(yagom.height)")
print("friend's weight: \(friends.weight)")

friends.height = 188.2;
print("yagom's height: \(yagom.height)")
print("friend's weight: \(friends.weight)")

func changeBasicInfo(_ info: BasicInfo) {
    var copiedInfo: BasicInfo = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person3) {
    info.height = 155.23
}

// changeBasicInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달기 때문에
// yagomInfo의 값만 전달되는 것이다.
changeBasicInfo(yjInfo)
print("yagom's age: \(yjInfo.age)")

//changePersonInfo(_:)의 전달인자로 yagom의 참조가 전달되었기 때문에
//yagom을 참조하는 값에도 변화가 생긴다.
changePersonInfo(yagom)
print("yagom's height: \(yagom.height)")

/**
  값 타입의 데이터를 함수의 전달인자로 전달하면 메모리에 전달인자를 위한 인스턴스가 새로 생성된다. 생성된 새 인스턴스에는 전달하려는 값이 복사되어 들어간다. 반면 참조 타입의 데이터는 전달인자로 전달할 때 기존 인스턴스의 참조를 전달하므로 새로운 인스턴스가 아닌 기존의 인스턴스 참조를 전달한다. 함수의 전달인자뿐만 아니라 새로운 변수에 할당될 때 또한 마찬가지이다.
 
  클래스의 인스턴스끼리 참조가 같은지 확인할 때는 식별 연산자(identity Operator)를 사용한다. 아래는 식별 연산자를 사용하여 두 참조가 같은지 비교하는 코드이다.
 */

var p1: Person3 = Person3()
let p2: Person3 = p1
let p3: Person3 = Person3();
print(p1 === p2)
print(p1 === p3)
print(p2 !== p3)


/**
    > 스위프트의 기본 데이터 타입은 모두 구조체이다. 
 */
