import UIKit
import Foundation

/**
  함수
 함수 대부분은 작업의 가장 작은 단위이자 하나의 작은 프로그램이기도 하다. "하나의 프로그램은 하나의 큰 함수다."라는 말이 있듯이, 함수는 프로그램을 이루는 주된 요소 중 하나이다. 함수는 프로그램을 이루는 주된 요소 중 하나이다. 스위프트에서 함수는 일급 객체이기 때문에 하나의 값으로도 사용할 수 있다.
 
 
> 함수와 메소드
 함수와 메소드는 기본적으로 같다. 다만 상황이나 위치에 따라 다른 용어로 부르는 것뿐이다. 구조체, 열거형 등 특정 타입에 연관되어 사용하는 함수를 메소드, 모듈 전체에서 전역적으로 사용할 수 있는 함수를 함수라고 부른다. 즉, 함수가 위치하거나 사용되는 범위 등에 따라 호칭이 달라지는 것 뿐이다.
 
> 함수의 정의와 호출
 조건문과 반복문 같은 스위프트의 다른 문법과 달리 함수에서는 소괄호를 생략할 수 없다. 스위프트의 함수는 오버라이드와 오버로드를 모두 지원한다. 따라서 매개변수의 타입이 다르면 같은 이름의 함수를 여러 개 만들 수 있고, 매개변수의 개수가 달라도 같은 이름의 함수를 만들 수 있다.
 
        * 기본적인 함수의 정의와 호출
    스위프트의 함수는 자유도가 굉장히 높은 문법 중 하나이다. 기본적으로 함수의 이름과 매개변수, 반환 타입 등을 사용하여 함수를 정의한다. 함수를 정의하는 키워드는 func이다. 함수 이름을 지정해준 후 매개변수는 소괄호로 감싸준다. 반환 타입을 명시하기 전에는 ->를 이용해여 어떤 타입이 반환되리 것인지를 명시해준다. 반환을 위한 키워드는 다른 언어와 같이 'return'이다.
 
            func [함수 이름] ( [매개 변수 ...] ) -> [반환 타입] {
                            
                            [실행 구문]
 
                return [반환 값]
            }
 */

func hello(name:String)-> String{
    return "Hello \(name)!"
}

let helloHenry: String = hello(name: "Henry");
print(helloHenry)

func introduce(name: String) -> String {
    "제 이름은 \(name) 입니다."
}
let introduceJenny: String = introduce(name: "JENNY");
print(introduceJenny)

/**
    기본 형태는 다른 언어와 비슷하다 그렇지만 생략할 수 있거나 추가 가능한 부분을 살펴보면 스위프트에서 함수를 얼마나 다양하게 정의할 수 있는지 알 수 있다. introduce: 함수에서 볼 수 있듯 return 키워드를 생략할 수 있다. 함수 내부의 코드가 단 한줄의 표현이고, 그 표현의 결과 값이 타입의 함수의 반환 타입과 일치한다면 return을 생략해도 반환이 된다.
        {
            매개변수와 전달인자
            매개변수는 함수를 정의할 때 외부로부터 받아들이는 전달 값의 이름을 의미한다. 전달인자(Argument), 혹은 인자는 함수를 실제로 호출할 때 전달하는 값을 의미한다. hello(name:) 함수에서 매개변수는 'name'이고 전달 받은 값인 "Jenny"는 전달 인자이다.
        }
    
    > 매개변수
 스위프트의 함수는 매개변수를 어떻게 정의하냐에 따라서도 모습이 크게 달라질 수 있다.
 
    > 매개변수가 없는 함수와 매개변수가 여러 개인 함수
  함수에 매개변수가 필요 없다면 매개변수 위치를 공란으로 비워둔다.
*/

    
func helloWorld() -> String {
      return "Hello, world!"
}

print(helloWorld())

/**
 
   매개변수 여러 개 필요한 함수를 정의할 때는 쉼표 (,)로 매개변수를 구분한다. 주의할 점은 함수를 호출할 떄, 매개변수 이름을 붙여주고 콜론(:)을 적어준 후 전달인자를 보내준다는 점이다. 이렇게 호출 시에 매개변수에 붙이는 이름을 '매개변수 이름'이라고 한다.
 
 */

 func sayHello(myName: String, yourName: String) -> String {
     return "HELLO \(myName)! I'm \(yourName)"
 }

print(sayHello(myName: "YJ", yourName: "SH"));

/**
    > 매개변수 이름과 전달인자 레이블
    sayHello(myName: yourName:)} 함수를 호출할 때 myName과 yourName이라는 매개변수 이름을 사용했다. 매개변수 이름과 더불어 전달인자 레이블을 지정해줄 수 있다. 보통 함수를 정의할 때 매개변수를 정의하면 매개변수 이름과 전달인자 레이블을 같은 이름으로 사용할 수 있지만 전달인자 레이블을 별도로 지정하면 함수 정의에서 매개변수 이름 앞에 한 칸을 띄운 후 전달인자 레이블을 지정한다.
 
        {
            스위프트에서 기본적으로 사용하는 키워드 대부분은 매개변수 이름으로 사용할 수 없다. 하지만 이름을 지정해줄 때 강세표 혹은 backquote(`)로 감사주면 대부분의 키워드를 이름으로 사용할 수 있다. 예를 들어 var라는 단어는 스위프트 키워드이므로 이름으로 사용하면 컴파일 오류가 발생하지만, 강세표로 사용하여 `var`로 사용하면 된다.
        }
 
    func 함수 이름 ([전달인자 레이블] [매개변수 이름]: [매개변수 타입], [전달인자 레이블] [매개변수 이름]: [매개변수 타입]) -> [반환 타입] {
            [실행 구문]
        return [반환 값]
    }
 */

// from과 to라는 전달인자 레이블이 있으며
//myName과 name이라는 매개변수 이름이 있는 sayHello 함수
func sayHello2(from myName:String, to name:String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello2(from: "SH", to: "YJ"))

/**
    함수 내부에서 전달인자 레이블을 사용할 수 없으며, 함수를 호출할 때는 매개변수 이름을 사용할 수 없다. C언어나 자바 같은 기존 언어처럼 전달인자 레이블을 사용하고 싶지 않으면 와일드카드 식별자를 사용하면 된다. 와일드 카드 식별자를 사용하여 전달인자 레이블을 사용하지 않도록 구성하면 아래와 같다.
 */
func sayHello3(_ name: String, _ times: Int) -> String {
    var result: String = "";
    
    for  _ in 0..<times {
        result += "hello \(name)!" + " "
    }
    
    return result
}

print(sayHello3("Yj", 3))

/**
 
    또, 전달 인자 레이블을 변경하면 함수의 이름 자체가 변경된다. 그렇기 때문에 전달인자 레이블만 다르게 서주더라도 함수 중복 정의(오버로드)로 동작할 수 있다.
 */

func overloadTest(to name: String, _ times: Int) -> String {
    var result: String = "";
    for _ in 0..<times {
        result += "HELLO \(name)! "
    }
    return result
}

func overloadTest(to name: String, repeatCount times: Int) -> String {
    var result: String = "";
    for _ in 0..<times {
        result += "HELLO \(name)! "
    }
    return result
}

print(overloadTest(to: "YJ", 3))
print(overloadTest(to: "YJ", repeatCount: 2))

/**
 
    > 매개변수 기본값
 
 스위프트의 함수에서는 매개변수마다 기본값을 지정할 수 있다. 즉, 매개변수가 전달되지 않으면 기본값을 사용한다. 매개변수 기본값이 있는 함수는 함수를 중복 정의한 것처럼 사용할 수 있다. 만약 위의 예시에서 repeatCount 매개변수에 기본값을 3으로 주면 repeatCount 매개변수를 넘겨주지 않더라도 3으로 자동 설정되어 함수가 동작한다.
 */

func defaultValue(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    
    return result;
}

print(defaultValue("KK"))
print(defaultValue("KK", times: 2))

/**
    기본값이 없는 매개변수를 기본값이 있는 매개변수 앞에 사용해야한다. 기본값이 없는 매개변수는 대체로 함수를 사용함에 있어 중요한 값을 전달할 가능성이 높다. 무엇보다 기본값이 있는지와 상관없이 중요한 순서대로 매개변수를 배치하는 것이 좋다.
 
        {
            print 함수
            print() 함수의 원형을 살펴보면 public func print( _ itmes: Swift.Any ..., separator: String = default, terminator: String = default)로 정의되어 있다. 단순히 items만 넘겨도 동작하는 이유는 separator의 기본값 default는 " ", terminator의 기본값 default는 \n 이기 때문이다.
        }
 
 
 
    > 가변 매개변수와 입출력 매개변수
 
  매개변수로 몇 개의 값이 들어올지 모를 때, 가변 매개변수를 사용할 수 있다. 가변 매개변수는 0개 이상(0 포함)의 값을 받아올 수 있으며, 가변 매개변수로 들어온 인자 값은 배열처럼 사용할 수 있다. 함수마다 가변 매개변수는 하나만 가질 수 있다.
 */

func sayHelloToFriend(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend), "
    }
    
    result += "I'm \(me) !"
    return result;
}

print(sayHelloToFriend(me: "SH", friends: "YJ","DW","HS"))
print(sayHelloToFriend(me: "SH"))


/**
    함수의 전달인자로 값을 전달할 때는 보통 값을 복사해서 전달한다. 값이 아닌 참조를 전달하려면 입출력 매개변수를 사용하낟. 값 타입의 데이터 참조를 전달인자로 보내면 함수 내부에서 참조하여 원래 값을 변경한다. C언어의 포인터와 유사하다. 하지만 이 방법은 함수 외부의 값에 어떤 영향을 줄지 모르기 떄문에 함수형 프로그래밍 패러다임에서는 지양하는 패턴이다. 물론 객체지향 프로그래밍 패러다임에서는 종종 사용된다. 애플의 프레임워크(iOS, macOS 등)에서는 객체지향 프로그래밍 패러다임을 사용하므로 유용할 수 있지만, 애플 프레임 워크를 벗어난 다른 환경에서 함수형 프로그래밍 패러다임을 사용할 때는 입출력 매개변수를 사용하지 않는 것이 좋다.
 
    입출력 매개변수의 전달 순서는 아래와 같다.
 
        1. 함수를 호출할 때, 전달인자의 값을 복사한다.
        2. 해당 전달인자의 값을 변경하면 1에서 복사한 것을 함수 내부에서 변경한다.
        3. 함수를 반환하는 시점에 2에서 변경된 값을 원래 매개변수에 할당한다.
 
    연산 프로퍼티 또는 감시자가 있는 프로퍼티가 입출력 매개변수로 전달된다면, 함수 호출 시점에 그 프로퍼티의 접근자가 호출되고 함수 반환 시점에 프로퍼티의 설정자가 호출된다.  참조는 inout 매개변수로 전달된 변수 또는 상수 앞에 앰퍼센트(&)를 붙여서 표현한다.
 */

var numbers: [Int] = [1, 2, 3]
func nonReferenceParameter(_ arr: [Int]){
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]){
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])
referenceParameter(&numbers)
print(numbers[1])

/**
    입출력 매개변수는 매개변수 기본값을 가질 수 없으며, 가변 매개변수로 사용될 수 없다. 또한 상수는 변경될 수 없으므로 입출력 매개변수의 전달인자로 사용될 수 없다.
 
    입출력 매개변수는 잘 사용하면 문제가 없지만 메모리 안전(memory safety)을 위협하기도 한다. 따라서 사용에 몇몇 제약이 있다.
 
 
 
 
    > 반환이 없는 함수
 함수는 특정 연산을 실행한 후 결과값을 반환한다. 그러나 값의 반환이 굳이 필요하지 않는 함수도 있다. 그럴 때는 반환 값이 없는 함수를 만들어 줄 수 있다. 만약 반환 값이 없는 함수라면 반환 타입을 '없음'을 의미하는 Void로 표기하거나 아예 반환 타입 표현을 생략해도 된다. 즉, 반환 타입이 Void이거나 생략되어 있다면 반환 값이 없는 함수이다.
 */

func sayHelloWorld(){
    print("HELLO WORLD")
}
sayHelloWorld()

func sayHelloWorld(from myName: String, to yourName: String){
    print("HELLO \(yourName)! I'm \(myName)")
}
sayHelloWorld(from: "YJ", to: "SH")

func sayGoodBye() -> Void { //void로 명시해줘도 상관 없다.
    print("GOOD BYE")
}
sayGoodBye()



/**
    > 데이터 타입으로서의 함수
 앞서 언급했듯이 스위프트의 함수는 일급 객체이므로 하나의 데이터 타입으로 사용할 수 있다. 즉, 각 함수는 매개변수 타입과 반환 타입으로 구성된 하나의 타입으로 사용(정의)할 수 있다는 뜻이다. 함수를 하나의 데이터 타입으로 나타내는 방법은 아래와 같다.
 
        ( 매개변수 타입의 나열 ) -> 반환 타입
 
 예를 들면 아래와 같다.
 func sayHello(name: String, times: Int) -> String { ... }
  >  sayHello 함수의 타입은 (String, Int) -> String이다.
  
  func sayHelloToFriend(me: String, names: String...) -> String { ... }
  > sayHelloToFriend 함수의 타입은 (String, String...) -> String이다.
 
  func sayHelloToVoid() { ... }
  > sayHelloToVoid는 (Void) -> Void 이다. 참고로 Void 키워드를 빈 소괄호의 묶음으로 표현할 수도 있다. 아래의 표현은 모두 같다.
  >  (Void) -> Void
  >  () -> Void
  >  () -> ()
 
        {
            함수의 축약 표현
        
            함수의 데이터 타입과는 조금 무관한 이야기지만, 함수를 간략히 표현하고자 할 때 축약 표현을 사용하기도 한다. sayHello(name: String, times: Int) -> String 함수 같은 경우는 sayHello(name:times:)와 같이 이름과 매개변수 개수 등을 이용해서 함수를 표현할 수 있다.
        }
 
   아래는 함수를 데이터 타입으로 사용할 수 있는 간단한 예시이다. 함수를 데이터 타입으로 사용할 수 있다는 것은 함수를 전달인자로 받을 수도, 반환 값으로 돌려줄 수도 있다는 의미이다. 상황에 맞는 함수를 전달인자로 넘겨 적절히 처리할 수도 있으며, 상황에 맞는 함수를 반환해주는 것도 가능하는 뜻이다. 이는 스위프트의 함수가 일급 객체이기 때문에 가능한 일이다.
 */

typealias CalculateTwoInts = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b;
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2,5))

mathFunction = multiplyTwoInts
print(mathFunction(2,5))
/**
 먼저 두 Int 값을 입력받아 계산 후 Int 값을 돌려주는 형태의 함수를 CalculateTwoInts라는 별칭으로 지었다.
    {
        매개변수 타입과 반환 타입
        함수형 프로그래밍에서 특정 로직에 관여할 함수의 매개변수와 반환 타입은 매우 중요하다. 타입 별칭을 통해 손쉽게 함수를 관리할 수 있으며, 매개변수와 반환 타입은 매우 중요하다. 타입 별칭을 통해 손쉽게 관리할 수 있다.
    }
 
  그리고 addTwoInts(_:_:)와 multiplyTwoInts(_:_:)라는 간단한 함수 두 개를 만들었다. 두 함수는 변수 mathFunction에 번갈아가면 할당하거나 mathFunction 이름으로 호출할 수도 있다.
 */

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int){
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)
printMathResult(chooseMathFunction(false), 3, 5)

/**
    {
            전달인자 레이블과 함수 타입
 
        전달인자 레이블은 함수 타입의 구성요소가 아니므로 함수 타입을 작성할 떄는 전달인자 레이블을 써줄수 없다.
        let someFunction: (lhs: Int, rhs: Int) -> Int //X
        let someFunction: (_ lhs: Int,_ rhs: Int) -> Int //O
        let someFunction: (Int, Int) -> Int //O
    }
 기존의 C언어 등에서 함수가 일급 객체가 아니었기 때문에 함수의 포인터를 사용해야 했고, 그로 인해 발생하는 다양한 문제가 있었다. 일급 객체가 아닌 기존의 언어의 함수와 스위프트 함수와의 차이가 무엇인지, 어떤 점이 더 좋은지 생각해볼 필요가 있다. 또, 함수가 일급 객체인 경우 어떤 상황에서 유용하게 사용할 수 있을지, 내 프로그램의 어떤 부분에서 쓸 수 있을지 고민해보는 것이 좋다.
 
 
 
        > 중첩 함수

 스위프트는 데이터 타입의 중첩이 자유룝다. 예를 들어 열거형 안에 또 하나의 '열거형'이 들어갈 수 있고 클래스 안에 또 다른 '클래스'가 들어올 수 있는 등 다른 프로그래밍 언어에서 생각하지 못했던 패턴을 자유롭게 만들수 있다.
 
 함수의 중첩은 함수 안에 함수를 넣을 수 있다는 의미인데 우리가 앞서 살펴보았던 함수는 특별한 위치에 속해 있지 않는 한 모두 전역함수이다. 즉, 모듈 어디서든 사용할 수 있는 함수라는 뜻이다. 그러나 함수 안의 함수로 구현된 중첩 함수는 사우이 함수의 몸통 블록 내부에서만 함수를 사용할 수 있다. 물론 중첩 함수의 사용 범위가 해당 함수 안쪽이라고 해서 아예 외부에서 사용할 수 없는 것은 아니다. 함수가 하나의 반환 값으로 사용될 수 있으므로 중첩 함수를 담은 함수가 중첩 함수를 반환하면 밖에서도 사용할 수 있다.
 
     ... -3 , -2, -1, 0, 1, 2, 3 ...
 
 원점이 0이고 좌로는 음수, 우로는 양수로 이뤄진 보드이다. 특정 위치에서 원점으로 이동하는 함수를 만들고자 한다. 왼쪽으로 한 칸 이동하는 함수와 오른쪽으로 한 칸 이동하는 함수, 둘 중 무엇을 호출해야 하는지 판단하는 함수를 구현해보자
 */

typealias MoveFunc = (Int) -> Int
func goRight(_ currentPosition: Int) -> Int{
    return currentPosition+1;
}

func goLeft(_ currentPosition: Int) -> Int{
    return currentPosition-1;
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight;
}

var position: Int = 3;
let moveToZero: MoveFunc = functionForMove(position > 0)

print("가자 원점으로")
while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}
print("원점 도착")

/**
    지금까지 우리가 함수를 구현하던 방식이다. 그런데 왼쪽으로 이동하는 함수와 이동하는 함수와 오른쪽으로 함수는 아주 사소한 기능 차이일 뿐 원점을 찾아가는 목적은 같다. 따라서 굳이 모듈 전역에서 사용할 필요가 없다. 그래서 사용 범위를 한정하고자 함수를 하나의 함수 안쪽으로 배치하여 중첩 함수로 구현하고, 필요할 때만 외부에서 사용할 수 있도록 바꿔보자. 위에서 전역함수로 구현된 goLeft(_:) 함수와 goRight(_:) 함수를 funcionForMove(_:) 함수 안쪽으로 배치하여 중첩 함수로 구현했다.
 */

typealias MoveFunc2 = (Int) -> Int


func functionForMove2(_ shouldGoLeft: Bool) -> MoveFunc2{
    func goLeft2(_ currentPosition: Int) -> Int{
        return currentPosition-1;
    }

    func goRight2(_ currentPosition: Int) -> Int{
        return currentPosition+1;
    }
    
    return shouldGoLeft ? goLeft2 : goRight2
}

var position2: Int = -4 //현 위치
let moveToZero2: MoveFunc2 = functionForMove2(position2 > 0)
while position2 != 0 {
    print("\(position2)")
    position2 = moveToZero2(position2)
}
print("원점 도착!")
/**
    전역함수가 많은 프로젝트에서는 전역으로 사용이 불필요한 함수의 범위를 조금 더 명확하고 깔끔하게 표현할 수 있다.
 
    
    > 종료되지 않는 함수
 
 스위프트에는 종료(return)되지 않는 함수가 있다.
 종료되지 않는다는 의미는 정상적으로 끝나지 않는 함수라는 뜻이다. 이를 비반환 함수(Nonreturning function) 또는 비반환 메소드(Nonreturning method)라고 한다. 비반환 함수(메소드)는 정상적으로 끝날수 없는 함수이다. 이 함수를 실행하면 프로세스 동작은 끝났다고 볼 수 있다. 왜 이런 이름을 붙이게 되었을까? 비반환 함수 안에서는 오류를 던진다든가. 중대한 시스템 오류를 보고하는 등의 일을 하고 프로세스를 종료해 버리기 때문이다. 비반환 함수는 어디서든 호출이 가능하고 guard 구문의 else 블록에서도 호출할 수 있다. 비반환 메소드는 재정의 할 수 있지만 비반환 타입이라는 것은 변경할 수 없다.
 
 비반환 함수(메소드)는 반환 타입을 Never라고 명시해주면 된다.
 */
func crashAndBurn() -> Never {
    fatalError("SomeThing very, very bad happened")
}

crashAndBurn();

func someFunction(isAllIsWell: Bool){
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다.")
        crashAndBurn();
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
someFunction(isAllIsWell: false)

/**
 Never 타입이 스위프트 표준 라이브러리에서 사용되는 대표적인 예로 fatalError 함수가 있다. Never 타입이 스위프트 표준 라이브러리에서 사용되는 대표적인 예로는 fatalError 함수가 있다.
 
 
    > 반환 값을 무시할 수 있는 함수
 가끔 함수의 반환 값이 필요하지 않은 경우도 있다. 프로그래머가 의도적으로 함수의 반환 값을 사용하지 않을 경우 컴파일러가 함수의 결과 값ㄷ을 사용하지 않았다는 경고를 보낼 때도 있다. 이런 경우 함수의 반환 값을 무시해도 된다는 @discardableResult 선언 속성을 사용하면 된다.
*/

func say(_ something: String) -> String {
    print(something)
    return something;
}

@discardableResult
func discarableResult(_ something: String) -> {
    print(something)
    return something;
}

say("hello")
discarableResult("hello")
/**
    @discarableResult 선언 속성은 스위프트 표준 라이브러리 메소드에서도 종종 사용한다. 어떤 상황에 해당 속성을 사용하는지 라브러리에 구현된 함수나 메소드를 살펴보면 많은 힌트를 얻을 것이다.
 */
