import UIKit
import Foundation

/**
    흐름 제어
 
 프로그램을 작성하다보면 특정 조건에서 코드를 실행해야 하거나 실행하지 말아야하는 상황이 생긴다. 또, 특정 명령어를 반복해서 실행해야 하는 일도 종종 발생한다. 이럴 때 사용하는 것이 조건문과 반복문이다.
 대부분 프로그래밍 언어에서 조건문과 반복문을 다루지만 스위프트는 다른 언어와 차이가 있으니 유의해야한다. 스위프트의 흐름 제어 구분에서는 소괄호( () ) 를 대부분 생략 할 수 있다. 물론 사용해도 무관하지만 중괄호 ( {} )는 생략할 수 없다.
 
 
 
    1. 조건문
 조건문에서 if 구문과 switch 구문이 있다. 그러나 스위프트의 조건문에는 guard 구문도 있다.
 
    > if 문
 if문은 대표적인 조건문으로 if, else 등의 키워드를 사용하여 구현할 수 있다. 정수, 실수 등 0이 아닌 모든 값을 참으로 취급하여 조건 값이 될 수 있었던 다른 언어와는 달리 스위프트의 if 문은 조건의 값이 꼭 Bool이어야만 한다.
 */

var first: Int = 5;
var second: Int = 7;

if(first>second){
    print("first>second")
} else if(first<second){
    print("first<second")
} else {
    print("first==second")
}
/**
 else if는 몇 개가 이어져도 상광없으며, else 블록은 없어도 상관없다. 추가적으로 if 키워드 뒤의 조건은 소괄호로 감싸는 것은 선택이다.
 */

first = 5;
second = 5;
var biggerValue:Int = 0;
if(first>second){
    biggerValue = first;
} else if(first == second){
    biggerValue = first;
} else if(first<second){
    biggerValue = second;
} else if(first == 5){
    //fisrt == second가 실행됐으므로 실행 X
    biggerValue = 100;
}
print(biggerValue)

/**
    > switch 구문
 기본 문법이라 할 수 있는 switch 구문은 다른 언어와 비교했을 때 많이 달라진 문법 중 하나이다. switch도 ()를 생략할 수 있다. 단, break는 선택 사항이다. 즉, case 내부의 코드를 모두 실행하면 break 없이도 switch 구문이 종료된다는 뜻이다. 그러니 이러한 구문은 예상치 못한 실수를 발생시킬 수 있다. 따라서 break 없이 case를 연속 실행하는 것은 불가능하다. 스위프트에서 switch 구문의 case를 연속 실행하려면 fallthrough 키워드를 사용한다.
 
 c 언어에서는 정수 타입만 들어갈 수 있었으나 스위프트에서는 switch 구문의 조건에 다양한 값이 들어갈 수 있다. 다만 각 case에 들어갈 비교값은 입력 값과 데이터 타입이 같아야한다. 또, 비교될 값이 명확히 한정적인 값(열거형 등)이 아닐 때는 default를 꼭 작성해야한다.
 
 또한 case에는 범위 연산자를 사용할 수도, where 절을 사용하여 조건을 확장할 수도 있다.
 
 
 switch 입력 값 {
 case 비교 값1:
        실행 구문
 case 비교 값2:
        실행 구문
 //이번 case를 마치고 switch 구문을 탈출하지 않고 아래로 넘어간다.
        fallthrough
 case 비교 값3, 비교 값4, 비교 값5: //한 번에 여러 값과 비교할 수 있다.
        실행 구문
        break; //break에 의한 종료는 선택 사항이다.
 default: //한정된 범위가 명확하지 않으면 default는 필수이다.
        실행 구문
 }
 */


let integerValue: Int = 5;
switch integerValue{
    case 0:
        print("value == zero")
    case 1...10:
        print("value == 1~10")
        fallthrough
    case Int.min..<0, 101..<Int.max:
        print("value < 0 or value > 100")
        break;
    default:
        print("10 < value <= 100")
}

let doubleValue:Double = 3.0;
switch (doubleValue){
    case 0:
        print("value == zero")
    case 1.5 ... 10.5:
        print("1.5<= value <= 10.5")
    default:
        print("value == \(doubleValue)")
}

let stringValue:String = "Jocker"
switch (stringValue) {
    case "YJ":
        print("YJ")
    case "Jocker":
        print("WHY SO SERIOUS")
    case "HI", "HELLO", "BYE":
        print("BOW")
    default:
        print("\(stringValue) said why so serious!?")
}
/**
    여러 개의 항목을 한 번에 case로 지정해주는 것도 가능하다. 그렇지만 여러 항목을 나타내기 위해 case를 연달아 쓰는 것은 불가능하다.
 case XXX : 다음에는 꼭 실행 가능한 코드가 위치해야 한다. 추가적으로 switch 구문의 입력 값으로 튜플도 사용 가능하다.
 */

typealias NameAge = (name:String, age:Int)
let tupleValue:NameAge = ("YJ", 99)
switch (tupleValue){
    case ("JOCKER", 99):
        print("NO!")
    default:
        print("find Who?")
}

// 아래와 같이 와일드 카드와 함께 사용할 수도 있다.

switch (tupleValue){
    case ("JOCKER", 99):
        print("정확히 맞췃다.")
    case ("JOCKER", _):
        print("이름만 맞았다.")
    case (_, 99):
        print("나이만 맞았다.")
    default:
        print("누굴 찾는가?")
}
/**
    와일드카드 식별자를 사용하면 무시된 값을 직접 가져와야하는 불편함도 생긴다. 그래서 미리 지정된 조건 값으리 제외한 다른 값은 실행문 안으로 가져올 수 있다. 그 때 let을 붙인 바인딩을 사용한다.
 */
switch (tupleValue){
    case ("JOCKER", 99):
        print("정확히 맞췃다.")
    case ("JOCKER", let age):
        print("이름만 맞았다. 나이는 \(age)입니다.")
    case (let name, 99):
        print("나이만 맞았다. 이름은 \(name)이다.")
    default:
        print("누굴 찾는가?")
}

//    where 키워드를 사용해서 case의 조건을 확장할 수 있다.

let 직급 : String = "사원"
let 연차 : Int = 6
let 인턴인가: Bool = false

switch( 직급 ){
    case "사원" where (인턴인가 == true):
        print("인턴")
    case "사원" where (연차 < 2 && 인턴인가 == false) :
        print("신입")
    case "사원" where (연차 > 5) :
        print("연차 높은 사원")
    case "사원":
        print("사원")
    case "대리":
        print("대리")
    default:
        print("사장")
}
/**
 열거형과 같이 한정된 범위의 값을 입력 값으로 받게 될 떄 값에 대응하는 각 case를 구현한다면 default를 구현하지 않아도 된다. 만약 값에 대응하는 case를 구현하지 않는다면 default는 필수이다.
 */

enum School {
    case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = School.university

switch ( 최종학력 ){
    case .primary :
        print("유딩")
    case .elementary :
        print("초딩")
    case .middle :
        print("중딩")
    case .high :
        print("고딩")
    case .college :
        print("전문대딩")
    case .university :
        print("대딩")
    case .graduate :
        print("졸업")
}

/**
    만약에 열거형에 case가 추가될 가능성이 있다면 switch 구문에서는 어떻게 대비해야할까? 앞서 살펴본대로 switch구문에서 현재의 열거형에 정의한 모든 case를 처리해주면 지금은 정상적으로 컴파일이 되겠지만, 나중에 열거형에 case를 추가하면 기존의 switch 구문은 컴파일 에러가 날 것이다. switch 구문이 모든 case에 대해 대비하지 못하기 때문이다. 스위프트 5.0 버전에서 추가된 unknown이라는 속성은 이런 문제를 조금 유려하게 대처할 수 있도록 도와준다.
    
 */

enum Menu{
    case chicken
    case pizza
}

let lunchMenu: Menu = .chicken

switch(lunchMenu){
    case .chicken:
        print("치킨")
    case .pizza:
        print("피자")
    case _: //case default: 와 같다.
        print("메뉴????")
}
/**
 Menu라는 열거형은 나중에 case를 추가할 것 같다는 예상을 했다. 그래서 해당 열거형의 값을 처리하는 switch 구문의 마지막 case로 와일드 카드 case(case _)를 미리 추가해두었다. 그러면 나중에 Menu 열거형에 case를 추가해도 switch 구문에서 컴파일 오류가 발생하지 않을 것이다. (default가 없으니..) 물론 컴파일러 경고가 노출되긴 할 것이다. 추가로 case를 넣으면 오히려 컴파일 경고조차 사라진다.
 
 그렇지만 문법적으로 오류가 없지만 논리적 오류가 발생할 수 있는 여지가 충분히 생긴다. 이런 문제를 방지하기 위해서 unknown 속성을 사용할 수 있다.
 */

enum Soda {
    case cider
    case coke
    case sprite
}

let bever: Soda = .sprite

switch (bever) {
    case .cider :
        print("사이다")
    case .coke :
        print("콜라")
    @unknown case _:
        print("??")
}
/**
 @unknown을 붙이면 해당 switch 구문이 모든 case에 대응하지 않는다는 사실을 다시 상기할 수 있다. 이처럼 논리적인 오류에 대해 도움을 받을 수 있는 unknown 속성을 부여할 수 있는 case는 case_ 혹은 default case 뿐이다. 또, unknown 속성을 부여한 case는 switch 구문의 가장 마지막 case로 작성해야한다.

 
   2. 반복문
 조건에 따라 실행되어야 하는 명령어를 조건문을 통해서 분기한다면, 같거나 비슷한 명령을 반복 실행할 때는 반복문만큼 중요한 것이 없다. 특히나 배열과 같은 시퀀스(sequence), 순서가 있는 데이터는 반복문으로 더욱 편리하게 처리할 수 있다.
 
 스위프트의 반복문은 기존 프로그래밍 언어의 반복문과 크게 다르지 않다. 다만 전통적인 C 스타일의 for 구문이 사라졌다는 것과 조건에 괄호를 생략할 수 있다는 정도가 다를 것이다. 또한 do-while 구문은 repeat-while로 명칭만 변경되어 있다.

 ***for 조건에 () 쓰면 컴파일 에러
 
 
  > for - in 구문
 for-in 반복 구문은 반복적인 데이터나 시퀀스를 다룰 때 많이 사용한다.
 
     for [임시 상수] in [시퀀스 아이템] {
            // 실행 코드 //
     }
*/

for  i in 0...2 {
    print(i);
    
}

print("\n")

for i in 0...5{
    if(i.isMultiple(of: 2)){
        print("\(i) == 짝수");
        continue; //countinue를 사용하면 키워드를 사용하면 바로 다음 시퀀스로 넘어간다.
    }
    print("\(i) == 홀수")
}

let helloSwift: String = "Hello Swift!"
for char in helloSwift{
    print(char)
}

print("\n")

var result: Int = 1;
 
// 시퀀스에 해당하는 값이 필요 없다면 와일드카드 식별자(_)를 사용하면 된다.
for _ in 1...3{
    result *= 10;
}

print("10의 3제곱은 \(result)이다.")

/**
 for-in 구문의 스위프트의 기본 컬렉션 타입에서도 유용하게 사용할 수 있다. 딕셔너리를 넘겨받는 값의 타입이 튜플로 지정되어 넘어온다.
 */
//Dictionary
let friends: [String: Int] = ["Jay": 35, "Joe": 29, "Jenny":31]

for tuple in friends {
    print(tuple)
}
print("\n")
let 주소: [String: String] = ["도":"충청북도", "시군구":"청주시 청원구", "동읍면": "율량동"]

for (키, 값) in 주소 {
    print("\(키) : \(값)")
}
print("\n")
//Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064"]

for 번호 in 지역번호{
    print(번호)
}
/**
 for-in 구문을 사용해서 반복처리를 쉽게 할 수 있다. 하지만 스위프트에 좀 더 익숙해 져서 옵셔널, 클로저 등을 익히고 함수형 패러다임을 이해하면 for-in 구문보다 map, filter, flatMap 등을 더 만힏 사용하게 될 것이다.
 
 
 
 
    > while 구문
 while 반복 구문도 다른 프로그래밍 언어의 while과 다르지 않다. 특정 조건(Bool 타입)이 성립하는 한 를록 내부의 코드를 반복해서 실행한다.
 
 */

var names:[String] = ["A", "B", "C", "D", "E"];
while (names.isEmpty == false){
    print("BYE \(names.removeFirst())")
}

/**
 
    > repeat-while 구문
 repeat-while 반복 구문은 다른 프로그래밍 언어의 do-while 구문과 크게 다르지 않다. repeat 블록의 코드를 최초 1회 실행한 후, while 다음의 조건이 성립하면 블록 내부의 코드를 반복 실행한다.
 */
names = ["A", "B", "C", "D", "E"];
repeat{
    print("BYE \(names.removeFirst())")
} while (names.isEmpty == false)


/**
    3. 구문 이름표
 반복문을 작성하다보면 종종 반목문을 중첩으로 작성하게 된다. 이때 반복무능ㄹ 제어하는 키워드(break, continue 등)이 어떤 범위에 적용되어야 하는지 애매하거나 큰 범위의 반복문을 종료하고 싶은데 작은 범위의 반복문만 종료되는 등 예상치 못한 실수를 할 수도 있다.
 그럴 때는 반복문 앞에 이름과 함께 콜론을 붙여 구문의 이름을 지정해주는 구문 이름표를 사용하면 좋다. 이름이 지정된 구문을 제어하고자할 때는 제어 키워드와 구문 이름을 함께 써주면 된다.
 */

var nums: [Int] = [3,2342,6,3252]
numbersLoop: for n in nums {
    if( n > 5 || n < 1){
        continue numbersLoop;
    }
    
    var count: Int = 0;
    
    printLoop: while ( true ){
        print(n)
        count += 1
        
        if( count == n ){
            break printLoop
        }
    }
    
    removeLoop: while ( true ){
        if ( nums.first != n){
            break numbersLoop
        }
        nums.removeFirst()
    }
}
