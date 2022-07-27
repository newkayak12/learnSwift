import Foundation
/**
    클로저
 스위프트에서 함수형 프로그래밍 패러다임을 접할 때 꼭 알아야하는 개념이 클로저(closure)이다. 클로저를 잘 이해해야 스위프트 함수형 프로그래밍 패러다임 스타일을 조금 더 명확하게 이해할 수 있다. 클로저와 제네릭(Generics), 프로토콜(Protocol), 모나드(Monad) 등이 결합해서 스위프트는 훨씬 강력한 언어가 되었다.
 
 스위프트의 클로저는 C언어나 Objective-C의 블록(block) 또는 다른 프로그래밍언어의 람다(Lambda)와 유사하다. 클로저는 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것을 말한다. 어딘가 함수와 비슷해보이는데 사실 함수는 클로저의 한 형태이다.
 
 클로저는 변수나 상수가 선언된 위치에서 참조(Reference)를 획득(Capture)하고 저장할 수 있다. 이를 변수나 상수의 클로징(잠금)이라고 하며 클로저는 여기서 착안된 이름이다. 획득 때문에 메모리에 무리가 가지 않을까 하지만 스위프트는 알아서 메모리를 관리한다.
 
 클로저의 몇 가지 모양 중 하나가 함수이다. 조금 더 자세히 보면 세 가지 형태가 있다.
 
    1. 이름이 있으면서 어떤 값도 획득하지 않는 전역함수 형태
    2. 이름이 있으면서 다른 함수의 내부의 값을 획득할 수 있는 중첩된 함수 형태
    3. 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법 형태
 
 클로저 문법 전, 클로저의 장점을 나열하면
 
    1. 클로저는 매개변수와 반환 값의 타입을 문맥을 통해 유추할 수 있기 때문에 매개변수와 반환 값의 타입을 생략할 수 있다.
    2. 클로저에서 단 한 줄의 표현만 들어있다면 암시적으로 이를 반환 값으로 취급한다.
    3. 축약된 전달인자 이름을 사용할 수 있다.
    4. 후행 클로저 문법을 사용할 수 있다.
 
 이전의 '중첩함수'는 함수 안에 함수가 포함된 하나의 클로저 형식이었다. 그런데 함수를 중첩하여 사용하기보다는 조금 더 간단한 형태로 함수처럼 사용하고 싶을 수 있고 또는 함수 내부에서 다른 함수를 사용할 때 내부 함수에 이름을 붙일 필요가 없을 수도 있다. 이런 여러 가지 경우에 함수 또는 메소드의 전달인자로 함수를 받아오면 된다.
 클로저 표현 방법은 클로저가 함수의 모습이 아닌 하나의 블록의 모습으로 표현될 수 있는 방법을 의미한다. 클로저 표현 방법은 클로저의 위치를 기준으로 크게 기본 클로저 표현과 후행 클로저 표현이 있다. 또, 각 표현 내에서 가독성을 해치지 않는 선에서 표현을 생략하거나 축약할 수도 있다.
 
 
 
 
        1. 기본 클로저
 스위프트 표준 라이브러리에는 배열의 값을 정렬하기 위해서 sorted(by:) 메소드가 있다. 이 메소드는 클로저를 통해서 어떻게 정렬할 것인가에 대한 정보를 받아 처리하고 결과 값을 배열로 돌려준다. 단순히 정렬만 하기 때문에 입력받은 배열의 타입과 크기가 동일하다. 기존의 배열을 변경하지 않고 정렬된 배열을 새로 생성하여 반환해준다.
 
 --
    public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
 --
 */
let names: [String] = ["YJ", "SH", "WS", "TH"]
/**
    sorted(by:) 메소드는(배열의 타입과 같은 두 개의 매개변수를 가지며, Bool 타입을 반환하는) 클로저를 전달인자로 받을 수 있다. 반환하는 Bool 값은 첫 번쨰 전달인자 값이 새로 생성되는 배열에서 두 번째 전달인자 값보다 먼저 배치 되어야하는가에 대한 결과 값이다. true이면 첫 번쨰 전달인자가 두 번쨰 전달인자 앞에 온다.
 
    우선은 우리가 익숙한대로 String 두 개를 가지며, Bool을 반환하는 함수를 구현해보자 그 후 이를 sorted(by:)의 전달인자로 전달하여 reversed라는 이름의 배열로 반환 받는다.
 */
func backwards(first: String, second: String) -> Bool {
    print("\(first), \(second)")
    return first > second
}
let reversed: [String] = names.sorted(by: backwards)
print(reversed)

/**
    만약 first 문자열이 second 문자열보다 크다면 backwards(first:second:) 함수의 반환 값은 true가 된다. 즉, 값이 더 큰 first 문자열이 second 문자열보다 앞쪽에 정렬되어야한다는 것이다. 그러나 first > second라는 반환 값을 받기 위해 너무 많은 표현이 사용되었따. 함수 이름부터 매개변수 표현까지 부가적인 표현도 많다. 이를 클로저로 더 간결하게 표현해보자
 
    {
        ( 매개 변수들 ) -> 반환 타입 in
 
            실행 코드
    }
 
    클로저도 함수와 마찬가지로 입출력 매개변수를 사용할 수 있다. 매개변수 이름을 지정한다면 가변 매개변수 또한 사용 가능하다. 다만 클로저는 매개변수 기본값을 사용할 수 없다.
 */
let reversed2: [String] = names.sorted(by: { (first:String, second: String)-> Bool in return first > second})
print(reversed2)

/**
    이렇게 프로그래밍하면 sorted(by:) 메소드로 전달하는 backward(first:second:) 함수가 어디에 있는지, 어떻게 구현되어 있는지 찾아다니지 않아도 된다.
 
    
 
        2. 후행 클로저
    위 코드보다 조금더 클로저를 일기 쉽게 바꿔볼 수 있다. 함수나 메소드의 마지막 전달인자로 위치하는 클로저는 함수나 메소드 소괄호를 닫은 후 작성해도 된다. 클로저가 조금 길어진다거나 가독성이 떨어지면 후행 클로저(trailing closure) 기능을 사용하면 좋다. Xcode에서 자동완성 기능을 사용하면 자동으로 후행 클로저로 유도한다.
 
    단, 후행 클로저는 맨 마지막 전달인자로 전달되는 클로저에만 해당되므로 전달인자로 클로저 여러 개를 전달할 때는 맨 마지막 클로저만 후행 클로저로 사용할 수 있다. 또한 sorted(by:) 메소드처럼 단 하나의 클로저만 전달인자로 전달하는 경우에는 소괄호를 생략할 수 있다.
 */

let reversed3: [String] = names.sorted(){(first: String, second: String) -> Bool in return first > second}

print(reversed3)
// 메소드의 소괄호까지 생략 가능하다.
let reversed4: [String] = names.sorted{(first: String, second: String) -> Bool
    in return first > second
}
print(reversed4)

/**
    
        3. 클로저 표현 간소화
    3.1. 문맥을 이용한 타입 유추
 메소드의 전달인자로 전달하는 클로저는 메소드에서 요구하는 형태로 전달해야한다. 즉, 매개변수의 타입이나 개수, 반환 타입 등이 같아야 전달인자로서 전달할 수 있다. 이를 다르게 말하면, 전달인자로 전달할 클로저는 이미 적합한 타입을 준수하고 있다고 유추할 수 있다. 문맥에 따라 적절히 타입을 유추할 수 있는 것이다. 그래서 전달인자로 전달하는 클로저를 구현할 떄는 매개변수의 타입이나 반환 값의 타입을 굳이 표현해주지 않고 생략하더라도 문제가 없다.
 */
let reserved5: [String] = names.sorted{(first, second) in return first > second}
print(reserved5)
/**
    3.2. 단축인자 이름
 계속해서 위의 예시를 보면 거슬리는 부분이 의미없는 first, second라는 매개변수 이름이다. 스위프트는 $0, $1, $2와 같이 매개변수 순서에 따라 $와 숫자의 조합으로 전달인자를 표현할 수 있다. 또한 단축인자 표현을 사용하게 되면 매개변수 및 반환 타입과 실행 코드를 구분하기 위해 사용했던 'in' 키워드를 사용할 필요가 없다.
 */
let reserved6: [String] = names.sorted {
    return $0 > $1
}
print(reserved6)

/**
    3.3. 암시적 반환 표현
 위의 클로저에서 return 키워드 마저 생략이 가능하다. 만약 클로저가 반환 값을 갖는 클로저이고 내부의 실행문이 단 한 줄이라면, 암시적으로 그 실행문을 반환 값으로 사용할 수 있다.
 */
let reserved7: [String] = names.sorted { $0 > $1}
print(reserved7)

/**
    3.4. 연산자 함수
 비교 연산자는 두 개의 피연산자를 통해 Bool 타입의 반환을 준다. 우리가 sorted(by:) 메소드에 전달한 클로저와 동일한 조건이다. 클로저는 매개변수의 타입과 반환 타입이 연산자를 구현한 함수의 모양과 동일하다면 연산자만 표기하더라도 알아서 연산하고 반환한다. 연산자가 일종의 함수이기 때문이다.
 
    //연산자 정의
 public func > <T: Comparable> (lhs: T, rhs: T) -> Bool
 여기서 '>' 자체가 함수 이름이다. 이를 클로저에 적용하면
 */
let reserved8: [String] = names.sorted(by: >)
print(reserved8)

/**
    4. 값 획득 ***
 클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 획득(capture)할 수 있다. 값 획득을 통해 클로저는 주변에 정의한 상수나 변수가 더 이상 존재하지 않더라도 해당 상수나 변수의 값을 자신 내부에서 참조하거나 수정할 수 있다. 이런 케이스는 클로저를 비동기 작업에 사용할 때 흔히 볼 수 있다. 클로저를 통해서 비동기 콜백을 작성하는 경우, 현재 상태를 미리 획득해두지 않으면, 실제로 클로저의 기능을 실행하는 순간에는 주변의 상수, 변수가 이미 메모리에 존재하지 않는 경우가 발생하기 때문이다.
 
 중첩 함수도 하나의 클로저 형태이다. 중첩 함수 역시  주변의 상수, 변수를 획득해 놓을 수 있다. 즉, 자신을 포함하는 함수의 지역변수나 지역 상수를 획득할 수 있다는 것이다.

 
 예시 코드를 작성해볼 것이다. incrementer라는 함수를 중첩 함수로 포함하는 makeIncrementer 함수를 구현해볼 것인데 중첩 함수인 incrementer 함수는 자신 주변에 있는 runningTotal과 amount라는 두 값을 획득한다. 두 값을 획득한 후 incrementer는 클로저로서 makeIncrementer 함수에 의해 반환된다.
 */
func makeIncrementer (forIncrementer amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}
/**
 makeIncrementer 함수의 반환 타입은 ()->Int이다. 이는 함수 객체를 반환한다는 의미이다. 반환하는 함수는 매개 변수를 받지 않고 반환 타입은 Int인 함수로, 호출할 때 마다 Int 타입의 값을 반환해준다. incrementer가 반환하게 될 값을 저장하는 용도로 runningTotal을 정의했고, 0으로 초기화해두었다. 그리고 forIncrement라는 전달인자 레이블과 amount라는 매개변수 이름이 있는 Int 타입 매개변수 하나가 있다. incrementer() 함수가 호출될 때마다 amount의 값만금 runningTotal이 증가한다.
 
 또한 값을 증가시키는 역할을 하는 incrementer라는 이름의 중첩 함수를 정의했다. 이 incrementer()함수는 amount의 값을 runningTotal에 더하여 결과값을 반환한다.
 
 위의 예시에서 incrementer를 makeIncrementer 외부로 떨어뜨려 놓으면 동작할 수 없는 이상한 상태가 된다. incrementer()는 어떠한 매개변수도 갖지 않으며, runningTotal이라는 변수가 어디에 있는지 찾을 수도 없기 떄문이다.
 
 그러나 위의 예시처럼 incrementer 주변에 runningAmount, amount 등의 변수가 있다면 incrementer()함수는 이 변수들의 참조를 획득할 수 있다. 참조를 획득하면 makeIncrementer 함수가 실행이 끝나더라도 사라지지 않는다. 게다가 incrementer가 호출될 때마다 계속해서 사용할 수 있다.
 
 아래의 예시는 makeIncrementer(forIncrement:) 함수를 사용하여 incrementByTwo라는 이름의 상수에 increment 함수를 할당했다. incrementByTwo를 호출할 때마다 runningTotal이 2씩 증가하는 형태이다.
 */
let incrementByTwo: (()-> Int) = makeIncrementer(forIncrementer: 2)

let first: Int = incrementByTwo()
print(first)
let second: Int = incrementByTwo()
print(second)
let third: Int = incrementByTwo()
print(third)

/**
 incrementer를 하나 더 생성하면 위와는 별개로 다른 참조를 갖는 runningTotal을 확인할 수 있다.
 */
let incrementByTen: (()-> Int) = makeIncrementer(forIncrementer: 10)

let first10: Int = incrementByTen()
print(first10)
let second10: Int = incrementByTen()
print( second10)
let third10: Int = incrementByTen()
print(third10)
/**
  이와 같이 incrementer 함수는 언제 호출되더라도 자신만의 runningTotal을 갖고, 카운트를 하게 된다. 다른 함수의 영향도 전혀 받지 않는다.
    {
            클래스 인스턴스 프로퍼티로서의 클로저
        클래스 인스턴스의 프로퍼티로 클로저를 할당한다면 클로저는 해당 인스턴스 또는 인스턴스의 멤버의 참조를 획득할 수 있으나, 클로저와 인스턴스 사이에 강한 참조 순환 문제가 발생할 수 있다. 강한 참조 순환 문제는 획득 목록을 통해 없앨 수 있다.
    }
 
 
 
    5. 클로저는 참조 타입
 값 획득 부분의 예제에서 incrementByTwo와 incrementByTen은 모두 상수이다. 이 두 상수 클로저는 값 획득을 통해 runningTotal 변수를 계속해서 증가시킬 수 있다. 왜냐하면 함수와 클로저는 참조 타입이기 때문이다.
 함수나 클로저를 상수나 변수에 할당할 때마다 사실은 상수나 변수에 함수나 클로저의 참조를 설정하는 것이다. 즉, incrementByTwo라는 상수에 클로저를 할당한다는 것은 클로저의 내용묵, 즉 값을 할당하는 것이 아니라 해당 클로저의 참조를 할당하는 것이다. 결국 클로저의 참조를 다른 상수에 할당해준다면 이는 두 상수가 모두 같은 클로저를 가리킨다는 뜻이 된다.
 
    6. 탈출 클로저
 함수의 전달인자로 전달한 클로저가 함수 종료 후에 호출될 때 클로저가 함수를 탈출(escape)한다고 표현한다. 클로저를 매개변수로 갖는 함수를 선언할 때 매개변수 이름의 콜론(:) 뒤에 @escaping 키워드를 사용하여 클로저가 탈출하는 것을 허용한다고 명시해줄 수 있다.
 
 예를 들어 비동기 작업을 실행하는 함수들은 클로저를 컴플리션 핸들러(Completion handler) 전달인자로 받아온다. 비동기 작업으로 함수가 종료되고 난 후 호출할 필요가 있는 클로저를 사용해야할 때 탈출 클로저(Escaping Closure)가 필요하다.
 
 그런데 위의 sorted(by:) 메소드를 비롯해서 계속 살펴봤던 함수에는 @escaping 키워드를 찾아볼 수 없다. 정렬할 요소를 비교 연산하기 위해 전달인자로 전달하는 클로저는 비탈출 클로저(Non-escaping closeure)이기 때문이다. @escaping 키워드를 따로 명시하지 않는다면 매개변수로 사용되는 클로저는 기본적으로 비탈출 클로저이다. 함수로 전달된 클로저가 함수의 동작이 끝난 후 사용할 필요가 없을 때 비탈출 클로저를 사용한다.
 
 클로저가 함수를 탈출할 수 있는 경우 중 하나는 함수 외부의 정의된 변수나 상수에 저장되어 함수가 종료된 후에 사용할 경우이다. 예를 들어 비동기로 작업을 하기 위해서 컴플리션 핸들러를 전달인자를 이용해 클로저 형태로 받는 함수들이 많다. 함수가 작업을 종료하고 난 이후 (즉, 함수의 return 후)에 컴플리션 핸들러, 즉 클로저를 호출하기 때문에 클로저는 함수를 탈출해 있어야만 한다. 함수의 전달인자로 전달받은 클로저를 다시 반환(return)할 때도 마찬가지이다.
 */
//탈출 클로저를 매개변수로 갖는 함수
var completionHandlers: [()->Void] = []
func someFunctionWithEscapingClosure(completionHander: @escaping () -> Void) {
    completionHandlers.append(completionHander)
}

//함수를 탈출하는 클로저의 예시
typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("CLOSURE - A")
}
let secondClosure: VoidVoidClosure = {
    print("CLOSURE - B")
}

// first, second 매개변수 클로저는 함수의 반환값으로 사용될 수 있으므로 탈출 클로저이다.
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    return shouldReturnFirstClosure ? first:second
}

//함수에서 반환한 클로저가 함수 외부의 상수에 저장
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [VoidVoidClosure] = []

//closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저이다.
func appendClosure(closure: @escaping VoidVoidClosure){
    //전달인자로 전달 받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출한다.
    closures.append(closure)
}

/**
 위 예시에서 두 함수의 전달인자로 전달하는 클로저 앞에 @escaping 키워드를 사용하여 탈출 클로저임을 명시해야한다. 이 코드는 클로저 모두가 탈출할 수 있는 조건이 명확하기 때문에 @escaping 키워드를 사용하여 탈출 클로저임을 명시하지 않으면 컴파일 에러가 난다. 아래 코드는 함수 외부로 다시 전달되어 외부에서 사용이 가능하다든가, 외부 변수에 저장되는 등 클로저의 탈출 조건을 모두 갖추고 있다.
 타입 내부 메소드의 매개변수 클로저에 @escaping 키워드를 사용해서 탈출 클로저임을 며시한 경우, 클로저 내부에서 해당 타입의 프로퍼티나 메소드, 서브 스크립트 드엥 접근하려면 self 키워드를 명시적으로 사용해야한다. 비탈출 클로저는 클로저내부에서 타입 내부의 프로퍼티나 메소드, 서브스크립트 등에 접근할 때 self 키워드를 꼭 명시하지 않아도 된다.
 */

func functionWithNonEscapingClosure(closure: VoidVoidClosure){
    closure()
}
func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure{
    return completionHandler
}

class SomeClass{
    var x = 10
    func runNoEscapeClosure(){
        //비탈출 클로저에서 self는 선택
        functionWithNonEscapingClosure { x = 200 }
    }
    func runEscapingClosure() -> VoidVoidClosure{
        return functionWithEscapingClosure {
            self.x = 100
        }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoEscapeClosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)
/**
 비탈출 클로저에서는 인스턴스의 프로퍼티인 x를 사용하기 위해 self 키워드를 생략해도 무관했지만, 탈출하는 클로저에서는 값 획득을 하기 위해 self 키워드를 사용해서 프로퍼티에 접근해야한다. 
 */
