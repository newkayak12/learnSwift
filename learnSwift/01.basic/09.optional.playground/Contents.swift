import UIKit
import Foundation

/**
    09. Optional(옵셔널)
 
 옵셔널은 안전성을 문법으로 담보하는 기능이다. C 언어 또는 Objective-C에서는 찾아볼 수 없었던 콘셉트이다. 옵셔널은 단어 뜻 그대로 '선택적인', 즉 값 '있을 수도, 없을 수도 있음을 나타내는 표현이다. 이는 '변수나 상수 등에 꼭 값이 있다는 것을 보장할 수 없다 즉, 변수 또는 상수의 값이 nil일 수도 있다.'는 것을 의미한다. 라이브러리의 API 문서를 작성하거나 읽어본 경우 문서에서 It can be NULL 또는 It can Not be NULL 등의 부연 설명을 본 적이 있을 것이다. 그리고 전달 인자로 NULL이 전달되어도 되는지 문서를 보기 전에는 알 수 없다. 그러나 스위프트에서 옵셔널 하나만으로 이 의미를 충분히 표현할 수 있기 때문에 문법적 표현만으로 모든 의미를 전달할 수 있다. 게다가 옵셔널과 옵셔널이 아닌 값은 철저히 다른 타입으로 인식하기 때문에 컴파일할 때 오류를 바로 걸러낼 수 있다.
 
    
    > 옵셔널 사용
 nil은 옵셔널 변수 또는 상수가 아니면 nil을 할당할 수 없다. 변수 또는 상수에 정말 값이 없을 때만 nil로 표현한다. 함수형 프로그래밍 패러다임에서 자주 등장하는 Monad와 개념이 같다.
 
 그래서 옵셔널의 사용은 많은 의미를 축약해서 표현하는 것과 같다. 옵셔널을 읽을 때 '해당 변수 또는 상수에는 값이 없을 수 있다. 즉, 변수 또는 상수가 nil일 수도 있으므로 사용에 주의하라'는 뜻으로 직관으로 받아들일 수 있다. 값이 없는 옵셔널 변수 또는 상수에 (강제로) 접근하려면 런타임 오류가 발생한다. 그렇게 되면 OS가 프로그램을 강제 종료시킬 확률이 매우 높다.
 */
var myName: String = "YJ"
//myName = nil //오류 -> error: 09.optional.playground:16:10: error: 'nil' cannot be assigned to type 'String'
var optionalTest: String? = "YJ"
print(optionalTest)
//옵셔널 타입의 값을 print로 출력하면 Optional("YJ")라고 출력되는 것이 정상이다.
//또, 옵셔널 타입의 값을 print 함수의 매개변수로 전달하면 컴파일러 경고가 날 수도 있다.

optionalTest = nil
print(optionalTest)

/**
 사실 var optional: Optional<String>처럼 옵셔널을 조금 더 명확하게 써줄 수 있다. 옵셔널은 언제 사용할까? 왜 굳이 변수에 nil이 있음을 가정해야 할까? 이 질문에 답할 수 있는 예로 우리가 만든 함수에 전달되는 전달인자의 값이 잘못된 값일 경우 제대로 처리하지 못했음을 nil을 반환하여 표현하는 것을 들 수 있다. 물론 기능상 심각한 오류라면 별도로 처리하는 것이 옳지만, 간단히 nil을 반환하여 오류가 있음을 알릴 수도 있다. 또는 매개변수를 굳이 넘기지 않아도 된다는 뜻으로 매개변수의 타입을 옵셔널로 정의할 수도 있다.
 
 또한 타입 추론을 사용할 때 nil을 할당하는 경우가 생긴다. 예를 들어 컴파일러가 enum 타입으로 데이터 타입을 추론했고, 원시 값이 열거형의 case에 해당하지 않으면 열거형 인스턴스 생성에 실패하여 nil 반환하는 경우가 생긴다. 앞서 설명한 함수 처리 실패 유형에 해당하는 것이다.
 
 옵셔널의 더 놀라운 점은 열거형으로 구현되어 있다는 것이다.
 
 public enum Optional<Wrapped> : ExpressibleByNilLiteral {
        case none
        case some(Wrapped)
        ... 중략 ..
 }
 
 옵셔널은 제네릭이 적용된 열거형이다 ExpressibleByNilLiteral 프로토콜을 따른다는 것도 알 수 있다. 여기서 알아야 할 것은 옵셔널이 값을 갖는 케이스와 그렇지 못한 케이스 두 가지로 정의되어 있다는 것이다. 즉, nil일 떄는 none 케이스가 될 것이고, 값이 있는 경우는 some 케이스가 되는데, 연관 값으로 Wrapped가 있다. 따라서 옵셔널에 값이 있으면 some의 연관 값인 Wrappered에 값이 할당된다. 즉, 값이 옵셔널이라는 열거형의 방패막에 보호되어 래핑되어 있는 모습이라는 것이다.
 
 옵셔널 자체가 열거형이기 때문에 옵셔널 변수는 switch 구문을 통해 값이 있고 없음을 확인할 수 있다.
 */

func checkOptionalValue( value optionalValue: Any? ){
    switch optionalValue{
        case .none:
            print("This Optional variable is nil")
        case .some(let value):
            print("Value is \(value)")
    }
}

var myName2: String? = "YJ"
checkOptionalValue(value: myName2)

myName2 = nil
checkOptionalValue(value: myName2)

/**
 where 절을 사용해서 더욱 유용하게 사용할 수 있다.
 */

let numbers: [Int?] = [2, nil, -4, nil, 100]
for number in numbers {
    switch number {
        case .some(let value) where value < 0:
            print("Negative Value !! \(value)")
        case .some(let value) where value > 0:
            print("Large value !! \(value)")
        
        case .some(let value):
            print("value \(value)")
        case .none:
            print("nil")
    }
}

/**
 그러나, 단 하나의 옵셔널을 switch 구문을 통해 매번 값이 있는지 확인하는 것은 매우 불편하다. 그래서 옵셔널 타입에서 값을 조금 더 안전하고 편리하게 추출하는 방법에 대해서 알아보자
 
 
 
 > 옵셔널 추출
 열거형의 some 케이스로 옵셔널의 값을 옵셔널이 아닌 값으로 추출하는 옵셔널 추출(Optional Unwrapping)을 알아볻자.
 
    1. 강제 추출
 옵셔널 강제 추출(Force Unwrapping) 방식은 옵셔널의 값을 추출하는 가장 간단하지만 가장 위험한 바업ㅂ이다. 런타이 오류가 일어날 가능성이 가장 높기 때문이다. 또, 옵셔널을 만든 의미가 무색해지는 방법이기도 하다. 옵셔널의 값을 강제 추출하려면 옵셔널 값의 뒤에 '!'를 붙여주기만 하면된다. 만약 강제 추출 시 옵셔널에 값이 없다면 즉, nil이면 런타임 에러가 발생한다.
 */

var myName3: String? = "YJ";

var yejin: String = myName3!
// 옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출해서 할당해야 한다.

myName3 = nil;
//yejin = myName3!

//if 구문 등 조건문을 이용해서 조금 더 안전하게 처리할 수도 있다.
if( myName3 != nil ){
    print("my name is \(myName3)")
} else {
    print("myName == nil")
}
/**
 
 
    2. 옵셔널 바인딩
 if 구문을 통해 myName이 nil인지 먼저 확인하고 옵셔널 값을 강제 추출하는 방법은 다른 프로그래밍 언어에서 NULL 값을 체크하는 방식과 비슷하다. 앞서 설명하는 것처럼 옵셔널을 사용하는 의미도 사라진다. 그래스 스위프트는 조금 더 안전하고 세련된 방법으로 옵셔널 바인딩(Optional Binding)을 제공한다.
 
 옵셔널 바인딩은 옵셔널 값이 있는지 확인할 때 사용한다. 만약 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할 수 있게 해준다. 옵셔널 바인 if 또는 while 구문 등과 결합하여 사용할 수 있다.
 */
var myName4: String? = "YJ"

// 옵셔널 바인딩을 통한 임시 상수 할당
if let name = myName4 {
    print("my name is \(name)")
} else {
    print("myName == nil")
}
// my name is YJ

// 옵셔널 바인딩을 통한 임수 변수 할당
if var name = myName4 {
    name = "wizplan"
    print("my name is \(name)")
} else {
    print("myName == nil")
}



/**
 if 구문을 실행하는 블록 안쪽에서만 name이라는 임시 상수를 사용할 수 있다. 즉, if 블록 밖에서는 사용할 수 없고 else 블록에서도 사용할 수 없다. 그렇기 때문에 위 아래 별도로 name을 사용했지만 충돌이 일어나지 않는다. 또, 상수로 사용하지 않고 변수로 사용하고 싶다면 if var를 통해 임시 변수로 할당할 수도 있다.
 
 옵셔널 바인딩을 통해 한 번에 여러 옵셔널의 값을 추출할 수도 있다. 쉼표(,)를 사용해 바인딩 할 옵셔널을 나열하면 된다. 단, 바인딩하려는 옵셔널 중 하나라도 값이 없다면 해당 블록 내부의 명령문은 실행되지 않는다.
 */
var myName5: String? = "YJ"
var youName2: String? = nil

//쉽표를 통해 바인딩했지만 옵셔널 중 값이 없어 실행되지 않는다.
if let name = myName5, let friend = youName2 {
    print("we are friend \(name) & \(friend)")
}

youName2 = "eric"
if let name = myName5, let friend = youName2 {
    print("we are friend \(name) & \(friend)")
}


/**
    3. 암시적 추출
 때때로 nil을 할당하고 싶지만, 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직상 nil 때문에 런타임 오류가 발생하지 않을 것 같다는 확신이 있다면 nil을 할당해줄 수 있는 옵셔널이 아닌 변수, 상수가 있다면 나쁘지 않을 것이다. 이때 사용하는 것이 바로 암시적 추출 옵셔널(Implicitly Unwrapped Optional)이다. 옵셔널을 표시하고자 타입 뒤에 물음표(?)를 사용했지만, 암시적 추출 옵셔널을 사용하려면 타입 뒤에 느낌표(!)를 사용하면 된다.
 
 암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있으나, 여전히 옵셔널이기 때문에 nil도 할당해줄 수 있다. 그러나 nil이 할당되어 있을 떄 접근을 시도하면 런타임 오류가 발생한다. 
 */
