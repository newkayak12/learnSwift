import UIKit

/**
    2.1 기본 명명 규칙
    
    - 변수, 상수, 함수, 메소드, 타입 등의 이름은 유니코드에서 지원하는 어떤 문자든 상관없다.
    (단, 스위프트 예약어, 이미 있는 이름, 연산자로 사용될 수 있는 기호(+,-,*,/), 숫자로 시작하는 이름, 공백이 포함된 이름)은 불가능하다.
    
    - 함수, 메소드, 인스턴스 이름은 첫 글자를 소문자로 시작하는 카멜케이스로 작성한다.
    - 클래스, 구조체, 익스텐션, 프로토콜, 열거형은 첫 글자를 대문자로 사용하는 카멜케이스를 사용한다.
    - 대소문자를 구별한다. (Var, var은 다르게 인식)
 
    
 
    2.2 콘솔로그
    프로그램에서 로그란 애플리케이션의 상태 또는 애플리케이션 내부 로직의 흐름을 관찰할 수 있도록 출력한 정보를 의미한다. 콘솔 로그는 디버깅 중 디버깅 콘솔에 보여줄 로그를 뜻한다. 스위프트에서는 print(), dump() 함수를 사용하려 콘솔 로그를 출력할 수 있다.
    
    {
        print(), dump() 함수
        print는 간단한 정보, dump는 자세한 정보를 출력해준다. print는 인스턴스의 description 프로퍼티에 해당하는 내용을 출력해주고 dump()는 출력하라ㅕ는 인스턴스의 자세한 내부 콘텐츠까지 출력해준다. 필요에 따라 print()대신 dump()를 사용하는 것이 좋다.
 
        * 아래는 예제
    }
 **/

struct BasicInfo{
    let name:String
    var get: Int
}

var info :BasicInfo = BasicInfo(name: "SH", get: 99);

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

let infoPerson: Person = Person();
infoPerson.height = 182.8;
infoPerson.weight = 12;

print(info)
dump(info)

print(infoPerson)
dump(infoPerson)
/**
 
    2.2 문자열 보간법
 
    문자열 보간법(String Interpolation)은 변수 또는 상수 등의 값을 문자열 내에 나타내고 싶을 때 사용한다. 문자열 내에 \(변수나 상수)의 형태로 표기하면 이를 문자열로 치환해서 넣는다. 문자열 보간법을 이용해서 프로그래머가 원하는 문자열로 치환하려면 변수나 상수 타입을 CustomStringConvertible 프로토콜을 준수하는 description 프로퍼티로 구현한다.
 
    {
        * 더 다양한 문자열 출력하기
        
        문자열 보간법을 사용하면 기본적으로 인스턴스를 description 프로퍼티를 사용하여 문자열로 치환한다. description 프로퍼티는 CustomStringConvertible 프로토콜을 준수할 때 구현해 주면 된다. 하나의 타입에만 국한하지 않거나 조금 더 다양한 경우의 문자열 보간법을 구현하고 싶다면 StringInterpolationProtocol을 활용하면 된다.
    }
 */

let name : String = "SH";
print("My name is \(name)")


/**
    2.3 주석
 
    Xcode에는 말풍선 형태로 레퍼런스 문서의 요약된 내용을 보여주는 퀵헬프라는 기능이 있다. 코드를 작성하는 중에 레퍼런스 문서로 이동하지 않고 데이터 타입이나 메소드 등의 간단한 정보를 확인할 수 있는 아주 유용한 기능이다. 퀵헬프를 보려면 대상 (변수, 상수, 함수, 메소드, 타입 등)을 option 클릭으로 선택하면 된다.
 
    한줄 주석은 //
    여러 줄 주석은 \/**/\ 으로 작성한다.
    또한 스위프트에서는 여러 줄 주석 안에서 한 줄 주석을 지원한다.
 
    
    >  마크업 문법을 활용한 문서화 주석
    변수, 상수, 클래스, 메소드, 함수, 열거형 등을 설명하고자 하는 경우 일정한 마크업 형식에 따라 주석을 작성하면 퀵헬프를 통해 그 내용을 확인할 수 있다. 중요한 차이는 문서화를 위한 한 줄 주석은 슬래시 세 개를 사용하고, 여러 줄 주석은 별표 두 개를 사용한다는 것이다. 자동으로 문서화 주석 코드 조각을 생성하려면 문서로 만들고자하는 요소(상수, 변수, 함수)에 커서를 위치한 후 command + option + /를 선택한다.
 */

/// 오류 타입의 열거형이다.
/// - noName : 이름 ~
/// - incroeectAge(age:Int):  나이 ~
/// - unknown: 알수 없음
/// ```
/// Hello : Error {
///
/// }
/// ```
enum HelloError: Error{
    case noName
    case incorrectAge(age:Int)
    case unknown
}
/**
    /\** 로 만든 주석
 
    '-', '+', '*'로 원형 글머리 기호를 사용할 수 있고
    1.과 같이 번호로 매길 수도 있다.
    '---'로 문단을 바꾸거나
    언더바, 별로 텍스트를 강조할 수 있다. *HELLO*와 같이 말이다.
    [link](www.naver.com)과 같이 링크도 넣을 수 있다.
    등호는 바로 위 텍스트를 큰 제목으로 보여준다.
    제목
    ===
    
 
    다른 텍스트보다 네 칸 이상 들여쓰면 코드 블록을 만들어준다. backQuote를 세 쌍 이상으로 묶어도 코드 블록을 만든다.
```
HelloError: Error {
 
}
```
 
 Precondition, Postcondition, Requires, Invariant, Complexity, Important, Warning, Author, Copyright, Date, SeeAlso, Since, Version, Attension, Bug, Experiment, Note, Remark, ToDo 등의 키워드로 적절한 정보를 제공할 수 있다.
 
    
 */

