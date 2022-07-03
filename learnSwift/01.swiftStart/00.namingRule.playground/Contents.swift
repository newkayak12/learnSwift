import UIKit

/**
    2.1 기본 명명 규칙
    
    - 변수, 상수, 함수, 메소드, 타입 등의 이름은 유니코ㅌ드에서 지원하는 어떤 문자든 상관없다.
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


//
