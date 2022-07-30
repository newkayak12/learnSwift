/**
            > 모나드
 {
     범주론에서 다루는 범주(category)는 쉽게 말하면 아주 간단한 몇몇 조건을 만족시키는 대상(object)과 그 대상들 사이의 관계를 나타내는 사상(morphism)의 모음인데, 이 대상과 사상은 그 조건만 만족시키면 말 그대로 무엇이든 가능해서, 대상은 굳이 어떠한 집합일 필요가 없고 사상도 굳이 어떠한 함수일 필요도 없다. 물론 이렇게 정의된 범주들 사이의 대응관계도 생각해볼 수 있는데, 두 범주를 대응시키는 사상을 '함자(functor)'라고 한다. 물론 이 범주들과 함자들을 또 하나의 범주로 보고(...) 범주의 범주를 정의할 수도 있다.
 }
 
 
 모나드라는 용어는 수학의 범주론에서부터 시작한다. 함수형 프로그래밍에서 모나드는 순서가 있는 연산을 처리할 때 자주 활용하는 디자인 패턴이기도 하다. 사용하는 곳에 따라 수학의 범주론에서 말하는 모나드인지 특정 디자인 패턴을 따르는 모나드인지는 다르다.
 프로그래밍에서 사용하는 모나드는 범주론의 모나드의 의미를 완벽히 구현하려고 하지 않기 때문에 범주론의 모나드 개념을 차용한 정도의 의미를 갖는다 그래서 모나드의 성질을 완벽히 갖추지 못했지만 대부분의 성질을 갖추었다고 하여 프로그래밍에서의 모나드를 모나딕(Monadic)이라고 표현한다. 혹은 모나드의 성질을 갖는 타입이나 함수를 모나딕 타비 혹은 모나딕 함수 등으로 표현한다.
 
    *** 범주론 : 수학 전반에서 등장하는 각종 수학적 구조와 그들 간의 관계를 메타 개념으로 생각하여, 그들을 범주(category)라는 추상적인 개념으로 묶어서 다루는 이론.

 프로그래밍에서 모나드가 갖춰야 하는 조건은 아래와 같다.
 
    > 타입을 인자로 받는 타입 (특정 타입의 값을 포장)
    > 특정 타입의 값을 포장한 것은 반환하는 함수(메소드)가 존재
    > 포장된 값을 변환하여 같은 형태로 포장하는 함수(메소드)가 존재
 
 '타입을 인자로 받는다'는 스위프트에서 제네릭으로 구현이 가능하다. 모나드(Monad)를 이해하는 출발점은 값을 어딘가 포장하는 개념을 이해하는 것에서 출발한다. 스위프트에서 모나드를 사용한 예 중 하나가 바로 옵셔널이다. 옵셔널은 값이 있을지 없을지 모르는 상태를 포장하는 것이다. 함수객체(Functor)와 모나드는 특정 기능이 아닌 디자인 패턴 혹은 자료구조라고 할 수 있다. 모나드를 이해하기 앞서서 이해해야할 개념이 있다. 옵셔널을 하나하나 파헤쳐보면서 순서에 따라 알아가보자
 
 
 
    
    1. 컨텍스트
 
    {
        A little spoiler: Optional is a functor and even a monad.
    }
 컨텍스트(Context) 사전적 정의를 보면 '맥락', '전후 사정' 등이다. 이번 파트에서 컨텍스트는 '콘텐츠를 담은 그 무엇인가'를 뜻한다. 일단 컨텍스트를 알아보기 전에 옵셔널을 다시 한 번 되새겨 보면, 옵셔널은 열거형으로 구현되어 있어서 열거형 case의 연관값을 통해 인스턴스 안에 연관 값을 갖는 형태이다. 옵셔널에 값이 없다면 .none case로, 값이 있다면 .some(value) case로 값을 지니게 된다. 옵셔널의 값을 추출한다는 것은 열거형 인스턴스 내부의 .some(value) case의 연관 값을 꺼내오는 것과 같다.
 
 예시로 2라는 숫자를 옵셔널로 둘러싸면, 컨텍스트 안에 2라는 콘텐츠가 들어가 있는 모양새가 된다. 그리고 '컨텍스트는 2라는 값을 가지고 있다.'라고 말할 수 있다. 만약 값이 없는 옵셔널 상태라면 '컨텍스트는 존재하지만 내부에 값이 없다'고 할 수 있다. 이처럼 값(콘텐츠)과 컨텍스트의 관계를 이해하는 것이 중요하다.
 
 Optional은 Wrapped타입을 인자로 받는 (제네릭) 타입이다. 즉, 앞서 살펴본 모나드의 조건 중 첫 번째 조건을 만족하는 타입이다. 그리고 Optional 타입은 Optional<Int>.init(2)처럼 다른 타입(Int)의 값을 갖는 상태의 컨텍스트를 생성할 수 있으므로 모나드의 조건 중 두 번째 조건을 만족한다. 세 번째 항목은 어떠한가?
 
 */
//addThree 함수
func addThree( _ num: Int) -> Int{
    return num + 3
}
/**
 addThree(_:) 함수의 전달인자로 컨텍스트에 들어있지 않은 순수 값인 2를 전달하면 정상적으로 함수를 실행할 수 있다. addThree(_:) 함수는 매개변수로 일반 Int 타입의 값을 받기 떄문이다.
 그러나 옵셔널을 전달인자로 사용하려고 한다면 오류가 발생한다. 순수한 값이 아닌 옵셔널이라는 컨텍스트로 둘러싸여 전달됐기 때문이다.
 
 addThree(Optional(2)) // Error!
 
 
    2. 함수 객체
    {
        In a nutshell: functor is a type, that implements map function. Like Optional, Collection and Result types in Swift.
                      A functor applies a function to a value wrapped in a context.
    }
    
 맵은 컨테이너(컨테이너는 다른 타입의 값을 담을 수 있으므로 컨텍스트의 역할을 수행할 수 있다.)의 값을 변형시킬 수 있는 고차함수이다. 그리고 옵셔널은 컨테이너와 값을 갖기 때문에 맴 함수를 사용할 수 있다.
 */
let num: Int? = Optional(2).map(addThree)
print(num)
// 함수 없이 클로저를 사용할 수도 있다.
var value: Int? = 2
value.map{ $0 + 3 }
value = nil
value.map { $0 + 3 } // nil(Optional<Int>.none)
/**
 왜 맵이 나왔나면 함수객체(Functor)란 맵을 적용할 수 있는 컨테이너 타입이라고 말할 수 있기 때문이다.우리가 앞서 맵을 사용했던 Array, Dictionary, Set 등등 스위프트의 많은 컬렉션 타입이 함수 객체이다. 즉, 세 번쨰 항목인 '포장된 값을 변환하여 같은 형태로 포장하는 함수(메소드)가 존재'에 부합한다.
 
    //Optional의 map 메소드 구현
 extension Optional {
    func map<U>( f: (Wrapped) -> U ) -> U? {
        switch self {
            case .some(let x): return f(x)
            case .none: return .none
        }
    }
 }
 
 옵셔널의 map(_:) 메소드를 호출하면 옵셔널 스스로 값이 있는지 없는지 switch 구문으로 판단한다. 값이 있다면 전달받은 함수에 자신의 값을 적용한 결과값을 다시 컨텍스트에 넣어 반환하고, 그렇지 않다면 함수를 실행하지 않고 빈 컨텍스트를 반환한다.
 
 
    3. 모나드 (A monad is any data type that can be mapped over using map() and flat mapped over using flatMap())
 함수 객체 중에서 자신의 컨텍스트와 같은 컨텍스트의 형태로 매핑할 수 있는 함수 객체를 닫힌 함수 객체(Endofunctor)라고 한다. 모나드(Monad)는 닫힌 함수 객체이다. 함수 객체는 포장된 값에 함수를 적용할 수 있었다. 그래서 모나드도 컨텍스트에 포장된 값을 처리하여 포장된 값을 컨텍스트에 다시 반환하는 함수(맵)를 적용할 수 있다. 이 매핑의 결과가 함수 객체와 같은 컨텍스트를 반환하는 함수 객체를 모나드라고 할 수 있으며, 이런 매핑을 수행하도록 플랫맵(flatMap)이라는 메소드를 활용한다.
 
 플랫맵은 맵과 같이 함수를 매개변수로 받고, 돕셔널은 모나드이므로 플랫맵을 사용할 수 있다. 예시로 살펴보자 짝수면 2를 곱해서 반환하고 짝수가 아니면 nil을 반환하는 함수 doubleEven(_:)이 있다. Optional(3)의 플랫맵에 이 함수를 전달하면 어떻게 될까?
 
 */
func doubleEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubleEven)
// nil (==Optional<Int>.none)
/**
  만약 Optional.none.flatMap(doubleEven)와 같이 빈 컨텍스트에서 플랫맵을 사용하면 어떻게 될까? 결과적으로 빈 컨텍스트를 반환한다. 이렇게 보면 map과 무슨 차이인가 싶을 수도 있다. 하지만 flatMap은 map과 다르게 컨텍스트 내부의 컨텍스트를 모두 같은 위상으로 펼쳐준다. 즉 포장된 값 내부의 포장된 값을 풀어서 같은 위상으로 펼쳐준다는 뜻이다.
 
  위의 예시에서 Optional 타입에 사용하였던 flatMap 메소드를 Sequence 타입이 Opttional 타입의 Element를 포장한 경우에 compactMap이라는 이름으로 사용한다. 이 경우를 제외한 다른 경우에는 그대로 flatMap을 사용한다. 다만 좀 더 분명한 뜻을 나타내기 위해서 compactMap이라는 이름을 사용한다.
 */

//map, compactMap
let optionals: [Int?] = [1,2,nil,5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)
print(compactMapped)

/**
    optionals는 이중 컨테이너 형태를 가지고 있다. optionals는 Array라는 컨테이너의 내부에 Optional이라는 형태의 컨테이너들이 여러개 들어가 있는 형태이다. 이 배열의 맵 메소드와 플랫맵 메소드를 각각 호출해 본다면 다른 결과를 볼 수 있다. 맵 메소드를 사용한 결과는 Array 컨테이너 내부의 값 타입이나 형태가 어찌 되었든, Array 내부에 값이 있으면 그 값을 그저 클로저의 코드에서만 실행하고 결과를 다시 Array 컨테이너에 담기만 한다. 그러나 플랫맵을 통해 클로저를 실행하면 알아서 내부 컨테이너까지 값을 추출한다. 그렇기 때문에 mapped는 다시 [Int?]가 되며 compactMapped는 [Int] 타입이 된다.
 */
//중첩된 컨테이너에서 맵과 플랫맵(콤팩트맵)의 차이
let multipleContainer = [[1,2, Optional.none], [3, Optional.none], [4,5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 }}

print(mappedMultipleContainer)
print(flatmappedMultipleContainer)
