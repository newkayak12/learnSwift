/**
                > ARC
 
 매번 전달할 때마다 값을 복사해 전달하는 값 타입과는 달리 참조 타입은 하나의 인스턴스가 참조를 통해 여러 곳에 접근하기 때문에 언제 메모리에서 해제되는지가 중요한 문제이다.
 인스턴스가 적절한 시점에 메모리에서 해제되지 않으면 한정적인 메모리 자원을 낭비하게 되며, 이는 성능의 저하로 이어지게 된다. 스위프트는 프로그램의 메모리 사용을 곤리하기 위해서 메모리 관리 기법인 ARC를 사용한다.
 
     {
            ARC와 값 타입
        ARC가 관리해주는 참조 횟수 계산(Reference Counting)은 참조 타입인 클래스의 인스턴스에만 적용된다. 구조체나 열거형은 값 타입이므로 참조 횟수 계산과 무관하다. 즉, 구조체나 열거형은 다른 곳에서 참조하기 때문에 ARC로 관리할 필요가 없다.
        
     }
 
                1. ARC(Automatic Reference Counting)란?
 ARC 기능은 자동으로 메모리를 관리해주는 방식이다. 아무래도 프로그래머가 메모리 관리에 신경을 덜 쓸수 있기 때문에 편리하다. ARC는 더 이상 필요하지 않은 클래스의 인스턴스를 메모리에서 해제하는 방식으로 동작한다. 그렇다면 자바 등 다른 프로그래밍에서 사용하는 메모리 관리 기법인 가비지컬렉션(GC)와는 어떤 차이가 있을까?
 
 ARC와 가비지 컬렉션은 참조를 계산하는 시점이다. ARC는 인스턴스가 언제 메모리에서 해제되어야 할지를 컴파일과 동시에 결정하지만 가비지컬렉션은 그렇지 않다.
 
    메모리 관리 기법                   ARC                                             가비지 컬렉션
    참조 카운팅 시점                 컴파일 시                                              런타임
    장점                  컴파일 당시 이미 인스턴스의 해제 시점이 정해져 있어               상호 참조 상황 등 복잡한 상황에서도 인스턴스를 해제할 수 있는
                       인스턴스가 언제 메모리에서 해제되는지 예측이 가능                  가능성이 더 높다.
                    
                         컴파일 당시 이미 인스턴스의 해제 시점이 정해져 있어               특별히 규칙에 신경 쓸 필요가 없다.
                        메모리 관리를 위한 시스템 자원을 추가할 필요가 없다.
    
    단점                  ARC의 작동 규칙을 모르고 사용하면 인스턴스가                    프로그램 동작 외에 메모리 감시를 위한 추가 자원이 필요하므로 한정적인
                        메모리에 영원히 해제되지 않을 수 있다.                         자원 환경에서는 성능 저하가 발생할 수 있다.
                                                            
                                                                               명확한 규칙이 없어서 인스턴스가 언제 해제될지 예측할 수 없다.
 
 
 ARC를 이용해서 자동으로 메모리 관리를 받기 위해서는 몇 가지 규칙을 알아야 한다. 왜냐하면 가비지 컬렉션과 달리 ARC는 컴파일과 동시에 인스턴스를 메모리에 해제하는 시점이 결정하기 때문이다. 우리가 원하는 방향으로 메모리 관리가 이뤄지려면 ARC에 명확한 힌트를 줘야한다.
 
 클래스의 인스턴스를 생성할 때마다 ARC는 그 인스턴스에 대한 정보를 저장하기 위한 메모리 공간을 또 따로 할당한다. 그 메모리 공간에는 인스턴스 타입 정보와 함께 그 인스턴스와 관련된 저장 프로퍼티의 값을 저장한다. 그 후에 인스턴스가 더 이상 필요 없는 상태가 되면 인스턴스가 차지하던 메모리 공간을 다른 용도로 활용할 수 있도록 ARC가 메모리에서 인스턴스를 없앤다.
 
 그런데 만약 아직 더 사용해야 하는 인스턴스를 메모리에서 해제시킨다면 인스턴스와 관련된 프로퍼티에 접근하거나 인스턴스의 메소드를 호출할 수 없다. 게다가 인스턴스에 강제로 접근하려고 하면 잘못된 메모리 접근으로 인해 프로그램이 강제 종료될 확률이 크다.
 
 인스턴스가 지속해서 필요한 상황에서 ARC는 인스턴스가 메모리에서 해제되지 않도록 인스턴스 참조 여부를 계속 추적한다. 다른 인스턴스의 프로퍼티나 변수, 상수 등 어느 한 곳에서 인스턴스를 참조한다면 ARC가 해당 인스턴스를 해제하지 않고 유지해야하는 명분이 된다. 인스턴스를 메모리에 유지시키려면 이런 명분을 ARC에 제공해야 한다는 것을 명심해야한다.
 
 인스턴스가 언제 메모리에서 해제될지 예측할 수 있도록 ARC에 적용되는 몇 가지 규칙을 알아보자. 그리고 규칙을 알지 못할 때 벌어질 수 있는 문제점, 해결방안도 같이 알아보자
 
 
 
 
                    2. 강한참조
 인스턴스가 계속해서 메모리에 남아있어야 하는 명분을 만들어 주는 것이 바로 강한참조(Strong Reference)이다. 인스턴스는 참조 횟수가 0이 되는 순간 메모리에서 해제되는데, 인스턴스를 다른 인스턴스의 프로퍼티나 변수, 상수 등에 할당할 때 강한 참조를 사용하면 참조 횟수가 1 증가한다. 또, 강한 참조를 사용하는 프로퍼티, 변수, 상수 등에 nil을 할당하면 원래 자신에게 할당되어 있던 인스턴스의 참조 횟수가 1 감소한다.
 
 참조의 기본은 강한 참조이므로 클래스 타입의 프로퍼티, 변수, 상수 등을 선언할 때 별도의 식별자를 명시하지 않으면 강한 참조를 한다. 이제까지 우리는 알지 못하고 써왔지만 프로퍼티와 변수, 상수를 모두 강한 참조로 선언해주었던 것이다.
 */
//강한참조와 참조 횟수 확인
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "YJ") //참조 횟수 == 1
reference2 = reference1 //참조 횟수 == 2
reference3 = reference1 //참조 횟수 == 3

reference3 = nil //참조횟수 == 2
reference2 = nil //참조횟수 == 1
reference1 = nil //참조횟수 == 0
/**
 reference1은 메모리에 할당 후 강한 참조로 Person이 할당되므로 참조 횟수가 1 증가한다. reference2, 3에 강한 참조로 참조되므로 참조 횟수가 1씩 증가한다.
 따라서 메모리에 살아있을 명분이 충분하다. reference 3, 2, 1순으로 참조가 해제되면서 참조 횟수가 1씩 감소하고 참조가 0 이되면서 인스턴스는 ARC 규칙에 따라 메모리에서 해제되며, 메모리에서 해제되기 직전 디이니셜라이저를 호출한다.
 */

func foo() {
    let yj = Person(name: "YJ in Func")
    //함수 종료 시점이 되면서 디 이니셜라이징 된다.
}
foo()
/**
  foo() 안에 강한 참조 상수가 있다. yj에 할당된 후 참조 횟수가 + 1이 되며, 지역변수 스코프가 끝나면서 참조 횟수가 1 감소한다.
 */

var globalReference: Person?
func foo2() {
    let localReference: Person = Person(name: "local")
    globalReference = localReference
    
    //전역에 참조되었기 때문에 디이니셜라이즈 되지 않는다.
}
foo2()
/**
 지역 변수가 전역변수에서 참조 되었기 때문에 디이니셜라이징 되지 않는다.
 
 
                2.1 강한 순환 참조 문제
 그런데 복합적으로 강한 참조가 일어나는 상황에서 강한 참조의 규칙을 모르고 사용하게 되면 문제가 발생할 수 있다. 인스턴스끼리 서로가 서로를 강한 참조할 때를 대표적인 예로 들 수 있다. 이를 강한 순환 참조(Strong Refernce Cycle)이라고 한다.
 */
class Persons {
    let name: String
    init(name: String){
        self.name = name
    }
    var room: Room?
    deinit{
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    init(number: String){
        self.number = number
    }
    var host: Persons?
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var yagom: Persons? = Persons(name: "yagom") //인스턴스 참조 횟수 1
var room: Room? = Room(number: "505") //인스턴스 참조 횟수 1

room?.host = yagom //인스턴스 참조 횟수 2
yagom?.room = room //인스턴스 참조 횟수 2

yagom = nil //인스턴스 참조 횟수 1
room = nil //인스턴스 참조 횟수 1

//Persons, Room 인스턴스를 참조할 방법을 잃었지만 메모리에 잔존하고 있다.
/**
    Person 클래스는 강한 참조를 하는 Room? 타입의 저장 프로퍼티 room을 가지고 있으며, Room 클래스는 강한참조를 하는 Person? 타입의 저장 프로퍼티 host를 갖는다. 이 둘은 모두 옵셔널이며 메모리에서 해제되는 순간을 감지하기 위해서 디이니셜라이저를 갖고 있다. 그러나 이 둘은 영원히 디이니셜라이저가 호출되지 않는다.
 
    서로 강한 참조를 하는 상태에서 각 변수에 nil을 선언해도 각 인스턴스 내부에서 서로를 강한 참조하고 있어 메모리에서 해제되지 않는다. 이렇게 메모리 누수가 발생한다.
    이렇게 두 인스턴스가 서로를 참조하는 상황에서 강한 참조 순환 문제가 발생할 수 있다.
 
 */
//수동으로 강한 순환 참조 해결
var manualYagom: Persons? = Persons(name: "mYagom")
var manualRoom: Room? = Room(number: "203")

manualRoom?.host = manualYagom
manualYagom?.room = manualRoom

manualYagom?.room = nil
manualYagom = nil

manualRoom?.host = nil
manualRoom = nil

/**
    변수 또는 프로퍼티에 nil을 할당하면 참조 횟수가 감소한다는 규칙을 생가하면 위와 같은 방법으로 인스턴스를 메모리에서 해제시킬 수 있을지 모른다. 더 우아한 해결책은 없을까?
    약한 참조, 미소유 참조를 통해 더 명확한 해결책을 찾아보자
 
 
 
                3. 약한 참조
    약한 참조(Weak Reference)는 강한 참조와 달리 자신이 참조하는 인스턴스의 참조 횟수를 증가시키지 않는다. 참조 타입의 프로퍼퍼티나 변수 선언 앞에 weak를 써주면 그 프로퍼티나 변수는 자신이 참조하는 인스턴스를 약한 참조한다.
 
    약한 참조를 사용한다면 자신이 참조하는 인스턴스가 메모리에서 해제될 수도 있다는 것을 예상해볼 수 있어야한다. 자신이 참조 횟수를 증가시키지 않았기 때문에 그 인스턴스를 강한 참조하던 프로퍼티나 변수에서 참조 횟수를 감소시켜 0으로 만들면 자신이 참조하던 인스턴스가 메모리에서 해제되기 떄문이다.
 
    {
                약한 참조와 상수, 옵셔널
        약한 참조는 상수에서 쓰일 수 없다. 만약 자신이 참조하던 인스턴스가 메모리에서 해제된다면 nil이 할당될 수 있어야하기 때문이다. 그래서 약한 참조를 할 때는 자신의 값을 변경할 수 있는 변수로 선언해야한다. 더불어 nil이 할당될 수도 있으므로, 약한 참조는 항상 옵셔널이어야한다. 즉, 옵셔널 변수만 약한 참조를 할 수 있다.
    }
 */
//강한 참조 순환 문제를 약한 참조로 해결
class Room1 {
    let number: String
    init(number: String) {
        self.number = number
    }
    
    weak var host: Person1?
    
    deinit {
        print("Room \(number) is being deinit")
    }
}
class Person1 {
    let name: String
    init(name: String){
        self.name = name
    }
    var room: Room1?
    deinit{
        print("\(name) is being deinitialized")
    }
}


var yygom: Person1? = Person1(name: "YGOM") //Person1 참조 횟수 : 1
var rroom: Room1? = Room1(number: "505") //Room1 참조 횟수 : 1

rroom?.host = yygom  //Person1 참조 횟수 : 1
yygom?.room = rroom  //Room1 참조 횟수 : 2

yygom = nil // Person 참조 횟수 : 0 Room 참조 횟수 : 1
print(rroom?.host) //nil

rroom = nil // Room 참조 0
/**
  강한 순환 참조를 해결하기 위해서 Room 클래스의 host 프로퍼티가 약한 참조를 하도록 weak 키워드를 추가해서 정의했다. 각각의 Person, Room 은 변수에 할당할 때 참조 횟수가 1 증가하는 것은 이전과 같다. 그러나 room 변수가 참조하는 인스턴스의 host 프로퍼티가 약한 참조를 하므로 yygom을 room의 host가 참조하도록 할 때 참조 횟수가 증가하지 않는다. 그러나 반대의 경우는 참조 횟수가 증가한다.
 
  여기서 yygom이 참조했던 인스턴스의 참조 횟수가 0이되면서 메모리에서 해제될 때 인스턴스의 room 프로퍼티가 참조하는 인스턴스 참조 횟수도 1 감소한다. 이를 통해서 메모리에서 인스턴스가 해제될 때, 자신의 프로퍼티가 강한 참조를 하던 인스턴스의 참조 횟수르 1 감소시킨다는 것을 알 수 있다.
 
  그리고 yygom이 참조하던 인스턴스가 메모리에서 해제됐다는 것은 room이 참조하는 인스턴스 프로퍼티인 host 가 참조하는 인스턴스가 메모리에서 해제되었다는 의미이다. host 프로퍼티는 약한 참조를 하기 때문에 자신이 참조하는 인스턴스가 메모리에서 해제되면 자동으로 nil을 할당한다는 것을 알 수 있다.
 
  그리고 마지막으로 room이 참조하던 인스턴스는 room = nil로 자신을 참조하는 곳이 없어지고 참조 횟수가 0이 되며, 메모리에서 해제된다.
 
 
 
 
            4. 미소유 참조
  참조 횟수를 증가시키지 않고 참조할 수 있는 방법은 약한 참조만 있는 것은 아니다. 약한 참조와 마찬가지로 미소유참조(Unowned Reference)는 인스턴스의 참조 횟수를 증가시키지 않는다. 미소유 참조는 약한 참조와 다르게 자신이 참조하는 인스턴스가 항상 메모리에 존재할 것이라는 전제를 기반으로 동작한다. 즉, 자신이 참조하는 인스턴스가 메모리에서 해제되더라도 스스로 nil을 할당하지 않는다. 그렇기 때문에 미소유 참조를 하는 변수나 프로퍼티는 옵셔널이 아니어도 된다.
 
  그렇지만 미소유 참조를 하면서 메모리에서 해제된 인스턴스에 접근하려 한다면 잘못된 메모리 접근으로 런타임 오류가 발생해서 프로세스가 강제로 종료된다. 따라서 미소유 참조는 참조하는 동안 해당 인스턴스가 메모리에서 해제되지 않으리라는 확신이 있을 때만 사용하 ㄹ수 있다.
 
  참조 타입의 변수나 프로퍼티의 정의 앞에 unowned 키워드를 써주면 그 변수(상수)나 프로퍼티는 자신이 참조하는 인스턴스를 미소유 참조하게 된다.
 
  미소유 참조는 어떤 관계에서 사용할 수 있을까? 예시를 들어보자 사람과 신용카드 관계로 말이다. 사람이 신용카드를 소유하지 않을 수 있지만 신용카는 명의가 꼭 있어야한다. 명의자와 신용카드는 서로 참조해야하는 상황이고 신용카드는 명의자가 꼭 존재한다는 확신이 있을 때 같은 경우에 사용한다.
 */
//미소유 참조
class People {
    let name: String
    //카드를 소지할 수도 아닐 수도 있다. + 강한 참조
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    deinit{ print("\(name) is being deinit")}
}

class CreditCard {
    let number: UInt
    unowned let owner: People //소유자가 있다는 전제하에
    init(number: UInt, owner: People) {
        self.number = number
        self.owner = owner
    }
    deinit {
        print("card #\(number) is being deinit")
    }
}

var jisoo: People? = People(name: "jisoo") //people 참조 = 1
if let people: People = jisoo {
    //creditcard 참조 = 1
    people.card = CreditCard(number: 1004, owner: people)
    //people 참조 = 1
}

jisoo = nil //people 참조 0
//creditcard 참조 0
//둘다 deinit
/**
 People는 CreditCard? 타입의 인스턴스를 강한 참조하는 card 프로퍼티가 있고, CreditCard 클래스는 People 타입 인스턴스를 미소유 참조하는 owner 프로퍼티가 있다. jisoo 변수에 새로운 People 클래스의 인스턴스를 할당하면 참조 횟수는 1이 된다. jisoo 변수가 참조하는 인스턴스의 car 프로퍼티에 새로운 CreditCard를 할당하면 그 인스턴스 참조 횟수는 1이된다.
 그러나 CreditCard의 이니셜라이저에서 owner 프로퍼티에 미소유 참조되는 People는 참조 횟수가 증가하지 않는다. 그래서 서로 참조되지만 참조 횟수는 모두 1인 상태가 된다. jisoo에 nil을 할당하면 jisoo 변수가 강한 참조하던 인스턴스가 메모리에서 해제되므로 그 인스턴스 card 프로퍼티가 강한 참조하던 CreditCard 클래스의 인스턴스도 참조 횟수가 감소되어 메모리에서 해제된다.
 
 
                5. 미소유 참조와 암시적 추출 옵셔널 프로퍼티
  
 약한 참조와 미소유참조의 예제에서 강한 참조 순환 문제 두 가지를 해결해보았다. 그러나 앞의 예시 외 다른 문제가 또 있다. 서로 참조해야하는 프로퍼티에 값이 꼭 있어야하면서도 한 번 초기화 되면 그 이후에는 nil을 할당할 수 없는 조건을 갖춰야하는 경우이다.
 */
//미소유참조와 암시적 추출 옵셔널 프로퍼티의 활용
class Company {
    let name: String
    //암시적 추출 옵셔널 프로퍼티( 강한 참조 )
    var ceo: CEO!
    
    init( name: String, ceoName: String ) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)이다.")
    }
}

class CEO {
    let name: String
    
    unowned let company: Company//미소유참조 상수 프로퍼티
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    func introduce() {
        print("\(name)은 \(company.name)의 CEO이다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "유재석")
company.introduce()
company.ceo.introduce()
/**
    Company 초기화 할 때 CEO 인스턴스가 생성되면서 프로퍼티로 할당되어야하고, Company가 존재하는 한 ceo 프로퍼티에는 CEO가 존재한다. CEO는 Company가 꼭 있어야 초기화 할 수 있다. 또한 CEO의 company는 옵셔널이 될 수 없으므로 약한 참조를 사용할 수 없다. 그렇지만 강한 참조를 하면 순환 문제가 생기므로 미소유참조를 한다.
 
    정리하면 암시적 추출 옵셔널 프로퍼티는 이니셜라이저의 2단계 초기화 조건을 충족시키기 위해서 사용했으며 미소유참조 프로퍼티는 약한 참조를 사용할 수 없는 경우 (옵셔널이 아니어야 하거나 상수로 지정해야하는 경우)에 강한 참조를 피하기 위해서 사용할 수 있다.
 
 
            6. 클로저의 강한 참조 순환
    일전에 인스턴스끼리 강한 참조 때문에 발생하는 강한 참조 순환 문제를 살펴본 바가 있다. 그런데 강한 참조 순화나 문제는 두 인스턴스끼리 참조일 떄만 발생하는 것 외에 클로저가 인스턴스의 프로퍼티일 때나, 클로저의 값 획득 특성 때문에 발생한다. 예를 들어 클로저 내부에서 self.someProperty처럼 인스턴스의 프로퍼티에 접근할 때나 클로저 내부에서 self.someMethod() 처럼 인스턴스의 메소드를 호출할 때 값 획득이 발생할 수 있는데, 두 경우 모두 클로저가 self를 획득하므로 강한 참조 순환이 발생한다.
 
    강한 참조 순환이 발생하는 이유는 클로저가 클래스와 같은 참조 타입이기 때문이다. 클로저를 클래스 인스턴스의 프로퍼티로 할당하면 클로저의 참조가 할당된다. 이때 참조 타입과 참조 타입이 서로 강한 참조를 하기 때문에 강한 참조 순환 문제가 발생한다.
 
    이러한 클로저의 강한참조 순환 문제는 클로저의 획득 목록을 통해서 해결할 수 있다. 그런데 클로저의 획득 목록을 통해 강한 참조 순환 문제를 해결하는 방법을 알아보기 전에 강한 참조 순환이 어떻게 일어나게 되는지 알아보는 것도 중요하다.
 */
class Book {
    let title: String
    let genre: String?
    
    lazy var introduce: () -> String = {
        var introduction: String = "this book name is \(self.title)"
        guard let genre = self.genre else {
            return introduction
        }
        introduction += " "
        introduction += "genre is \(genre)"
        
        return introduction
    }
    
    init(title: String, genre: String? = nil) {
        self.title = title
        self.genre = genre
    }
    deinit {
        print("\(title) is being deinit")
    }
}

var book: Book? = Book(title: "sherlock", genre: "detective")
print(book?.introduce())
book = nil

/**
    deinit이 호출되지 않는다. 메모리 누수가 발생한 것으로 보인다. Book 클래스의 introduce 프로퍼티에 클로저를 할당한 후 클로저 내부에서 self 프로퍼티를 사용할 수 있었던 이유는 introduce가 지연 저장 프로퍼티이기 때문이다. 만약 지연 저장 프로퍼티가 아니면 self를 사용하지 못 했을 것이다. lazy로 할당한 클로저 내부에서 Book 클래스 인스턴스의 다른 인스턴스 프로퍼티에 접근하려면 Book 클래스가 모두 초기화되어 사용이 가능한 상태에서만 클로저에 접근할 수 있다. 따라서 클로저 내부에서는 self 프로퍼티를 통해서만 다른 프로퍼티에 접근할 수 있다.
 
    introduce 프로퍼티를 통해 클로저를 호출하면 그 때 클로저는 자신의 내부에 있는 참조 타입 변수를 획득한다. 문제는 클로저는 자신이 호출되면 언제든지 자신 내부의 참조들을 사용할 수 있도록 참조 횟수를 증가시켜 메모리에서 해제되는 것을 방지하는데 이때 자신을 프로퍼티로 갖는 인스턴스 참조 횟수도 증가시킨다.
 
    이렇게 강한 참조 순환이 발생하면 자신을 강한 참조 프로퍼티로 갖는 인스턴스가 메모리에서 해제될 수 없다.
 
        {
                    self 프로퍼티와 참조 횟수
            클로저 내부에서 self 프로퍼티를 여러 번 호출하여 접근한다 해도 참조 횟수는 한 번만 증가한다.
        }
 
 
                6.1. 획득 목록
    위의 문제는 획득 목록(Capture List)를 통해서 해결할 수 있다. 획득 목록은 클로저 내부에서 참조 타입을 획득하는 규칙을 제시해줄 수 있는 기능이다. 예를 들어 위 상황에서 클로저 내부의 self 참조를 약한 참조로 지정할 수도, 강한 참조로 지정할 수도 있다는 뜻이다. 획득목록을 사용하면 때에 따라서, 혹은 각 관계에 따라서 참조 방식을 클로저에 제안할 수 있다.
    
    획득 목록은 클로저 내부의 매개변수 목록 이전 위치에 작성해준다. 획득 목록은 참조 방식과 참조할 대상을 대괄호로 둘러싼 목록 형식으로 작성하며 획득 목록 뒤에는 in 키워드를 써준다. 획득 목록에 명시한 요소가 참조 타입이 아니라면 해당 요소들은 클로저가 생성될 때 초기화 된다.
 */

var a = 0
var b = 0
let closure = {
    [a] in print(a,b)
    //a는 캡쳐되어 0, b는 변경된 값 10
    b = 20
}

a = 10
b = 10
closure()
print(a,b)
/**
    위 예시를 보면  변수 a는 클로저 획득 목록을 통해 클로저가 생성될 때 값 0을 획득했지만 b는 따로 획득하지 않았다. 차후에 a와 b값을 변경한 후 클로저를 실행하면 a는 클로저가 생성되었을 때의 값을 갖지만 b는 변경된 값을 사용한다.
 
    a 변수는 클로저가 생성됨과 동시에 획득 목록 내에 다시 a라는 이름의 상수로 초기화된 것이다. 그렇기 떄문에 외부에서 a의 값을 변경하더라도 클로저의 획득 목록을 통한 a와는 별개가 된다. 그러나 v의 경우에는 클로저의 내부와 외부 상관없이 값이 변하는대로 모두 반영됨을 알 수 있다.
 
    그러나 만약 획득 목록에 해당하는 요소가 참조 타입이라면 조금 다른 결과를 볼 수 있다.
 */
class SimpleClass {
    var value: Int = 0
}

var xValue: SimpleClass = SimpleClass()
var yValue: SimpleClass = SimpleClass()

let closures = {[xValue] in print(xValue.value, yValue.value)}

xValue.value = 10
yValue.value = 10
closures()
/**
 값 타입과는 조금 다른 것을 알 수 있다. 서로 동작은 같다. 두 변수 모두 참조 타입의 인스턴스가 있기 떄문이다. 그렇지만 참조 타입 획득목록에서 어떤 방식으로 참조할 것인지 즉, 강한 획득(Strong Capture)을 할 것인지, 약한 획득(Weak Capture)을 할 것인지, 미소유획득(Unowned Capture)을 할 것인지 정해줄 수 있다. 또 획득의 종류에 따라 참조 횟수를 증가시킬지 결정할 수 있다. 다만 명심할 것은 약한 획득을 하게 되면 획득 목록에서 획득하는 상수가 옵셔널 상수로 지정된다는 것이다. 그 이유는 차후에 클로저 내부에서 약한 획득한 상수를 사용하려고 할 때 이미 메모리에서 해제된 상태일 수 있기 때문이다. 해제된 후에 접근하려 하면 잘못된 접근으로 오류가 발생하므로 안전을 위해 약한 획득은 기본적으로 타입을 옵셔널으로 사용하는 것이다.
 */

var xVal: SimpleClass? = SimpleClass()
var yVal: SimpleClass = SimpleClass()
let closureOptional = { [weak xVal, unowned yVal] in print(xVal?.value, yVal.value)}
xVal = nil
yVal.value = 10

closureOptional()
/**
    xVal은 약한 참조, yVal은 미소유참조하도록 지정했다. xVal이 약한 참조를 하게 되므로 클로저 내부에서 사용하더라도 클로저는 xVal가 약한 참조를 하게 되므로 클로저 내부에서 사용하더라도 클로저는 xVal가 참조하는 인스턴스의 참조 횟수를 증가시키지 않는다. 그렇게 되면 변수가 xVal가 참조하는 인스턴스가 메모리에서 해제되어 클로저 내부에서도 더 이상 참조가 불가능한 것을 볼 수 있다. yVal은 미소유 참조를 했기 때문에 클로저가 참조 횟수를 증가시키지 않지만, 만약 메모리에서 해제된 상태에서 사용하려 한다면 실행 주엥 오류로 애플리케이션이 강제 종료될 가능성이 있다. 이전 Book예제를 바꿔보도록 하자
 */
class Book1 {
    let title: String
    let genre: String?
    lazy var introduce: () -> String = {
        [unowned self] in var introduction: String = "book name is \(self.title)"
        guard let genre = genre else {
            return introduction
        }
        introduction += " genre is \(genre)"
        return introduction
    }
    init(title: String, genre: String? = nil) {
        self.title = title
        self.genre = genre
    }
    deinit {
        print("\(title) is being deinit")
    }
}

var book1: Book1? = Book1(title: "swift book", genre: "programming")
print(book1?.introduce())
book1 = nil

/**
    위 예시를 보면 의도적으로 메모리에서 해제되는 것을 알 수 있다. 클로저 내에서 self를 미소유참조하도록 획득 목록에 명시했기 때문이다. self 프로퍼티를 미소유참조하도록 한 것은, 해당 인스턴스가 존재하지 않는다면 프로퍼티도 호출할 수 없으므로 self는 미소유참조를 하더라도 실행 중에 오류를 발생시킬 가능성이 거의 없다고 볼 수 있기 때문이다. self를 미소유 참조 지정했을 때 메모리 해제시 참조하면  잘못된 메모리 접근을 야기한다. 그러므로 미소유 참조는 신중하게 해야하며, 문제가 될 소지가 있다면 약한 참조를 하는 것이 좋다.
 */
//획득 목록의 미소유참조로 인한 차후 접근 문제 발생
var book2: Book1? = Book1(title: "A", genre: "A+");
var book3: Book1? = Book1(title: "B", genre: "B+")
//
book3?.introduce = book2?.introduce ?? {" "}
//book2의 introduce에 book3의 introduce 클로저의 참조 할당
//
print(book2?.introduce())
// 아직 book3이 참조하는 인스턴스가 해제되지 않았기 때문에 클로저 내부에서 self(book3가 참조하는 인스턴스) 참조 가능

book2 = nil
//print(book3?.introduce())
//이미 메모리에서 해제된 book2 참조
/**이런경우 약한 참조로 변경하여 옵셔널로 사용해도 무방하다.*/
class PersonA {
    let name: String
    let hobby: String?
    
    lazy var introduce: ()->String = { [weak self] in
        //`self`는 예약어와 키워드
        guard let `self` = self else {
            return "원래 참조 인스턴스 삭제"
        }
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " My hobby is \(hobby)"
        return introduction
    }
    init(name: String, hobby: String? = nil){
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinit")
    }
}

var yg1: PersonA? = PersonA(name: "yj", hobby: "eating")
var hn1: PersonA? = PersonA(name: "hn", hobby: "guitar")

// hn1의 introduce 프로퍼티에 yg1 introduce 프로퍼티 클로저의 참조 할당
hn1?.introduce = yg1?.introduce ?? {" "}

// yg1 참조하는 인스턴스가 해제되지 않았기 떄문에 클로저 내부에서 self(yg1 변수가 참조하는 인스턴스) 참조 가능
print(yg1?.introduce())

yg1 = nil

print(hn1?.introduce())

/**
 이처럼 클로저의 획득 특성 때문에 클로저가 프로퍼티로 사용될 경우 발생할 수 있는 강한참조 순환 문제는 클로저의 획득 목록을 통해 해결할 수 있는 것을 알 수 있다.
 */
