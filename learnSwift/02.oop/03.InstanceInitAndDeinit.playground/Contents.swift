import UIKit

/**
    > 인스턴스 생성과 소멸
 구조체와 클래스를 생성할 때는 지금까지 기본 이니셜라이저를 사용해서 인스턴스를 생성했다. 초기화(Initialization)는 클래스나 구조체 또는 열거형의 인스턴스를 사용하기 위한 준비 과정이다. 초기화가 완료된 인스턴스는 사용 후 소멸 시점이 오면 소멸한다. 이번 장에서는 인스턴스를 생성하는 방법과 클래스의 인스턴스가 소멸할 때 어떤 프로세스가 진행되는지 알아보자
 
    1. 인스턴스의 생성
 초기화 과정은 새로운 인스턴스를 사용할 준비를 하기 위하여 저장 프로퍼티의 초기값을 설정하는 드으이 일을 한다. 이니셜라이저를 정의하면 초기화 과정을 직접 구현할 수 있다. 그렇게 구현된 이니셜라이저는 새로운 인스턴스를 생성할 수 있는 특별한 메소드가 된다. 스위프트의 이니셜라이저는 반환 값이 없다. 이니셜라이저의 역할은 그저 인스턴스의 첫 사용을 위해 초기화하는 것뿐이다.
 이니셜라이저는 해당 타입의 새로운 인스턴스를 생성하기 위해서 호출한다. 이니셜라이저는 func 키워드를 사용하지 않고 오로지 init 키워드를 사용하여 이니셜라이저 메소드임을 표현한다. init 메소드는 클래스, 구조체, 열거형 등의 구현부 또는 해당 타입의 익스텐션 구현부에 위치한다. 다만 클래스의 지정 이니셜라이저는 익스텐션해서 구현해줄 수 없다.
 */
class initClass{
    init(){
        
    }
}

struct initStruct{
    init(){
        
    }
}

enum initEnum{
    case someCase
    init(){
        //열거형은 초기화할 때 반드시 cas 중 하나가 되어야한다.
        self = .someCase
    }
}
/**
    1.1 프로퍼티 기본값
 구조체와 클래스의 인스턴스는 처음 생성할 떄 옵셔널 저장 프로퍼티를 제외한 모든 저장 프로퍼티에 적절한 초기값(initial Value)을 할당해야한다. 이니셜라이저 실행될 때 저장 프로퍼티에 적절한 초기 값을 할당할 수 있다. 초기화 후에 값이 확정되지 않은 저장 프로퍼티는 존재할 수 없다. 프로퍼티를 정의할 때 프로퍼티 기본값(Default Value)를 할당하면 이니셜라이저에서 따로 초기값을 할당하지 않더라도 프로퍼티 기본값으로 저장 프로퍼티의 값이 초기화 된다.
 
    {
            초기화 프로퍼티 옵저버
        이니셜라이저를 통해 초기값을 할당하거나, 프로퍼티 기본값을 통해 처음의 저장 프로퍼티가 초기화 될때는 프로퍼티 감시자 메소드가 호출되지 않는다.
    }
 */

struct Area{
    var squareMeter: Double
    init(){
        squareMeter = 0.0//initValue
    }
}

let room: Area = Area()
print(room.squareMeter)

/**
 구조체 Area는 squareMeter라는 Double 타입의 저장 프로퍼티를 가지고 있다. init 이니셜라이저로 인스턴스를 초기화하며 squareMeter의 초기값은 0.0이 된다.
 앞서 설명했듯이 이니셜라이저로 저장 프로펕티에 초기값을 설정하는 방법도 있지만, 프로퍼티를 정의할 때 프로퍼티에 기본값을 할당하는 방식을 사용할 수도 있다. 프로퍼티에 기본 값을 할당 하는 방법은 아래와 같다.
 */

struct Area2{
    var squareMeter: Double = 0.0
}
let room2: Area2 = Area2()
print(room.squareMeter)
/**
 초기화 과정은 이니셜라이저의 매개변수, 옵셔널 프로퍼티, 상수 프로퍼티의 값 할당 등 프로그래머의 의도대로 구현할 수 있는 다양한 패턴의 이니셜라이저가 있다.
 
 
 
    1.2 이니셜라이저 매개변수
 함수나 메소드를 정의할 때와 마찬가지로 이니셜라이저도 매개변수를 가질 수 있다. 즉, 인스턴스를 초기화하는 과정이 필요한 값을 전달할 수 있다.
 */
struct Area3 {
    var squareMeter: Double
    init(fromPy py: Double){
        self.squareMeter = py * 3.3058
    }
    init(fromSqaureMeter squareMeter: Double){
        self.squareMeter = squareMeter
    }
    init(value: Double){
        self.squareMeter = value
    }
    init(_ value: Double){
        self.squareMeter = value
    }
}

let roomOne: Area3 = Area3(fromPy: 15.0)
print(roomOne)
let roomTwo: Area3 = Area3(fromSqaureMeter: 33.06)
print(roomTwo)

let roomThree: Area3 = Area3(value: 33.06)
let roomFour: Area3 = Area3(33.06)

//Area3() // error
/**
위와 같이 사용자 정의 이니셜라이저를 만들면 기존의 기본 이니셜라이저(init())는 별도로 구현하지 않는 이상 사용할 수 없다. 세번쨰 이니셜라이저는 따로 전달 인자를 사용하지 않았다. 별다른 의미 없는 value 라는 이름의 매개변수가 있으므로 만약 자동으로 지정되는 전달인자 레이블 value가 필요하지 않다면 네 번쨰 이니셜라이저처럼 와일드 카드 식별자(_)를 사용하여 전달인자 레이블을 없애주면 된다.
 
 
    1.3 옵셔널 프로퍼티 타입
 초기화 과정에서 값을 초기화하지 않아도 되는, 즉 인스턴스가 사용되는 동안에 값을 꼭 갖지 않아도 되는 저장 프로퍼티가 있다면 해당 프로퍼티를 옵셔널로 선언할 수 있다. 또는 초기화 과정에서 값을 지정해주기 어려운 경우 저장 프로퍼티를 옵셔널로 선언할 수도 있다. 옵셔널로 선언한 저장 프로퍼티는 초기화 과정에서 값을 할당해주지 않는다면 자동으로 nil이 할당된다.
 */
class Person {
    var name: String
    var age: Int?
    
    init(name: String){
        self.name = name;
    }
}

let yj: Person = Person(name: "yj")
print(yj.name)

print(yj.age)

yj.age = 99
print(yj.age)

yj.name = "SH"
print(yj.name)

/**
 옵셔널로 할당하면 이니셜라이저에서 특별히 초기화 하지 않았지만 자동으로 nil이 할당되어 있다.
 
 
    1.4 상수 프로퍼티
 위 예시에서 이름 프로퍼티를 상수가 아닌 변수로 선언해둔다면 재할당으로 값이 바뀔 수 있다. 이런 상황을 방지하려면 해당 프로퍼티를 상수로 선언해야한다. 그러나 상수로 선언된 저장 프로퍼티는 인스턴스를 초기화하는 과정에서만 값을 할당할 수 있으며, 처음 할당된 이후로는 값을 변경할 수 없다.
    {
            상수 프로퍼티와 상속
        클래스 인스턴스의 상수 프로퍼티는 프로퍼티가 정의된 클래스에서만 초기화할 수 있다. 해당 클래스를 상속받은 자식 클래스의 이니셜라이저에서는 부모클래스의 상수 프로퍼티 값을 초기화할 수 없다.
    }
 */
class Person2{
    let name: String;
    var age: Int?
    init(name: String){
        self.name = name
    }
}
let yj2: Person2 = Person2(name: "YJ")
//yj12.name = "ERIC" //Error

/**
 
    1.5 기본 이니셜라이저와 멤버 와이즈 이니셜라이저
 이제까지 사용자 정의 이니셜라이저에 대해 알아봤는데, 정작 기본 이니셜라이저에 대해서 알아보지 못했다. 사용자 정의 이니셜라이저를 정의해주지 않으면 클래스나 구조체는 모든 프로퍼티에 기본값이 지정되어 있자는 전제 하에 기본 이니셜라이저를 사용한다. 기본 이니셜라이저는 프로퍼티 기본값으로 프로퍼티를 초기화해서 인스턴스를 생성한다. 즉, 기본 이니셜라이저는 저장 프로퍼티의 기본값이 모두 지정되어있고, 동시에 사용자 정의 이니셜라이저가 정의되어 있지 않은 상태에서 제공된다. 저장 프로퍼티를 선언할 때 기본값을 지정해주지 않으면 이니셜라이저에서 초깃ㄱ밧을 설정해야한다. 그러나 프로퍼티 하나 때문에 매번 이니셜라이저를 추가하거나 변경하는 일은 여간 귀찮은 일이 아니다. 때문에 구조체는 사용자 정의 이니셜라이저를 구현하지 않으면 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저인 멤버와이즈 이니셜라이저를 기본으로 제공한다. 그렇지만 클래스는 멤버와이즈 이니셜라이저를 지원하지 않는다.
 */
//구조체가 멤버와이즈 이니셜라이즈 사용
struct Point{
    var x: Double = 0.0
    var y: Double = 0.0
}
struct Size{
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

//구조체 프로퍼티에 기본값이 있다면 필요한 매개변수만 사용하여 초기화할 수도 있다.
//let somePoint: Point = Point()
//let someSize: Size = Size(width: 50)
//let anotherPoint: Point = Point(y:100)
/**
    1.6 초기화 위임
 값 타입인 구조체와 열거형은 코드의 중복을 피하기 위해서 이니셜라이저가 아닌 이니셜라이저에게 일부 초기화를 위임하는 초기화 위임을 간단하게 구현할 수 있다. 하지만 클래스는 상속을 지원하는터라 간단한 초기화 위임도 할 수 없다.
 값 타입에서 이니셜라이저가 아른 이니셜라이저를 호출하려면 self.init을 사용한다. 당연히 self.init은 이니셜라이저 안에서만 사용할 수 있는데, self.init을 사용한다는 것 자체가 사용자 정의 이니셜라이저를 정의하고 있다는 뜻이다. 그런데 사용자 정의 이니셜라이저를 정의하면 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 사용할 수 없다고 했다. 따라서 초기화 위임을 하려면 최소 두 개 이상의 사용자 정의 이니셜라이저를 정의해야한다.
    {
            기본 이니셜라이저를 지키고 싶다면
        사용자 정의 이니셜라이저를 정의할 때도 기본 이니셜라이저나 멤버 와잉즈 이니셜라이저를 사용하고 싶으면 잉ㄱ스텐션을 이용해서 사용자 정의 이니셜라이저를 구현하면 된다.
    }
 */
enum Student {
    case elementary, middle, high
    case none
    //사용자 정의 이니셜라이저가 있는 경우, init 메소드를 구현해주어야 기본 이니셜라이저를 사용할 수 있다.
    
    init(){
        self = .none
    }
    init(koreanAge: Int){
        switch koreanAge {
            case 8...13:
                self = .elementary
            case 14...16:
                self = .middle
            case 17...19:
                self = .high
            default:
                self = .none
        }
    }
    init(bornAt: Int, currentYear: Int){
        //두 번쨰 사용자 이니셜라이저
        self.init(koreanAge: currentYear - (bornAt + 1))
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2022)
print(younger)
/**
 위의 열거형은 두 개의 사용자 정의 이니셜라이저가 있다. 첫 번쨰 사용자 정의 이니셜라이저는 나이를 전달받아 나이에 맞는 학교를 case로 구분한 이니셜라이저를 초기화 하고, 두 번째 사용자 정의 이니셜라이저는 태어난 해와 현재 연도를 전달받아 나이로 계산한 후 첫 번쨰 이니셜라이저에 초기화를 위임한다. 이렇게 초기화 위임 방법을 사용하면 코드를 중복으로 쓰지 않고 효육적으로 여려 케이스의 이니셜라이저를 만들 수 있다.
 
 
    
    1.7 실패 가능한 이니셜라이저
 이니셜라이저를 통해 인스턴스를 초기화할 수 없느 여러 가지 예외 상황이 있다. 대표적으로 이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달되었을 때, 이니셜라이저는 인스턴스 초기화에 실패할 수 있다. 그 외에도 여러 이유로 인스턴스 초기화에 실패할 수 있다.
 이니셜라이저를 정의할 떄 이런 실패 가능성을 염두에 두기도 하는데, 이렇게 실패 가능성을 내포한 이니셜라이저를 실패 가능한 이니셜라이저(Failable Initializer)라고 부른다. 실패 가능한 이니셜라이저는 클래스, 구조체, 열거형 등에 모두 정의할 수 있다. 실패 가능한 이니셜라이저는 실패했을 때 nil을 반환해주므로 반환 타입이 옵셔널로 지정된다. 따라서 실패 가능한 이니셜라이저는 init 대신에 init? 키워드를 사용한다.
    
    {
            이니셜라이저의 매개변수
        실패하지 않는 이니셜라이저와 실패 가능한 이니셜라이저를 같은 이름과 같은 매개변수 타입을 갖도록 정의할 수 없다. 실패 가능한 이니셜라이저는 실제로 특정 값을 반환하지 않는다. 초기화를 실패했을 떄는 return  nil을 반대로 초기화에 성공했을 떄는 return을 적어 초기화의 성공과 실패를 표현할 뿐이다. 실제로 값을 반환하지는 않는다.
 
    }
 
 아래 예시의 Person3 클래스는 이름, 나이가 잘못 입력되면 실패할 수도 있다. 실패 가능한 이니셜라이저를 사용하면 잘못된 전달인자를 전달받았을 떄 초기화 하지 않을 수 있다.
 
 */
class Person3{
    let name: String;
    var age: Int?
    
    init?(name: String){
        if(name.isEmpty){
            return nil
        }
        self.name = name;
    }
    init?(name: String, age: Int){
        if name.isEmpty || age < 0 {
            return nil;
        }
        self.name = name
        self.age = age
    }
}
let failInit: Person3? = Person3(name: "yj", age: 99)
if let person: Person3 = failInit {
    print(person.name)
} else  {
    print("Person wasn't init")
}


let chope: Person3? = Person3(name: "chope", age: -10)
if let person: Person3 = failInit {
    print(person.name)
} else  {
    print("Person wasn't init")
}

let eric: Person3? = Person3(name: "", age: 30)
if let person: Person3 = failInit {
    print(person.name)
} else  {
    print("Person wasn't init")
}
/**
실패 가능한 이니셜라이저는 구조체와 클래스에서도 유용하지만 특히 열거형에서 유용하게 사용할 수 있다. 특정 case에 맞지 않는 값이 들어오면 생성에 실패할 수 있다. 혹은 rawValue로 초기화할 때, 잘못된 rawValue가 전달되어 들어온다면 열거형 인스턴스를 생성하지 못할 수 있다. 따라서 rawValue를 통한 이니셜라이저는 기본저긍로 실패 가능한 이니셜라이저로 제공된다.
 */

enum Student2: String{
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    init?(koreanAge: Int){
        switch koreanAge {
            case 8...13:
                self = .elementary
            case 14...16:
                self = .middle
            case 17...19:
                self = .high
            default:
                return nil
        }
    }
    init?(bornAt: Int, currentYear: Int){
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger2: Student2? = Student2(koreanAge: 21)
print(younger2)

younger2 = Student2(bornAt: 1999, currentYear: 2022)
print(younger2)

younger2 = Student2(rawValue: "대학생")
print(younger2)

younger2 = Student2(rawValue: "고등학생")
print(younger2)

/**
    1.8 함수를 사용한 프로퍼티 기본값 설정
 만약 사용자 정의 연산을 통해 저장 프로퍼티 기본값을 설정하고자 한다면 클로저나 함수를 사용하여 프로퍼티 기본값을 제공할 수 있다. 인스턴스를 초기화할 때 함수나 클로저가 호출되면서 연산 결과값을 프로퍼티 기본값으로 제공해준다. 그렇기 때문에 크로저나 함수의 반환 타입은 프로퍼티의 타입과 일치해야 한다.
 
 만약 프로퍼티 기본값을 설정해주기 위해서 클로저를 사용한다면 클로저가 실행되는 시점은 초기화할 때 인스턴스의 다른 프로퍼티 값이 설정되기 전이라는 것도 명심해야한다. 즉, 클로저 내부에는 인스턴스의 다른 프로퍼티를 사용하여 연산할 수 없다는 것이다. 다른 프로퍼티에 기본 값이 있다고 해도 안된다. 또한, 클로저 내부의 self 프로퍼티도 사용할 수 없으며, 인스턴스 메소드를 호출할 수도 없다.
 

class SomeClass {
    let someProeprty: SomeType = {
        //새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해준다.
        //반환되는 값의 타입은 SomeType과 같은 타입이어야 한다.
        return someValue
    }()
}

 
 클로저 뒤에 소괄호가 붙은 이유는 클로저를 실행하기 위해서이다. 클로저 뒤에 소괄호가 붙어 클로저를 실행한 결과 값은 프로퍼티의 기본 값이 된다. 만약 소괄호가 없다면 프로퍼티의 기본값은 클로저 그 자체가 된다.
 */

//클로저를 통한 프로퍼티 기본 값 설정
struct Students {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Students] = {
        var arr: [Students] = [Students]()
        for num in 1...15{
            var student: Students = Students(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)
/**
 students 프로퍼티는 Student 구조체의 인스턴스를 요소로 갖는 Array 타입이다. SchoolClass 클래스의 인스턴스를 초기화하면 students 프로퍼티의 기본값을 제공하기 위해서 클로저가 동작하고 1번부터 15번까지 학생을 생성하여 배열에 할당한다. myClass 인스턴스는 생성되자마자 students 프로퍼티에 15명의 학생이 있는 상태가 되는 것이다.
 
    {
            iOS에서의 활용
        스위프트 언어와 크게 관련은 없지만 iOS의 UI 등을 구성할 떄 UI 컴포넌트를 클래스의  프로퍼티로 구현하고, UI 컴포넌트의 생성과 동시에 컴포넌트의 프로퍼티를 기본적으로 설정할 떄 유용하게 사용할 수 있따.
    }
 
 
 
 
    2. 인스턴스 소멸
 클래스의 인스턴스는 디이니셜라이저(Deinitializer)를 구현할 수 있다. 디이니셜라이저는 이니셜라이저와 반대 역할을 한다. 즉, 메모리에서 해제되기 직전 클래스 인스턴스와 관련하여 원하는 정리 작업을 구현할 수 있다. 디이니셜라이저는 클래스의 인스턴스가 메모리에서 소멸되기 바로 직전에 호출된다. deinit 키워드를 사용하여 디이니셜라이저를 구현하면 자동으로 호출된다.
 
 디이니셜라이저는 클래스의 인스턴스에만 구현할 수 있다.
 
 스위프트는 인스턴스가 더 이상 필요하지 않으면 자동으로 메모리에서 소멸시킨다. 인스턴스 대부분은 소멸시킬 때 디 이니셜라이저를 사용해 별도의 메모리 관리 작업을 할 필요는 없다. 그렇지만 예를 들어 인스턴스 내부에서 파일을 불러와 열어보는 등의 외부 자원을 사용했다면 인스턴스를 소멸하기 직전에 ㅏ일을 다시 저장하고 닫아주는 등의 부가작업을 해야한다. 또는 인스턴스를 메모리에서 소멸하기 직전에 인스턴스에 저장되어 있던 데이터를 디스크에 파일로 저장해줘야 하는 경우도 있을 수 있다 .그런 경우에 디이니셜라이저는 굉장히 유용하게 사용할 수 있다.
 
 클래스에는 디이니셜아이저를 단 하나만 구현할 수 있다. 디이니셜라이저는 이니셜라이저와는 다르게 매개변수를 갖지 않으며, 소괄호도 적어주지 않는다. 또, 자동으로 호출되기 때문에 별도의 코드로 호출할 수도 없다.
 
 디이니셜라이저는 인스턴스를 소멸하기 직전에 호출되므로 인스턴스의 모든 프로퍼티에 접근할 수 있으며, 프로퍼티의 값을 변경할 수도 있다.
 
 class SomeClass{
    deinit{
            print("deinit")
    }
 }
 
 var instance: SomeClass? = SomeClass()
 instance = nil // deinit
 */

class FileManger{
    var fileName: String
    
    init(fileName: String){
        self.fileName = fileName
    }
    func openFile(){
        print("open File : \(self.fileName)")
    }
    func modifyFile(){
        print("modify File : \(self.fileName)")
    }
    func writeFile(){
        print("write File : \(self.fileName)")
    }
    func claseFile(){
        print("close File : \(self.fileName)")
    }
    
    deinit {
        print("deinit")
        self.writeFile()
        self.claseFile()
    }
}


var fileManager: FileManger? = FileManger(fileName: "abc.txt")

if let manger: FileManger = fileManager {
    manger.openFile()
    manger.modifyFile()
}

fileManager =  nil;
/**
 위 예시는 디스크의 파일을 불러와서 사용하는 FileManager 클래스이다. FileManager의 인스턴스가 파일을 불러와 사용하며, 인스턴스의 사용이 끝난 후에는 파일을 변경사항을 저장하고 다시 닫아야 메모리에서 파일이 해제되기 때문에 인스턴스가 메모리에서 해제되기 직전에 파일도 닫아주는 작업을한다. 디이니셜라이저를 잘 활용하면 메모리 관리 측면 외에도 프로그래머가 설계한 로직에 따라 인스턴스가 메모리에서 해제되기 직전에 적절할 작업을 하도록 할 수 있다. 
 */
