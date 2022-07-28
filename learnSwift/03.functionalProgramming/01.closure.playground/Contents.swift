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
func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
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

let returnedClosure2: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure2()
print(instance.x)
/**
 비탈출 클로저에서는 인스턴스의 프로퍼티인 x를 사용하기 위해 self 키워드를 생략해도 무관했지만, 탈출하는 클로저에서는 값 획득을 하기 위해 self 키워드를 사용해서 프로퍼티에 접근해야한다.
 
 
 
 
 
    6.1 withoutActuallyEscaping
 
 
 비탈출 클로저나 탈출 클로저와 관련된 여러 가지 상황 중 한 가지 애매한 경우가 있다. 비탈출 클로저로 전달한 클로저가 탈출 클로저인 척 해야하는 경우이다.
 실제로는 탈출하지 않는데 다른 함수에서 탈출 클로저를 요구하는 상황에 해당한다. 아래에서 구현한 함수 hasElements(in: match:)는 in 매개변수로 검사할 배열을 전달받으며, match라는 매개변수로 검사를 실행할 클로저를 받아들인다.
 
 hasElements(in: match:) 함수는 @escaping 키워드가 없으므로 비탈출 클로저를 전달받게 된다. 그리고 내부에서 배열의 lazy 컬렉션에 있는 filter 메소드의 매개변수로 비탈출 클로저를 전달한다. 그런데 lazy 컬렉션은 비동기 작업을 할 때 사용하기 때문에 filter 메소드가 요구하는 클로저는 탈출 클로저이다. 그래서 탈출 클로저 자리에 비탈출 클로저를 전달할 수 없다는 오류와 마주하게 된다.
 
 
 func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
     return (array.lazy.filter { predicate($0) }.isEmpty == false)
 }
 
 그런데 함수전체를 보면, match 클로저를 탈출할 필요가 없다. 이때 해당 클로저를 탈출 클로저인양 사용할 수 있게 돕는 withoutActuallyEscaping(_: do:)함수가 있다.
 */
let numbers: [Int] = [2, 4, 6, 8]
let evenNumberPredicate = { (number: Int) -> Bool in return number % 2 == 0}
let oddNumberPredicate = { (number: Int) -> Bool in return number % 2 == 1}

func hasElemnts(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElemnts(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElemnts(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)


/**
        7. 자동 클로저
 함수의 전달인자로 전달하는 표현을 자동으로 변환해주는 클로저를 자동 클로저(Auto Closure)라고 한다. 자동 클로저는 전달인자를 갖지 않는다. 자동 클로저는 호출되었을 때 자신이 감싸고 있는 코드의 결과값을 반환한다. 자동 클로저는 함수로 전달하는 클로저를 (소괄호와 중괄호를 겹쳐 써야하는) 어려운 클로저 문법을 사용하지 않고도 클로저로 사용할 수 있도록 문법적 편의를 제공한다.
 
 스위프트 표준 라이브러리에는 자동 클로저를 호출하는 함수가 구현되어 있어 이를 사용하는 일이 종종있다. 하지만 직접 자동 클로저를 호출하는 함수를 구현하는 일은 흔치 않을 것이다. 예를 들어 스위프트 표준 라이브러리에 구현되어 있는 assert(condition: message: file: line:) 함수는 condition과 message 매개변수가 자동 클로저이다. condition 매개변수는 디버그용 빌드에서만 실행되고, message 매개변수는 condition 매개변수가 false일 때만 실행된다.
 
 자동 클로저는 클로저가 호출되기 전까지 클로저 내부의 코드가 동작하지 않는다. 따라서 연산을 지연시킬 수 있다. 이 과정은 연산에 자원을 많이 소모한다거나 부작용이 우려될 때 유용하게 사용할 수 있다. 왜냐하면 코드의 실행을 제어하기 좋기 때문이다.
 */
var customersInLine: [String] = ["BG", "DK", "HM", "LS"]
print(customersInLine.count)

//클로저를 만들어두면 클로저 내부의 코드를 미리 실행하지 않고 가지고만 있다.
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}

print(customersInLine.count)

//실제로 실행한다.
print("now serving \(customerProvider())!")
print(customersInLine.count)
/**
    위에서 customerProvider 상수에 저장해둔 클로저는 하나의 명령문 묶음으로 볼 수 있다. Array의 removeFirst() 메소드는 자신의 첫 번쨰 요소를 제거하면서 그 요소를 반환해주는 메소드이다. 그래서 customerProvider()를 선언했지만 바로 아래서 호출한 print(customerInLine.count)에서는 클로저 내부의 연산이 반영되지 않으며, 클로저가 실제로 실행되기 전까지 removeFirst() 메소드의 연산을 실행하지도 않는다. 그 뒤에 실제로 클로저를 실행하게 되면 그때서야 연산을 실행하게 된다. 클로저가 영영 호출되지 않는다면 내부의 코드도 실행되지 않기 때문에 해당 연산은 실행되지 않는다.
 */
//함수의 전달인자로 전달하는 클로저
var customerInLine: [String] = ["AA","BB","CC","DD","EE"]
func serveCustomer(_ customProvider: () -> String){
    print("NOW SERVING \(customProvider())")
}

serveCustomer({ customerInLine.removeFirst() })

/**
    우리가 이제껏 봐왔던 모양과 다르지 않다. 함수의 전달인자로 직접 클로저를 작성하여 전달해줬다. 코드 serveCusomer(_:) 함수는 클로저를 매개변수로 전달받고 있다.
 
    {
            암시적 반환 표현
        위 예시에서는 클로저 내부에서 return을 사용하지 않아도 암시적으로 반환된다.
    }
 
    위 예시를 아래와 같이 자동 클로저로 표현할 수 있다.
 */
func autoServeCustomer(_ cusomterProvider: @autoclosure () -> String){ print("Now Serving \(cusomterProvider())")}
autoServeCustomer(customerInLine.removeFirst()) //Now Serving BB
/**
    위 예시는 기존의 serveCustomer(_:) 함수와 동일한 역할을 하지만 매개변수에 @autoClosure속정을 주었기 때문에 자동 클로저 기능을 사용한다. 자동 클로저 속성을 부여한 매개변수는 클로저 대신에 customerInLine.removeFirst() 코드의 실행 결과인 String 타입의 문자열을 전달인자로 받게 된다. String 타입의 값이 자동 클로저 매개변수에 전달되면 String 값을 매개변수가 없는 String 값을 반환하는 클로저로 변환해준다. String 타입의 값을 전달 받는 이유는 자동 클로저의 반환 타입이 String이기 때문이다. 자동 클로저는 전달인자를 갖지 않기 떄문에 반환 타입의 값이 자동 클로저의 매개변수로 전달되면 이를 클로저로 바꿔줄 것이다. 이렇게 String 값으로 전달된 전달인자가 자동으로 클로저로 변환되기 때문에 자동 클로저라고 부른다.
 
    자동 클로저를 사용하면 기존의 사용 방법처럼 클로저를 전달인자로 넘겨줄 수 없다.
 
            * 자동 클로저의 과도한 사용
        자동 클로저의 과도한 사용은 코드를 이해하기 어렵게 만들 가능성이 크므로 정신건강에 매우 해롭다. 만약, 자동 클로저를 사용하고자 한다면 함수 이름 또는 매개변수 이름 등은 자동클로저를 사용한다는 명확한 의미를 전달할 수 있는 이름으로 명명하는 것이 좋다.
 
    기본적으로 @autoclosure 속성은 @noescape 속성을 포함한다. 즉, @autoclosure 속성을 사용하면 @noescape 속성도 부여됨을 암시하는 것이다. 만약 자동 클로저를 탈출하는 클로저로 사용하고 싶다면 @autoclosure 속성 뒤에 @escaping 속성을 덧붙여서 @autoclosure @escaping처럼 사용하면 된다.
 */
var cusotomerInLine2: [String] = ["MJ", "inno", "DB"]
func returnProvier2(_ customerProvider: @autoclosure @escaping () -> String) -> (()-> String){
    return customerProvider
}

let cutomerProvider2: () -> String = returnProvier2(cusotomerInLine2.removeFirst())
print("nowServing \(cutomerProvider2())!")
/**
    위 코드를 살펴보면 탈출 가능한 자동 클로저를 매개변수로 받아서 반환 값으로 반환하는 returnProvider2(_:) 함수가 있다. 이 함수의 전달인자로 전달한 후 클로저로 변환된 코드들이 그대로 클로저의 형태로 반환되는 것을 알 수 있다. 즉, 함수를 탈출하는 클로저가 되는 것이다. 그래서 @autoClosure, @escaping 속성을 사용해야한다.
 
    클로저는 앞서 알아본 것처럼 생략할 수 있는 부분이 많다. 그렇기 때문에 경우의 수만 따져보더라도 정말 다양한 표현의 클로저가 만들어질 수 있다. 타입 유추만 사용할 수도 있고, 암시적 반환 표현만 사용할 수 있으며, 단축인자 이름만 사용할 수도 있고, 이를 모두 사용할 수도 사용하지 않을 수도 있다. 그렇기 때문에 다양한 클로저 표현 방법을 알아두고, 이해할 수 있어야한다.
 
 
 
            14. 옵셔널 체이닝과 빠른 종료
        
    1.옵셔널 체이닝
  옵셔널 체이닝은 옵셔널에 속해 있는 nil일지도 모르는 프로퍼티, 메소드, 서브스크립션 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정이다. 옵셔널에 값이 있다면 프로퍼티, 메소드, 서브스크립트 등을 호출할 수 있고, 옵셔널이 nil이라면 프로퍼티, 메소드, 서브스크립트 등은 nil을 반환한다. 즉, 옵셔널을 반복 사용하여 옵셔널이 자전거 체인처럼 서로 꼬리를 물고 있는 모양이기 때문에 옵셔널 체이닝이라고 부른다 .자전거 체인에서 한 칸이라고 고장나면 전체가 동작하지 않듯, 옵셔널 체이닝도 하나라도 값이 존자하지 않으면 결과적으로 nil을 반환한다.
 
  옵셔널 체이닝은 프로퍼티나 메소드 또는 서브스크립트를 호출하고 싶은 옵셔널 변수나 상수 뒤에 물음표를 붙여서 표현한다. 옵셔널이 nil이 아니라면 정상적으로 호출될 것이고, nil이라면 결과값으로 nil을 반환할 것이다. 결과적으로 nil이 반환될 가능성이 있으므로 옵셔널 체이닝 반환값은 항상 옵셔널이다.
 
    {
            느낌표(!)
        물음표 대신 느낌표(!)를 사용할 수도 있는데 이는 옵셔널을 강제 추출하는 효과가 있다. 만약 강제로 추출하면 런타임 오류가 발생할 수도 있다. 또 다른점은 옵셔널에서 값을 강제 추출 반환하기 때문에 반환 값이 옵셔널이 아니라는 것이다. 100% nil이 아닌 이상 사용하지 않는 것이 좋다.
    }
 */
class Room {
    var number: Int
    init(number: Int){
        self.number = number;
    }
}

class Building{
    var name: String;
    var room: Room?
    
    init(name: String){
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String){
        self.name = name
    }
}

/**
    사람의 정보를 표현하기 위해 Person클래스를 설계했다. Person 클래스는 이름이 있으며, 주소를 옵셔널로 갖는다. 주소 정보는 Address 구조체로 설계했다. 주소에는 시/도, 시/군/구, 도로명이 필수이며, 건물 정보가 있거나 아니면 상세주소를 기재할 수 있도록 옵셔널로 표현했다. 건물 정보는 Building 클래스로 설계했다. 건물은 이름이 있고 호실의 정보를 갖는다.
 */

let personYJ: Person = Person(name: "YJ")
/**
 personYJ가 사는 호실 번호를 알고 싶다. 옵셔널 체이닝과 강제 추출을 사용하여 프로퍼티를 접근해보면 아래와 같다.
 */
var personYjRoomViaOptionalChaining: Int? = personYJ.address?.building?.room?.number //nil
//personYjRoomViaOptionalChaining = personYJ.address!.building!.room!.number //Error
/**
    주소, 건물, 호실 정보가 없다. 그렇기 때문에 옵셔널 체이닝 중 nil이 반환된다. 그렇기에 강제 추출 수 런타임 오류가 발생된다.
    아래의 코드는 옵셔널 바인딩을 사용해서 호실 정보를 가져오는 코드를 표현한 것이다.
 */
var roomNumber: Int? = nil
if let yjAddress: Address = personYJ.address {
    if let yjBuilding: Building = yjAddress.building {
        if let yjRoom: Room = yjBuilding.room {
            roomNumber = yjRoom.number
        }
    }
}

if let number: Int = roomNumber {
    print(number)
} else {
    print("cannot find room number")
}

/**
    위의 예시를 옵셔널 체이닝으로 표현하면 훨씬 간단하다.
 */
let sh: Person = Person(name: "SH")
if let roomNumber: Int = sh.address?.building?.room?.number{
    print(roomNumber)
} else {
    print("cannot find room number")
}
/**
    위의 두 코드는 똑같은 결과를 내놓지만, 코드의 간결함과 분량은 꽤 차이가 크다. 흥미로운 점은 옵셔널 체이닝 코드가 옵셔널 바인딩 기능과 결합했다는 점이다. 옵셔널 체이닝과 결과값은 옵셔널 값이기 때문에 옵셔널 바인딩과 결합할 수 있다는 것이다. 즉, sh.address?.building?.room?.number가 nil이 아닌 것을 확인하는 동시에 roomNumber라는 상수로 받아올 수 있다. 만약 중간 값이 nil이면 다음 체인을 확인하지 않고 nil을 반환한다.
 
    이처럼 옵셔널 체이닝을 통해 한 단계뿐만 아니라 여러 단계로 복잡하게 중첩된 옵셔널 프로퍼티나 메소드 등에 매번 nil 체크를 하지 않아도 손쉽게 접근할 수 있다. 또한 옵셔널 체이닝을 통해 값을 받아오기만 하는 것이 아니라 반대로 값을 할당할 수도 있다.
 */
sh.address?.building?.room?.number = 55
print(sh.address?.building?.room?.number) //nil

/**
    위의 예시는 address도, building도, room도 없다 따라서 옵셔널 체이닝 중 중지된다.
 */

sh.address = Address(province: "서울특별시", city: "성동구", street: "행당동")
sh.address?.building = Building(name: "삼영빌딩")
sh.address?.building?.room = Room(number: 0)
sh.address?.building?.room?.number = 505

print(sh.address?.building?.room?.number) //Optional(505)

/**
    위와 같이 옵셔널 체인에 존재하는 프로퍼티를 실제로 할당해준 후 옵셔널 체이닝을 통해 값이 정상적으로 반환되는 것을 확인할 수 있다.
    옵셔널 체이닝을 통해 메소드와 서브스크립틑 호출도 가능하다. 서브스크립트는 인덱스를 통해 값을 넣고 뺴올 수 있는 기능이다. 먼저, 옵셔널 체이닝을 통한 메소드 호출이다. 호출 방법은 프로퍼티 호출과 동일하다. 만약 메소드의 반환 타입이 옵셔널이라면 이 또한 옵셔널 체인에서 사용 가능하다.
 */
struct Address2 {
    var province: String;
    var city: String;
    var street: String;
    var building: Building?;
    var detailAddress: String?;
    
    init(province: String, city: String, street: String){
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil;
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name;
        } else if let detail = self.detailAddress {
            restAddress = detail;
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province;
            
            fullAddress += " " + self.city;
            fullAddress += " " + self.street;
            fullAddress += " " + rest;
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress(){
            print(address)
        }
    }
}


class Person2 {
    var name: String
    var address: Address2?
    
    init(name: String){
        self.name = name
    }
}

let sh2: Person2 = Person2(name: "SH")
sh2.address = Address2(province: "서울특별시", city: "성동구", street: "행당동")
sh2.address?.building = Building(name: "삼영빌딩")
sh2.address?.building?.room = Room(number: 0)
sh2.address?.building?.room?.number = 505

print(sh2.address?.fullAddress()?.isEmpty)
print(sh2.address?.fullAddress())

/**
    서브스크립트를 가장 많이 사용하는 곳은 Array와 Dictionary이다. 옵셔널의 서브스크립트를 사용하고자 할 때는 대괄호보다 앞쪽에 물음표(?)를 표기해야한다. 이는 서브스크립트 이외에도 언제나 옵셔널 체이닝을 사용할 떄의 규칙이다.
 */
let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray;
optionalDictionary? ["numberArray"]?[2]



/**
        2. 빠른 종료
    빠른 종료(Early Exit)의 행심 키워드는 guard이다. guard 구문은 if 구문과 유사하게 Bool타입의 값으로 동작하는 기능이다. guard 뒤에 따라붙는 코드의 실행 결과 true일 코드가 계속 실행된다. if 구문과는 다르게 guard 구문은 else 구문이 뒤에 따라와야한다. 만약 guard 뒤에 따라오는 Bool 값이 false라면 else 블록 내부 코드를 실행하는데, 이때 else 구문의 블록 내부에는 꼭 자신보다 상위 코드 블록을 종료하는 코드가 들어가게 된다. 그래서 특정 조건에 부합하지 않다는 판단이 되면 재빠르게 코드 블록의 실행을 종료할 수 있다. 이러헥 코드 블록을 종료할 때 return, break, continue, throw등 제어문 전환 명령을 사용한다. 또한 fataError()와 같은 비반환 함수나 메소드를 호출할 수 있다.
 
 
             guard Bool [타입 값] else {
                 예외사항 실행문
                 제어문 전황 명령어
             }
 
    guard 구문을 사용하면 if 코드를 훨씬 간결하고 읽기 좋게 구성할 수 있다. if 구문을 사용하면 예외사항을 else 블록으로 처리해야하지만 예외 사항만 처리하고 싶다면 guard 구문을 사용하는 것이 훨씬 간편하다. 
 */

