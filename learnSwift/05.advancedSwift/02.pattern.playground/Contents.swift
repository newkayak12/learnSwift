/**
                > 패턴
 스위프트 문법에 응용할 수 있는 다양한 종류의 패턴(Pattern)이 있다. 여러 패턴을 잘 숙지하면 코드 양을 줄이는 것을 물론이거니와 스위프트 문법을 더 효율적으로 활용할 수 있다.
 패턴은 '단독 또는 복합 값의 구조를 나타내는 것'이고, 패턴 매칭은 '코드에서 어떤 패턴의 형태를 찾아내는 행위'라고 할 수 있다. 쉽게 말하면 '이러이러한 것을 표현하고 싶다.'면 '이러이러한 패턴을 통해 표현하면 된다.' 정도로 이해하면 된다. 대부분의 패턴은 switch, if, guard, for 등의 키워드가 빈번하게 등장하고 두 개 이상의 키워드가 합을 이뤄 동작한다. 패턴은 크게 두 종류로 나뉜다.
 
    - 값을 해제(추출)하거나 무시하는 패턴 : 와일드 카드 패턴, 식별자 패턴, 값 바인딩 패턴, 튜플 패턴
    - 패턴 매칭을 위한 패턴 : 열거형 패넡, 옵셔널 패턴, 표현 패턴, 타입캐스팅 패턴
 
    
 
                1. 와일드 카드 패턴
 와일드카드 패턴(Wildcard Pattern)는 와일드카드 식별자(_)를 사용한다. 와일드카드 식별자는 어떤 값이든 올 수 있음을 의미한다. 즉, 와일드 카드 식별자가 위치한 곳의 값은 무시한다.
 */
let string: String = "ABC"
switch string {
    case _: print(string)
        //어떤 값이 와도 상관이 없기에 항상 실행
}
 
let optionalString: String? = "ABC"
switch optionalString {
    case "ABC"?: print(optionalString)
        //Optional("ABC") 일떄 실행
    case _?: print("Has Value, but not ABC")
        //Optional("ABC") 이외의 값이 있을 때만 실행
    case nil: print("nil")
        // 값이 없을 떄 실행
}

let yagom = ("yagom", 99, "Male")

switch yagom {
        //첫 번째 요소가 "yagom"일 때 실행
    case ("yagom", _, _): print("HELLO YaGom")
    case (_,_,_): print("who cares ~ ")
}

for _ in 0..<2 {
    print("HALO!")
}


/**
            2. 식별자 패턴
 식별자 패턴(Identifier Patter)은 변수 또는 상수의 이름에 알맞는 값을 어떤 값과 매치시키는 패턴을 말한다.
 */
let someValue: Int = 42
// 식별자 패턴의 사용
/**
let someValue: Int = 42는 someValue 상수 선언하는 동시에 42라는 값을 할당한다. 이때 someValue의 타입인 Int와 할당하려는 42의 타입이 매치된다면 someValue는 42라는 식별자가 되므로 식별자 패턴이 성립된다. 이렇게 경우에 따라 식별자 패턴은 값 바인딩 패턴의 일종이라고 할 수도 있다.
 
 
 
            3. 값 바인딩 패턴
값 바인딩 패턴(Value-Binding-Pattern)은 변수 또는 상수의 이름에 매치된 값을 바인딩하는 것이다. 값 바인딩 패턴의 일종인 식별자 패턴은 매칭되는 값을 새로운 이름의 변수 또는 상수에 바인딩한다. 예를 들어 튜플의 요소를 해체하여 그에 대응하는 식별자 패턴에 각각 요소의 값을 바인딩하는 것이다.
 */
// 값 바인딩 패턴의 사용
let yj = ("YJ", 27, "F")
switch yj {
        //name, age, gender를 yj의 각 요소와 바인딩
    case let (name, age, gender) : print("NAME: \(name), AGE:\(age), GENDER:\(gender)")
}

switch yj {
    case (let name, let age, let gender) : print("NAME: \(name), AGE:\(age), GENDER:\(gender)")
}

switch yj {
        //값 바인딩 패턴은 와일드 카드 패턴과 결합하여 사용할 수도 있다.
    case (let name, _, let gender)  : print("NAME: \(name), GENDER:\(gender)")
}

/**
            4. 튜플 패턴
 튜플 패턴(Tuple Pattern)은 소괄호 내에 쉼표로 분리하는 리스트이다. 튜플 패턴은 그에 상응하는 튜플 타입과 값을 매치한다. 예를 들어 let (x, y): (Int, Int) = (1, 2)와 같이 선언하면 (x, y):(Int, Int)라고 사용된 튜플 패턴은 모두 Int 타입인 튜플하고만 매치된다는 뜻이다.
 
 튜플 패턴을 for-in 구문 또는 변수나 상수 선언에서 사용한다면 와일드카드 패턴, 식별자 패턴, 옵셔널패턴, 또다른 튜플 패턴 등을 함께 사용할 수 있다.
 
*/
//튜플 패턴의 사용
let (a): Int = 2
print(a)

let (x, y): (Int, Int) = (1, 2)
print(x)
print(y)

let name: String = "Jung"
let age: Int = 99
let gender: String? = "M"

switch (name, age, gender) {
    case ("Jung", _, _): print("HELLO JUNG")
    case(_, _, "M"?): print("WHO ARE YOU MAN?")
    default: print("I DONT KNOW WHO YOU ARE")
}

let points: [(Int, Int)] = [(0,0), (1,0), (1,1), (2,0), (2,1)]
for (x, _) in points {
    print(x)
}
/**
                    5. 열거형 케이스 패턴
 열거형 케이스 패턴(Enumeration Case Pattern)은 열거형 타입의 case와 매치시킨다. 열거형 케이스 패턴은 switch 구문의 case레이블과 if, while, guard, for-in 구문의 case 조건에서 볼 수 있다. 만약 연관 값이 있는 열거형 케이스와 매치하려고 한다면 열거형 케이스 패턴에는 반드시 튜플 패턴이 항께해야 한다.
 
 */
let someValue2: Int = 30
if case 0...100 = someValue2 {
    print("0 <= \(someValue2) <= 100")
}

let anotherValue: String = "ABC"
if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []
var dinner: MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish){
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a Pizza")
        return
    }
    print("\(dough) \(topping) 피자" )
}
whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauce) = dinner {
    print("\(sauce ? "양념" : "후라이드") 통닭")
    break;
}

dinner = .rice
dishes.append(dinner)
if case .rice = dinner {
    print("저녁은 밥")
}

for dish in dishes {
    switch dish {
        case let .pasta(taste): print(taste)
        case let .pizza(dough, topping): print(dough, topping)
        case let .chicken(sauce): print(sauce ? "양념" : "후라이드")
        case .rice: print("쌀")
    }
}
/**
            6. 옵셔널 패턴
    옵셔널 패턴(Optional Pattern)은 옵셔널 또는 암시적 추출 옵셔널 열거형에 감싸져 있는 값을 매치시킬 때 사용한다. 옵셔널 패턴은 식별자 패턴 뒤에 물음표를 넣어 표기하며 열거형 케이스 패턴과 동일한 위치에 자리한다. 또, 옵셔널 패턴은 옵셔널 값을 저장하는 배열의 for-in 구문을 통한 순환에서 nil이 아닌 값을 찾는 데도 유용하게 사용한다.
 */
var optionalValue: Int? = 100
if case .some(let value) = optionalValue {
    print(value)
}

if case let value? = optionalValue {
    print(value)
}

func isItHasValue(_ optionalValue: Int?){
    guard case .some(let value) = optionalValue else {
        print("none")
        return
    }
    print(value)
}
isItHasValue(optionalValue)

while case .some(let value) = optionalValue {
    print(value)
    optionalValue = nil
}
print(optionalValue)

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}


/**
                7. 타입 캐스팅 패턴
 타입캐스팅 패턴(Type-Casting Pattern)에는 is 패턴과 as 패턴이 있다. is 패턴은 switch의 case 레이블에서만 사용할 수 있다. is 패턴은 is (TYPE_NAME)과 같이 쓸 수 있고 as 패턴은 SomePattern as (TYPE_NAME)과 같이 쓸 수 있다. 이름에서부터 알 수 있듯이 타입캐스팅 패턴은 타입캐스팅을 하거나 타입을 매치시킨다. is 패턴은 프로그램 실행 중에 값의 타입이 is 우측에 쓰여진 타입 또는 그 타입의 자식클래스 타입이면 값과 매치시킨다. is 패턴은 타입캐스팅에 사용되는 as 연산자와 비슷한 역할을 하지만 반된 결과값은 신경쓰지 않는다는 차이가 있다.
 
 as 패턴은 프로그램 실행 중에 값의 타입이 as 우측에 쓰여진 타입 또는 그 타입의 자식 클래스 타입이면 값과 매치시킨다. 만약 매치된다면 매치된 값의 타입은 as 패턴이 원하는 타입으로 캐스팅된다.
 */
let someValue3: Any = 100
switch someValue3 {
//  타입이 String인지 확인하지만 캐스팅된 값을 사용할 수는 없다.
    case is String: print("It's String")
//  타입 확인과 동시에 캐스팅까지 완료되어 value에 저장
//  값 바인딩 패턴과 결합
    case let value as Int: print(value + 1)
    default: print("String도 Int도 아니다.")
}


/**
 
               8. 표현 패턴
 표현 패턴(Expression Pattern)은 표현식의 값을 평가한 결과를 이용하는 것이다. 표현 패턴은 switch 구문의 case 레이블에서만 사용할 수 있다. 표현 패턴은 스위프트 표준 라이브러리의 패턴 연산자인 ~= 연산자의 연산 결과가 true를 반환하면 매치시킨다. ~= 연산자는 같은 타입의 두 값을 비교할 때 == 연산자를 사용한다. 표현 패턴은 정수값과 정수의 범위를 나타내는 Range 객체와 매치시킬 수도 있다.
 
 표현 패턴은 매우 유용한 패턴 중 하나이다. 사실 모든 패턴 중에 가장 활용도가 높은 패턴이다. 그 이유는 ~= 연산자를 중복 정의(overload)하거나 ~= 연산자를 새로 정의하거나 또는 자신이 만든 타입에 ~= 연산자를 구현해준다면 자신이 원하는대로 패턴을 완성시킬 수 있다. 거기에 제네릭까지 추가하면 활용도는 높아진다.
 */
switch 3 {
    case 0...5: print("0 ~ 5")
    default: print("0보다 작거나 5보다 크다")
}

var point: (Int, Int) = (1,2)
//같은 타입간 비교이므로 == 연산자로 비교
switch point {
    case (0,0): print("원점")
    case (-2...2, -2...2): print("(\(point.0), \(point.1))은 원점과 가깝다.")
    default: print("(\(point.0), \(point.1))")
}

//String과 Int가 매치되도록 ~= 연산자 정의
func ~= (pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}
point = (0,0)
//새로 정의된 ~= 연산자를 사용하여 비교
switch point {
    case ("0","0"): print("원점")
    default: print("point (\(point.0) \(point.1) )")
}
struct Person {
    var name: String
    var age: Int
}
let lingo: Person = Person(name: "Lingo", age: 99)
func ~=(pattern: String, value: Person) -> Bool {
    return pattern == value.name
}
func ~=(pattern: Person, value: Person) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

switch lingo {
    case Person(name: "Lingo", age: 99): print("Same Person")
    case "Lingo": print("HI LINGO!")
    default: print("I don't know who you are")
}
/**
    표현 패턴은 프로토콜과 제네릭을 더해 특정 프로토콜을 따르는 타입에 대해서 원하는 패턴을 만ㄷ글 수 있다. 또, 스위프트의 함수형 프로그래밍 방식을 따르면 더욱 다양한 패턴 효과를 얻을 수 있다. 스위프트의 함수는 일급 객체여서 함수의 전달인자로 사용할 수 있기 때문이다. 그래서 패턴 매칭을 위한 연산자가 함수라는 점과 함수의 전달인자로 함수를 전달할 수 있다는 점을 고려하면 사용성이 높다.
 */

//제네릭을 통한 표현 패턴
protocol Personalize {
    var name: String { get }
    var age: Int { get }
}
struct Person1: Personalize {
    var name: String
    var age: Int
}

let star: Person1 = Person1(name: "Star", age: 99)
func ~= <T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}
func ~= <T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

//기존 패턴 연산자가 없더라도 제네릭 패턴 연산자로 똑같이 사용할 수 있다.
switch star {
    case Person1(name: "Star", age: 99):print("same person")
    case "Star": print("Hello Star")
    default: print("i dont know who you R")
}

//이번에는 제네릭을 사용하여 패턴 연산자를 정의한다. 이 패턴 자체가 함수이다.
func ~= <T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

//패턴에 사용할 제네릭 함수
func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
        //패턴 결합을 하면 young(star)와 같은 효과
    case young: print("\(star.name) is young")
    default: print("\(star.name) is old")
}

//패턴에 사용할 제네릭 함수
func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool){
    return { (value: T) -> Bool in value.name == pattern }
}
switch star {
        //패턴 결합을 하면 isNamed("Jung")(star)와 같은 효과
    case isNamed("jung"): print("He is Jung")
    default: print("Another Person")
}
/**
 이렇게 패턴과 비교 값이 모두 단순 값이었던 것에 비해 패턴에 함수를 사용해서 함수의 결과를 통해 Bool 값을 얻었다. 단순히 패턴에 함수를 사용하는 것을 넘어서 제네릭을 사용하여 프로토콜을 준수하는 타입 모두가 공통으로 매칭될 수 있다 또한, 사용자 정의 연산자를 적극 활용할 수도 있다.
 */
