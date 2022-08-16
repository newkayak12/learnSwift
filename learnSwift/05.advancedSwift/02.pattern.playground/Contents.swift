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
