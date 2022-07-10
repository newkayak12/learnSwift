import UIKit

/**
    연산자

 스위프트의 연산자는 특정한 문자로 표현한 함수라 할 수 있다. 따라서 특정 연산자의 역할을 프로그래머의 의도대로 변경할 수도 있다. 따라서 특정 연산자의 역할을 프로그래머의 의도대로 변경할 수도 있다.

 연산자에 의해 연산 되는 값의 수에 따라 단항, 이항, 삼항 등으로 구분하기도 하며, 연산자의 위치에 따라 전위, 중위, 후위 등으로 구분하기도 한다.


            분류                       설명                         예
         단항 연산자         피연산자(연산 대상)가 한 개인 연산자            !A
         이항 연산자         피연산자가 두 개인 연산자                     A + B
         삼항 연산자         피연산자가 세 개인 연산                      A? B:C
         전위 연산자         연산자가 피연산자 앞에 위치하는 연산자           !A
         중위 연산자         연산자가 피연산자 사이에 위치하는 연산자          A + B
         후위 연산자         연산자가 피연산자 뒤에 위치하는 연산             A!

    {
        스위프트에서는 띄어쓰기도 중요한 문법 중 하나이다. 연산자가 어디에 위치하느냐도 중요하지만, 연산자 앞과 뒤 중 어디에 공백이 있는지도 중요한 부분이다. 예를 들어, A != B와 A! = B는 전혀 다른 의미이다. 또, A > B? A : B는 잘못된 사용이며, 물음표를 B에서 띄어 써야 한다.
    }


    1. 할당 연산자
 값을 할당할 때 사용하는 연산자이다.

        연산자       부호      설명
      할당 연산자    A = B   A에 B의 값을 할당한다. 서로 다른 데이터 타입이라면 오류가 발생한다.

    2. 산술 연산자
 산술 연산자는 대체로 수학에서 쓰이는 연산자 같은 역할을 수행한다.

           연산자        부호       설명
        더하기 연산자    A + B    A와 B를 더한 값을 반환한다.
        뺴기 연산자     A - B    A와 B를 뺀 값을 반환한다.
        곱하기 연산자    A * B    A와 B를 곱한 값을 반환한다.
        나누기 연산자    A / B    A와 B를 나눈 값을 반환한다.
        나머지 연산자    A % B    A와 B의 나머지를 반환한다.

     {
            스위프트의 나머지 연산과 나누기 연산자

        스위프트에서는 부동소수점 타입의 나머지 연산까지 지원한다. 기존의 프로그래밍 언어에서는 아머지 연산자가 정수 타입만 지원하는 경우가 많았는데 스위프트에서는 부동소수점 타입도 나머지 연산을 할 수 있다.

        let number: Double = 5.0
        var result: Double = number.truncatingRemainder(dividingBy: 1.5) // 0.5
        result = 12.truncatingRemainder(dividingBy: 2.5)                 // 2.0

        나누기 연산은 기존의 프로그래밍 언어처럼 나머지나 소수점을 제외한 정수만 결괏값으로 반환한다.

        var result: Int = 5 / 3   // 1
        result  = 10 / 3          // 3

        또한, 스위프트는 데이터 타입에 굉장히 엄격하므로 서로 다른 자료형끼리 연산을 엄격히 제한한다. 서로 다른 자료형끼리 연산을 실행하려면 값을 해당 타입으로 변환한 후 연산해야한다. 심지어 같은 정수 타입인 Int 타입과 UInt 타입끼리의 연산도 엄격히 제한된다.
     }

    3. 비교 연산자

                연산자        부호       설명
               값이 같다.     A == B    A의 같이 B와 같은 값인지 비교하여 불리언 값을 반환한다.
            값이 크거나 같다.   A >= B    A가 B보다 크거나 같은 값인지 비교하여 불리언 값을 반환한다.
            값이 작거나 같다.   A <= B    A가 B보다 작거나 같은 값인지 비교하여 불리언 값을 반환한다.
               값이 크다.      A > B    A가 B보다 큰지 비교하여 불리언 값을 반환한다.
            값이 작다.         A < B    A가 B보다 작은지 비교하여 불리언 값을 반환한다.
            값이 같지 않다.     A != B    A와 B가 같지 않은지 비교하여 불리언 값을 반환한다.
            참조가 같다.       A === B    A와 B가 참조(레퍼런스) 타입일 때 A와 B가 같은 인스턴스를 가리키는지 비교하여 불리언으로 반환한다.
            참조가 같지 않다.  A !== B    A와 B가 참조(레퍼런스) 타입일 때 A와 B가 같지 않은 인스턴스 가리키는지 비교하여 불리언으로 반환한다.
            패턴 매치         A ~= B    A와 B의 패턴이 매치되는지 확인하여 불리언 값을 반환한다.

            {
                참조 비교 연산자
                스위프트의 유일한 참조(Reference) 타입인 클래스의 인스턴스에서만 참조 연산자를 사용할 수 있다. (물론 다른 데이터 타입에서 === 등의 연산자를 프로그래머가 정의하면 다른 용도로 사용할 수 있다.) 스위프트의 기본 테이터 타입은 모두 구조체로 구현되어 있기 떄문에 값 타입이다. 그렇기 때문에 값의 비교 연산에는 ==를 이용하고 클래스의 인스턴스인 경우에만 ===를 사용한다.

                let valueA: Int = 3
                let valueB: Int = 5
                let valueC: Int = 5

                let isSameValueAB: Bool = valueA == valueB // false
                let isSameValueBC: Bool = valueB == valueC // true

                let referenceA: SomeClass = SomeClass()
                let referenceB: SomeClass = SomeClass()
                let referenceC: SomeClass = referenceA

                let isSameReferenceAB: Bool = referenceA === referenceB //false
                let isSameReferenceBC: Bool = referenceB === referenceC //true
            }

    4. 삼항 조건 연산자
    피 연산자가 세 개인 삼항 조건 연산자이다.

            연산자             부호          설명
        삼항 조건 연산자    Question? A:B   Question(불리언)이 참이면 A를, 거짓이면 B를 반환한다.
 */

 var valueA: Int = 3;
 var valueB: Int = 5;
 var biggerValue: Int = valueA > valueB ? valueA : valueB //5

 valueA = 0;
 valueB = -3;
 biggerValue = valueA > valueB ? valueA : valueB; //0

 var stringA: String = "";
 var stringB: String = "String";
 var resultValue: Double = stringA.isEmpty? 1.0 : 0.0 // 1.0
 resultValue = stringB.isEmpty? 1.0 : 0.0 // 0.0
 /**
            {
                물론, 조건 안에 또 다른 삼항 연산자를 넣을 수도 있고, 여러 번 중첩할 수도 있지만, 중첩을 너무 많이 사용하면 오히려 코드를 이해하기 어려우므로 적절히 사용하는 것이 좋다.
            }




    5. 범위 연산자
    값 (수)의 범위를 나타내고자 할 때 사용한다.

                연산자                 부호                      설명
              폐쇄 범위 연산자          A...B             A부터 B까지의 수를 묶어 범위를 표현한다. A와 B를 포함한다.
             반폐쇄 범위 연산자          A...<B           A부터 B 미만까지의 수를 묶어 범위를 표현한다. A를 포함하고  B를 포함하지 않는다.
             단방향 범위 연산자          A...             A 이상의 수를 묶어 범위를 표현한다. A를 포함한다.
                                      ...A             A 이하의 수를 묶어 범위를 표현한다. A를 포함한다.
                                      ...<A            A 미만의 수를 묶어 범위를 표현한다. A를 포함하지 않는다.


    6. 부울 연산자
    불리언 값의 논리 연산을 할 때 사용한다.

                연산자                     표현                      설명
              NOT 부울 연산자                !B                  B의 참, 거짓을 반전한다.
              AND 부울 연산자                A && B              A와 B의 불리언 AND 논리 연산을 실행한다.
              OR 부울 연산자                 A || B              A와 B의 불리언 OR 논리 연산을 실행한다.



  7. 비트 연산자
  값의 비트 논리 연산을 위한 연산자이다.

             연산자                 표현                      설명
         NOT 비트 연산자             ~A                  A의 비트를 반전한 결과를 반환한다.
         AND 비트 연산자             A & B               A와 B의 비트 AND 놀리 연산을 실행한다.
         OR 비트 연산자              A | B               A와 B의 OR 논리 연산을 실행한다.
         XOR 비트 연산자             A ^ B               A와 B의 XOR 논리 연산을 실행한다.
         비트 시프트 연산자           A >> B              A의 비트를 B만큼 시프트한다.
                                   A << B


   8. 복합 할당 연산자
  할당 연산자와 다른 연산자가 하는 일을 한 번에 할 수 있도록 연산자를 결합할 수 있다. 이를 복합 할당(Compound Assignment) 연산자라고 한다.

                 연산자      표현                                        같은 표현
                A += B    A와 B의 합을 A에 할당한다.                       A=A+B
                A -= B    A와 B의 차를 A에 할당한다.                       A=A-B
                A *= B    A와 B의 곱을 A에 할당한다.                       A=A*B
                A /= B    A를 B로 나눈 값을 A에 할당한다.                   A=A/B
                A %= B    A를 B로 나눈 나머지를 A에 할당한다.                A=A%B
                A <<= B   A를 B만큼 왼쪽 비트 시프트 한 값을 A에 할당한다.     A=A<<B
                A >>= B   A를 B만큼 오른쪽 비트 시프트 한 값을 A에 할당한다.   A=A>>B
                A &= B    A와 B의 비트 AND 연산 결과를 A에 할당한다.         A=A&B
                A |= B    A와 B의 비트 OR 연산 결과를 A에 할당한다.          A=A|B
                A ^= B    A와 B의 비트 XOR 연산 결과를 A에 할당한다.         A=A^B


   9. 오버플로 연산자
   기본 프로그래밍 언어에서는 오버플로(또는 언더플로) 가능성이 있는 연산에 대해서는 따로 오버플로에 대한 추가 알고리즘 및 로직 등을 설계하는 것이 일반적이었다. 스위프트는 기본 연산자를 통해 오버플로에 대비할 수 있도록 준비해뒀다. 오버플로 연산자를 사용하면 오버플로를 자동으로 처리한다.


                연산자             부호                  설명
             오버플로 더하기 연산    &+          오버플로에 대비한 덧셈 연산을 한다.
             오버플로 뺴기 연산      &-         오버플로에 대비한 뺼셈 연산을 한다.
             오버플로 곱하기 연산    &*          오버플로에 대비한 곱셈 연산을 한다.

    예를 들어 UInt8 타입은 8비트 정수 타입으로 부호가 없는 양의 정수만을 표현하기 때문에 0 아래로 내려가는 계산을 하면 런타임 오류가 발생한다. 그러나 오버플로 뺴기 연산을 사용하면 오류 없이 오버플로를 처리해준다. 그렇지만 오버플로에 대한 이해 없이 사용한다면 엉뚱ㄹ한 값을 구할 수도 있다.

 */

var unsignedInteger:UInt8 = 0;
var errorUnderflowResult: UInt8 = unsignedInteger - 1 //RunTimeError
var underflowedValue: UInt8 = unsignedInteger &- 1 // 255

unsignedInteger = UInt8.max
let errorOverflowResult: UInt8 = unsignedInteger +1 //RunTimeError
let overflowedValue: UInt8 = unsignedInteger &+ 1 // 0


/**
    10. 기타 연산자
    앞서 소개한 연산자 외에 스위프트 라입3ㅡ러리에 기본적으로 정의된 연산자


        연산자                     부호              설명
    nil 병합 연산자                A ??B         A가 nil이 아니면 A를 반환하고, A가 nil 이면 B를 반환한다.
    부호 변경 연산자                -A            A(수)의 부호를 변경한다.
    옵셔널 강제 추출 연산자          O!           O(옵셔널 개체)의 값을 강제로 추출한다.
    옵셔널 연산자                   V?           V(옵셔널 값)를 안전하게 추출하거나, V(데이터 타입)가 옵셔널임을 표현한다.

        {
                nil 병합 연산자

                nil 병합연산자는 옵셔널을 사용할 때 아주 유용한 연산자이다. 아래의 두 코드는 같은 역할을 하지만 nil 병합 연산자를 사용하는 것이 훨씬 안전하고 간단한 방법이다.

                let valueInt: Int = someOptionalInt != nil ? someOptionalInt : 0

                let valueInt: Int = someOptionalInt ?? 0
        }


   11. 연산자 우선수위와 결합 방향
   C언어 등 기존 언어에서 연산자는 연산자 우선 순위를 쉽게 알기 어려웠다. 그러나 스위프트에서는 연산자 우선순위(Precedence)를 정해놓았기 때문에 코딩하다 헷갈리는 경우 확인하면 된다. 우선순위가 높은 연산자느 자신에 비해서 우선순위가 낮은 연산자보다 먼저 실행된다. 프로그래머가 임의로 정의하는 사용자 정의 연사자 또한 이 규칙에 따라 실행 순서가 결정된다.
   또, 연산자가 연산하는 결합방향(Associativity) 도 지정되어 있다. 결합 방향은 같은 우선순위에 있는 연산자끼리 나열되어있을 때 어느 방향부터 그룹지을 것인지 나타낸다. 예를 들어 1 + 2 + 3 + 4가 있으면 연산자 +는 모두 같은 우선도를 가지며 결합방향은 왼쪽부터 시작된다.

            {
                    ...
                    infix operator ?? : NilCoalescingPrecedence
                    infix operator == : ComparisonPrecedence
                    ...
            }

   연산자 뒤에 콜론을 붙이고 써둔 부분이 연산자 우선 순위 그룹을 지정해준 것이다 .


            {
                스위프트 표준 연산자 우선순위 그룹

                precedencegroup BitwiseShiftPrecedence{
                    higherThan: MultiplicationPrecedence
                }

                precedencegroup FunctionArrowPrecedence{
                    associativity: right
                    higherThan: AssignmentPrecedence
                }
                        ...
            }

    위와 같이 연산자 우선순위 그룹은 higherThan, lowerThan, associativity 등으로 우선순위 및 결합방향 등이 지정되어 있다. 연산자 우선 순위 그룹의 정의를 보면 절대적인 것이 아닌 상대적인 것임을 알 수 있다.



    12. 사용자 정의 연산자
    스위프트에서는 사용자(프로그래머)의 입맛에 맞게 연산자 역할을 부여할 수 있다. 또, 기조넹 존재하지 않던 연산자 기호를 만들어서 추가할 수도 있다.
            {
                할당 연산자 (=)와 삼항 연산자 (Question ? A:B)는 사용자 정의 역할을 부여할 수 없다.
            }
    우선 기존 연산자의 역할을 변경하거나 새로운 역할을 추가하기 위해서는 기존의 연산자가 전위 연산자인지 중위 연산자인지 후위 연산자인지 알아야한다. 전위 연산자는 연산자가 피연산자 앞에 위치하는 연산자를 뜻한다. 대표적으로 부울 부정 논리연산 NOT 연산자가 있다.  !A(prefix)
    중위 연산자는 피연산자 사이에 위치하는 연산자를 뜻한다. 많은 수의 연산자가 여기에 속한다. 예를 들어 A+B가 그러하다. (infix)
    마지막으로 후위 연산자는 피연산자 뒤에 위치하는 연산자를 뜻한다. 대표적으로 옵셔널 강제 추출 연산자가 있다. O! (postfix)

    사용자 정의 연산자는 아스키(ASCII) 문자 /, =, -, +, !, *, %, <, >, &, |, ^, ?, ~를 결합해서 사용한다.
    또 마침표(.)를 사용자 정의 연산자에 사용할 수 있다. 다면 마침표를 사용자 정의 연산자에 사용할 때 주의할 점이 있다. 연산자를 표현하는 문자 중 맨 처음의 문자가 마침표일때만 연산자에 포함된 마침표가 연산자로 인신된다. 예를 들어서 .+. 와 같이 사용할 수 없다. 또, +.+는 +와 .+를 사용한 것으로 인식된다.
    물음표(?)도 사용자 정의 연산자에 포함시킬 수 있지만 물음표 자체만으로는 사용자 정의 연산자를 정의할 수 없다. 더불어 사용자 정의 연산자에 !도 같은 조건으로 포함시킬 수 있다. 단, 전위 연산자는 물음표나 느낌표로 시작하는 사용자 정의 연산자를 정의할 수 없다.
    토큰으로 사용되느 =, ->, //, /*, */, .과 전위 연산자 <, &, ?, 중위연산자 ?, 후위연산자 >, !, ?등은 스위프트 예약어이기 때문에 재정의가 불가능하며 사용자 정의 연산자로 사용될 수도 없다.


    13 전위 연산자 정의와 구현
    Int 타입의 제곱을 구하는 연산자로 **을 전위 연산자로 사용하려고 한다. 기존에 없던 전위 연산자를 만들고 싶다면 연산자 정의를 먼저 해주어야한다. 정의된 연산자는 모듈 전역에서 사용된다.
*/
    prefix operator **
/**
    위와 같이 연산자 정의를 마치면, 어떤 데이터 타입에 이 연산자가 동작할 것인지 함수를 구현한다. 전위 연산자 함수를 구현할 때는 func 키워드 앞에 prefix 키워드를 추가해준다.

*/
prefix func ** (value:Int)->Int{
    return value * value;
}

let minusFive:Int = -5
let sqrtMinusFive:Int = **minusFive;
print(sqrtMinusFive)//25

/**
    스위프트 표준 라이브러리에 존재하는 전위 연산자에 기능을 추가할 때는 따로 연산자를 정의하지 않고 함수만 중복정의(오버라이드)하면 된다. 첫 번쨰로 생각해볼 예제는 기존에 존재하는 전위 연산자 중 정수에 사용되는 느낌표(!)를 문자열에도 사용하려고 한다. 문자열 앞에 사용하면 문자열이 비어있는지 확인하는 연산자로 사용하기 위해서 함수를 중복 정의한다.
*/
prefix func ! (value:String)->Bool{
    return value.isEmpty
}

var stringValue: String = "YJ"
var isEmptyString:Bool = !stringValue

print(isEmptyString)    //false

stringValue= ""
var isEmptyString:Bool = !stringValue

print(isEmptyString)    //true

//사용자 정의  전위 연산자 함수 중복 정의와 사용
prefix func ** (value:String)->String{
    return value+ " " +value
}

let resultString: String = (** "YJ")
print(resultString) //YJ YJ

/**
    14. 후위 연산자 정의와 구현
 
 이번에는 후위 연산자를 사용하는 방법을 살펴볼 것이다. 사용자 정의 전위 연산자를 구현한 것과 다르지 않다.
*/
 postfix operator **
postfix func ** (value: Int)-> Int{
    return value + 10;
}

let fivePiece: Int = 5;
let fivePlusTen: Int = five**;
print(fivePlusTen); //15

/**
 하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위 연산을 먼저 수행한다. 아래의 에시를 보면 이를 알 수 있다.
 */

let preAndPost : Int = **five**
print(preAndPost)

/**
    15. 중위 연산자 정의와 구현
 중위 연산자 정의도 전위 연산자나 후위 연산자 정의와 크게 다르지 않다. 다만 중위 연산자는 우선순위 그룹을 명시해줄 수 있다. 연산자 우선순위 그룹은 precedencegrouop 뒤에 그룹 이름을 써서 정의할 수 있다.
 
    precedencegroup [우선 순위 그룹 이름] {
        higerThan: [더 낮은 우선순위 그룹 이름]
        lowerThan: [더 높은 순위 그룹 이름]
        associativity: [결합 방향 (left/ right/ none)
        assignment: 할당 방향(true/ false)
    }
 
 연산자 우선순위 그룹은 중위 연산자에서만 사용된다. 전위 연산자 및 후위 연산자는 결합 방향 및 우선순위를 지정하지 않는다. 대신, 앞서 설명했든 하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위 연산을 먼저 수행한다. 더 낮은 우선순위 그룹 이름을 higherThan과 더 높은 우선순위 그룹 이름을 넣을 수 있는 lowertThan에 들어갈 수 있는 그룹 이름을 통해 기존의 우선순위 그룹과 새로 만들어줄 우선순위 그룹과의 상하관계를 설명해줄 수 있다. lowerThan 속성에는 현재 모듈 밖에 정의된 우선순위 그룹만 명시할 수 있다.
 
 결합 방향을 명시해줄 수 있는 associativity에는 left, right, none을 지정해줄 수 있다. 만약 associativity를 빼놓고 연산자 우선순위 그룹을 정의하면 기본적으로 none이 설정된다. 결합 방향이 없는 연산자는 여러 번 연달아 사용할 수 없다. 결합 방향이 있는 더하기(+) 빼기(-) 등의 연산자는 1 + 2 + 3과 같이 연산해줄 수 있ek. 그렇지만 결합 방향이 없는 부등호 연산자의 경우에는 연달아 사용해줄 수 없다.
 
 연산자 우선순위 그룹의 assignment는 옵셔널 체이닝과 관련된 사항이다. 연산자가 옵셔널 체이닝을 포함한 연산에 포함되어 있을 경우 연산자의 우선순위를 지정한다. true로 설정해주면 해당 우선순위 그룹에 해당 우선순위 그룹에 해당하는 연산자는 옵셔널 체이닝을 할 때 표준 라이브러리의 할당 연산자와 동일한 결합방향 규칙을 사용한다. 즉, 스위프트의 할당 연산자는 오른쪽 결합을 사용하므로 assignment를 true로 설정하면 연산자를 사용하여 옵셔널 체이닝을 할 때 오른쪽부터 체이닝이 시작된다는 뜻이다. 그렇지 않고 false를 설정하거나 assignment를 따로 명시해주지 않으면 해당 우선순위 그룹에 해당하는 연산자는 할당을 하지 않는 연산자와 같은 옵셔널 체이닝 규칙을 따른다. 즉, 연산자에 옵셔널 체이닝 기능이 포함되어 있다면 왼쪽부터 옵셔널 체이닝을 하게 된다.
 
 만약, 중위 연산자를 정의할 때 우선순위 그룹을 명시해주지 않는다면 우선순위가 가장 높은 DefaultPrecedence 그룹을 우선순위 그룹으로 갖게 된다.
 */

infix operator ** : MultiplicationPrecedence
/**
    문자열과 문자열 사이에 ** 연산자를 사용하면 뒤에 오는 문자열이 앞의 문자열 안에 속해있는지 확인하는 연산을 실행하도록 구현하겠다. 중위 연산자 구현함수는 따로 키워드를 추가하지 않는다.
 */

// String 타입의 contains(_:) 메소드를 사용하기 위해서 Foundation 프로엠 워크를 임포트한다.
import Foundation
func ** (lhs:String, rhs:String)->Bool {
    return lhs.contains(rhs)
}

let helloYj: String = "Hello YJ"
let yjs: String = "YJ"
let isContainYJ: Bool = helloYj **  yjs //true

/**
    추가로 우리가 정의한 데이터 타입(클래스, 구조체 등)에서 유용하게 사용할 수 있는 연산자도 새로 정의하거나 중복 정의할 수 있음을 알 수 있다.
 
 */
class Car {
    var modelYear: Int? //연식
    var modelName: String?//모델 이름
}

struct SmartPhone{
    var company:String? //제조사
    var model:String? //모델
}

//Car 클래스의 인스턴스끼리 == 연산했을 때 modelName이 같다면 true를 반환
func ==(lhs:Car, rhs: Car)->{
    return lhs.modelName == rhs.modelName
}

//SmartPhone의 구조체 인스턴스끼리 == 연산했을 떄 model이 같다면 true를 반환
func ==(lhs:SmartPhone, rhs:SmartPhone)->Bool{
    return lhs.model == rhs.model
}

let myCar = Car();
myCar.modelName = "S"

let yourCar = Car();
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model="SE"

var yourPhone = SmartPhone()
yourCar.modelName="6"


print(myCar == yourCar) //true
print(myPhone == yourPhone) //false

/**
 위와 같은 사례는 전역으로 연산자가 정의된 것이다. 그러나 특정 타입에 국한된 연산자 함수라면 그 타입 내부에 구현되는 것이 읽고 이해하기에 더욱 쉽다. 그래서 타입 내부에 타입 메소드로 구현할 수도 있다.
 */

class Pad{
    var modelYear: Int?
    var modelName: String?
    
//    Pad 클래스의 인스턴스끼리 == 연산했을 때 modelName이 같다면 true
    static func == (lhs: Pad, rhs: Pad)->Bool{
        return lhs.modelName == rhs.modelName
    }
}

struct Pod{
    var modelYear: Int?
    var model: String?
    
    //Pod 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
    static func == (lhs:Pod, rhs:Pod)->Bool{
        return lhs.model == rhs.model
    }
}

/**
 타입 메소드로 구현한 사용자 정의 연산자는 각 타입의 익스텐션으로 구현해도 된다.
 */
