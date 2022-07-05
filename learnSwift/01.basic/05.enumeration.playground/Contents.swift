import UIKit
/**
    - 열거형
 열거형은 연관된 한목들을 묶어서 표현할 수 있는 타입이다. 열거형은 배열이나 딕셔너리 같은 타입과 다르게 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가하다. 그렇기 때문에 딱 정해진 값만 열거형 값에 속할 수 있다. 주로 열거형은 아래와 같은 상황에 사용한다.
    
    > 1. 제한된 선택지를 주고 싶을 때
    > 2. 정해진 값 외에는 입력받고 싶지 않을 때
    > 3. 예상된 입력 값이 한정되어 있을 때

 열거형을 통해서 항목들의 그룹을 정의할 수 있다. 스위프트의 열거형은 항목별로 값을 가질 수도, 가지지 않을 수도 있다. 예를 들어 C언어는 열거형의 각 항목 값이 정수 타입으로 기본 지정되지만, 스위프트의 열거형은 각 항목이 그 자체로 고유의 값이 될 수 있다.
 기존 C언어 등에서 열거형은 주로 정수 타입 값의 별칭 형태로 사용이 될 뿐이었다. 그렇기 때문에 모든 열거형의 데이터 타입은 같은 타입(주로 정수)으로 취급한다. 이는 열거형 각각이 고유의 타입으로 인식될 수 없다는 문제 때문에 여러 열거형을 사용할 때 프로그래머의 실수로 인한 버그가 생길 수도 있다. 그러나 스위프트의 열거형은 각 열거형이 고유의 타입으로 인정되기 때문에 실수로 버그가 일어날 가능성을 원천 봉쇄할 수 있다.
 
 물론 열거형 각 항목이 원시 값(Raw Value)이라는 형태로 (정수, 실수, 문자 타입 등의) 실제 값을 가질 수도 있다. 또는 연관 값(Associated Value)을 사용하여 다른 언어에서 공용체라고 불리는 값의 묶음도 구현할 수 있다.
 
     {
        스위프트의 주요 기능 중 하나는 옵셔널 enum(열거형)으로 구현되어 있다.
     }
 
    1. 기본 열거형
 스위프트의 열거형은 enum이라는 키워드로 선언할 수 있다.
 
 */
enum School{
    case primary //유치원
    case elementary //초등
    case middle //중등
    case high //고등
    case college //대학
    case university //대학교
    case graduate//대학원
}
/**
 
    School 이라는 이름을 갖는 열거형 아래에 primary, elementary, ..., graduate 등의 항목이 있다. 각 항목은 그 자체가 고유의 값이며, 항목이 여러 가지라서 나열하기 귀찮거나 어렵다면 한 줄에 모두 표현할 수 있다.
 
    -> case primary, elementary, middle, high, college, university, graduate
 */

var highestEducationLevel: School = School.university;
//위 코드와 같다.
var highestEducationLevel2: School = .university;

/**
    2. 원시 값
 열거형의 각 항목은 자체로도 하나의 값이지만 항목의 원시값(Raw value)도 가질 수 있다. 즉, 특정 타입으로 지정된 값을 가질 수 있다는 뜻이다. 특정 타입의 값을 원시 값으로 가지고 싶다면 열거형 이름 오른 쪽에 타입을 명시해주면 된다. 또, 원시 값을 사용하고 싶다면 rawValue라는 프로퍼티를 통해서 가져올 수 있다.
 */
enum RawSchool: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}
let lastEduacationLevel :RawSchool = RawSchool.university;
print("저의 최종학력은 \(lastEduacationLevel) 졸업입니다.")

enum WeekDays: Character{
    case mon="월", tue="화", wed="수", thu="목", fri="금", sat="토", sun="일"
}

let today: WeekDays = WeekDays.fri;
print("오늘은 \(today.rawValue) 요일입니다.")
/**
 만약 일부 항목만 원시 값을 주고 싶다면 그렇게 해도 된다. 나머지는 스위프트가 알아서 처리한다. 문자열 형식의 원시 값을 지정해줬다면 각 항목 이름을 그대로 원시 값으로 갖게 되고, 정수 타입이라면 첫 항목을 기준으로 0부터 1씩 늘어난 값을 갖게 된다.
 */
enum Numbers:Int{
    case zero
    case one
    case two
    case ten = 10
}
print("\(Numbers.zero), \(Numbers.one), \(Numbers.two), \(Numbers.ten)")
/**
    열거형이 원시 값을 갖는 열거형일 떄, 열거형의 원시 값 정보를 안다면 원시 값을 통해 열겨형 변수 또는 상수를 생성해줄 수도 있다. 만약 올바르지 않은 원시 값을 통해 생성하려고 한다면 nil을 반환한다. (실패 가능한 이니셜라이저)
 */

let monday = WeekDays(rawValue: "월") //Optional(__lldb_expr_5.WeekDays.mon)
let strangeDay = WeekDays(rawValue: "1") //nil
print("\(monday) // \(strangeDay)")

/**
 
    3. 연관 값
 스위프트 열거형 각 항목이 연관 값을 가지게 되면, 기존 프로그래밍 언어의 공용체 형태를 띌 수도 있다. 열거형 내의 항목(case)이 자신과 연관된 값을 가질 수 있다. 연관값은 각 항목 옆에 소괄호를 묶어 표현할 수 있다. 다른 항목이 연관 값을 갖는다고 모든 항목이 연관 값을 가질 필요는 없다.
 */
enum MainDish{
    case pasta(taste:String)
    case pizza(dough:String, topping:String)
    case chicken(withSauce:Bool)
    case rice
}
var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "Cheeze", topping: "Potato")
dinner = .chicken(withSauce: true)
dinner = .rice
//여러 가지 열거형의 응용
enum PastaTaste{
    case cream, tomato
}
enum PizzaDough{
    case cheeseCrust, thin, original
}
enum PizzaTopping{
    case pepperoni, cheese, bacon
}
enum Dishes{
    case pasta(taste:PastaTaste)
    case pizza(dough:PizzaDough, topping:PizzaTopping)
    case rice
}

var dinner2: Dishes = Dishes.pasta(taste: PastaTaste.tomato)
dinner2 = Dishes.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.pepperoni)

/**
 
    4. 항목 순회
 우리는 떄떄로 열거형에 포함된 모든 케이스를 알아야할 때가 있다. 그럴 떄 열거형의 이름 뒤에 '콜론(:)'을 작성하고 한 칸 띄운 뒤 CaseIterable 프로토콜을 채택하자 그러면 열거형에 allCases라는 이름의 타입 프로퍼티를 통해 모든 케이스의 컬렉션을 생성해준다.
 */
enum Fruit: CaseIterable{
    case apple
    case peach
    case banana
    case mango
    case pineApple
    case orange
}
let allCaseOfFruit: [Fruit] = Fruit.allCases
print(allCaseOfFruit)
/**
 CaseIterable 프로토콜을 채택해주는 것만으로 allCases프로퍼티를 사용할 수 있다. 그렇지만 복잡해지는 열거형은 그렇지 않을 수도 있다. 예시로 플랫폼별로 사용 조건을 추가하는 경우가 그러하다.
 */
enum Transport: String, CaseIterable{
    case train = "기차"
    case airPlane = "비행기"
    case car = "자동차"
    
    @available(iOS, obsoleted: 12.0)
    case bike = "자전거"
    
    static var allCases: [Transport] {
        let all: [Transport] = [.train, .airPlane, .car]
        
        #if os(iOS)
        return all
        #else
        return all + [.bike]
        #endif
    }
}


let allCases: [Transport] = Transport.allCases
print(allCases)
/**
    위처럼 available 속성을 통해 특정 케이스를 플랫폼에 따라 사용할 수 있거나 없는 경우가 생기면 CaseIterable 프로토콜을 채택하는 것만으로 allCases 프로퍼티를 사용할 수 없다. 그럴 때는 직접 allCases 프로퍼티를 구현해야한다. 이렇게 CaseIterable 프로토콜을 채택해서 allCases 프로퍼티를 바로 사용할 수 없는 경우가 있는데, 바로 열거형의 케이스가 연관 값을 갖는 경우이다.
 */
enum PastaTastes: CaseIterable{
    case cream, tomato
}
enum PizzaDoughs: CaseIterable{
    case cheese, thin, original
}
enum PizzaToppings: CaseIterable{
    case pepperoni, cheese, bacon
}
//enum MainDishes: CaseIterable{
//    case pasta(taste:PastaTastes)
//    case pizza(dough:PizzaDoughs, topping:PizzaToppings)
//    case chiken(witSauce:Bool)
//    case rice
//
//    static var allCases: [MainDishes]{
//        return PastaTastes.allCases.map(MainDishes.pasta)
//        + PizzaDoughs.allCases.reduce([]) { (result, dough) -> [MainDishes] in result + PizzaToppings.allCases.map{ (topping) -> MainDishes in            MainDishes.pizza(dough: dough, topping: topping)
//            }
//        }
//        +[true,false].map(MainDishes.chiken)
//        +[MainDishes.rice]
//    }
//}
//print(Sandwich.allCases.count)
//print(Sandwich.allCases)

/**
 위와 같이 열거형을 정의하고 allCases를 구현한 후에 케이스를 추가할 일이 생기면 꼭 allCases를 다시 살펴봐야한다.

 
    5.순환 열겨형
 순환 열거형은 열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용한다. 순환 열거형을 명시하고 싶다면 indirect 키워드를 사용하면 된다. 특정 항목에만 한정하고 싶다면 case 키워드 앞에 indirect를 붙이면 되고, 열거형 전체에 적용하고 싶다면 enum 키워드 앞에 indirect 키워드를 붙이면 된다.
 */
//특정 항목에 순환 열거형 항목 명시
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//열거형 전체에 순환 열거형 명시
indirect enum ArithmeticExpression2{
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
/**
 
    열거형에는 정수를 연관 값으로 갖는 number라는 항목이 있고 덧셈을 위한 addition, 곱셈을 위한 multiplication 항목이 있다.  아래는 ArithmeticExpression 열거형 계산을 도와주는 순환함수(Recursive Function)이다.
 */

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression)-> Int {
    switch expression{
        case .number(let value):
            return value;
        case .addition(let left, let right):
            return evaluate(left)+evaluate(right)
        case .multiplication(let left, let right):
            //일급 함수라 값으로 들어갈 수 있는거 같네..
            return evaluate(left)*evaluate(right)
    }
}


let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")
