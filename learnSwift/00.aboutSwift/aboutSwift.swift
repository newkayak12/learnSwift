//
//  aboutSwift.swift
//  learnSwift
//
//  Created by Sang Hyeon kim on 2022/07/02.
//

import Foundation

/**
        스위프트의 언어적 특성 ( Safe, Fast, Expressive)
 
 1. 안전성
 스위프는 안전한 프로그래밍을 지향한다. 소프트웨어가 배포되기 전, 즉 프로그래밍하는 중에 프로그래머가 저지를 수 있는 엄격한 문법을 적용해서 미연에 방지하고 한다. 스위프트는 옵셔널이라는 기능을 비롯하여  'guard' 구분, 오류 처리 강력한 타입 통제 등을 통해 스위프트는 안전한 프로그래밍을 구현하고 있다.
 
 
 2. 신속성
 스위프트는 C 언으롤 기반으로한 C, C++, Objective-C 와 같은 프로그래밍 언어를 대체하려는 목적으로 만들졌다. 실행 속도의 최적화뿐만 아니라 컴파일러를 지속적으로 개량해 더 빠른 컴파일 성능을 구현해나가고 있다.
 
 3. 더 나은 표현성
 스위프트는 여러 가지 프로그래밍 패러다임을 차용한 다중 패러다임 프로그래밍 언어이다. 크게 보면 명령형 프로그래밍 패러다임, 객체지향 프로그래밍 패러다임, 함수형 프로그래밍 패러다임, 프로토콜 지향 프로그래밍 패러다미을 차용했다. 정확하게는 명령형과 객체지향 프로그래밍 패러다임을 기반으로 한 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임을 지향한다.
 결과적으로 스퓌프트에서 가장 강조하는 부분은 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임이다.
 
 기존의 C언어는 명령형 프로그래밍 패러다임을 차용했으며, C++, 자바 등의 언어는 명령형 패러다임과 객체지향 패러다임을 동시에 차용한 다중 프로그래밍 언어이다. 스위프트는 추가로 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임을 더한 언어이다.
            
 
    > 1. 객체지향
    객체지향 프로그래밍 패러다임은 컴퓨터 프로그램을 명령어의 목록으로 보는 기존의 명령형 프로그래밍 패러다임에서 벗어나서 여러 개의 독립된 단위인 객체의 모임으로 파악하고자하는 시각이다. 각각의 객체는 서로 메시지를 주고 받고 데이터를 처리할 수 있다. 객체지향 프로그래밍은 소프트웨어 공학의 관점에서 소프트웨어의 질을 향상하려면 강한 응집력과 약한 결합력을 지향해야한다. 객체 지향 프로그래밍은 클래스에 하나의 문제 해결을 위한 데이터와 메소드를 모아놓는 방식으로 응집력을 강화한다. 또한 각 클래스는 독립적이 되도록 디자인해서 결합력을 약화한다.
    
    객체지향 프로그래밍의 주요 특징으로는 자료 추상화, 상속, 다형성, 동적 바인딩 등이 있다.
        
        - 클래스와 객체
        클래스 : 같은 종류(또는 문제 해결을 위한)의 집단에 속하는 속성과 행위를 정의한 것이다. 객체지향 프로그램의 기본 사용자 정의 데이터 타입이라고 할 수 있다. 클래스는 다른 클래스 또는 외부요소와 독립적으로 디자인 되어야한다.
 
        객체: 클래스의 인스턴스(실제로 메모리에 올라가 동작하는 모양을 갖춘, instance)이다. 객체는 자신 고유의 속성이 있으며 클래스에서 정의한 행위를 할 수 있다. 스위프트에서는 객체라는 용어 보다는 클래스의 인스턴스라는 표현을 사용한다
 
        메소드 또는 메시지: 객체가 클래스에 정의된 행위를 실질적으로 하는 함수이다. 메소드를 통해 객체에 명령을 전달할 수 있다. 객체 간의 명령 전달 또는 데이터 전달은 메소드(메시지)를 통해 이루어지며 명령을 전달하거나 데이터를 전달하는 '행위를 메소드를 호출한다'라고 한다.
 */
class SomeClass{
    var someProperty: Int = 1;
    func someMethod(){
        print("methd!");
    }
}

let myInstance : SomeClass = SomeClass();
//SomeClass라는 이름의 클래스 이니셜라이저를 호출한다.
//myInstance라는 상수에 할당한다.
//클래스의 이니셜라이저를 통해서 메모리에 할당되고 초기화한 객체를 인스턴스라고 한다.
myInstance.someProperty = 100; //값을 할당할 수 있고
print(myInstance.someProperty); //값을 가져올 수도 있다.

myInstance.someMethod(); //인스턴스의 메소드를 호출하여 작업을 수행하도록 할 수 있다.


/**
 코드를 보면 알 수 있으 듯, 스위프트뿐만 아니라 객체지향 프로그래밍 패러다임을 차용한 언어는 필수로 명령형 프로그래밍 패러다임을 사용한다. 프로퍼티, 변수 등에 해당하는 메모리 값의 변화(상태 변화) 가 있기 떄문이다. 클래스는 객체가 만들어지기 위한 청사진으로 비유할 수 있다. 클래스는 실제 메모리에 객체를 할당해 인스턴스를 만들기 위한 일종의 설계 코드이다. 클래스에 구현된 코드대로 실제로 객체가 메모리에 올라가 활동하게 된다.
 클래스에 정의된 모양대로 객체가 생성되고 객체 간의 메시지를 통해서 프로그램의 각 명령이 실행된다.
 
    > 2. 함수형
    함수형 프로그래밍 패러다임은 최근 프로그래밍 패러다임의 대세로 떠오르고 있다. 함수형 프로그래밍 패러다임의 가장 큰 장점은 대규모 병렬처리가 굉장히 쉽다는 것이다. 함수형 프로그래밍은 프로그램이 상태 변화 없이 처리를 수학적 함수 계산으로 취급하고자 하는 패러다임이다. 기존 객체지향 프로그래밍 패러다임이나 명령형 프로그래밍 패러다임에서는 프로그램에서 값이나 상태의 변화를 중요하게 여기지만 함수형 프로그래밍 패러다임은 함수 자체의 응용을 중요하게 여긴다. 수학적 함수와 명령형 함수의 차이점은 코드 이해와 실행 결과의 관점에서도 큰 차이를 보인다. 명령형 함수를 이용하는 객체지향 프로그래밍은 과거의 유산이라고도 볼 수 있는 절차지향 프로그래밍 패러다임이 포함되어 있다. 그래서 함수 실행 시 함수가 전달받은 전달인자 외에도 포인터, 레퍼런스 값 등 객체의 상태 값(프로퍼티 값) 또는 메모리 참조 값 등이 변경될 수 있으며 함수 내부의 처리에도 영향을 미칠 수 있다.
    
    하지만 수학적 함수를 이용하는 함수형 프로그래밍은 순수하게 함수에 전달된 인자 값만 결과에 영향을 주므로 상태 값을 갖지 않고 순수하게 함수만으로 동작한다. 따라서 어떤 상황에서 프로그램을 실행하더라도 일정하게 같은 결과를 도출할 수 있다. 프로그램이 동작하는 흐름에서 상태(값)가 변하지 않으면 함수 호출이 각각 상호 간섭 없이 배타적으로 실행되므로 병렬처리에 부작용이 거의 없다.
    프로세스 혹은 스레드별로 특정 값을 참조하기 위해서 락을 걸거나 대기할 필요가 없기 때문이다. 또한 필요한 만큼 함수를 나누어 처리할 수 있도록 스케일업할 수 있기 때문에 대규모 병렬처리에 큰 강점이 있다. 또 다른 함수형 프로그래밍의 큰 특징은 함수를 일급 객체로 다룬다는 점이다.
        
        - 전달인자(Argument)로 전달할 수 있다.
        - 동적 프로퍼티 할당이 가능하다.
        - 변수나 데이터 구조 안에 담을 수 있다.
        - 반환 값으로 사용할 수 있다.
        - 할당할 때 사용된 이름과 관계없이 고유한 객체로 구별할 수 있다.
    
    기존의 스칼라 타입인 정수, 실수 등은 거의 모든 언어에서 일급 객체의 조건을 갖출수 있지만, 대부분의 함수는 그렇지 않다. 하지만 스위프트의 함수는 이 조건을 모두 충족할 수 있기에 함수를 일급 객체로 취급하낟. 함수가 일급 객체가 된다는 의미는 다양한 종류의 함수를 호출하고, 전달하고, 반환하는 등의 동작만으로 프로그램을 구현할 수 있다는 뜻이다.
 */


////////////// doSomething -> doAnotherThing -> All
//명령형 패러다임
func doSomthing(){
    print("do Something");
}
func doAnotherThing(){
    print("do Another thing");
}
func executeAll(){
    doSomthing();
    doAnotherThing();
}

executeAll();

//함수형
func funcSomething(){
    print("do sthng");
}
func funcDoAnotherthing(){
    print("do another thng")
}
func funcExecute(task: [()->Void]){
    for task in tasks {
        task();
    }
}

funcExecute(task: [doSomthing(), doAnotherThing()])
////////////////


///////////// 두 수의 합 구하기
//명령형
func sum(first:Int, second:Int)-> Int{
    return first+second;
}

sum(first: 10, second: 5);

//함수형 프로그래밍 패러다임
func funcSum(first:Int)->((Int)->Int){
    return {second in first+second};
}

funcSum(first: 10)(5)
///////////////
/**
    함수형 프로그래밍 패러다임 안에서는 함수가 일급 객체이므로 전다인자 또는 반환 값으로 사용할 수 있다. 따라서 execute(tasks: [doSomething, doAnotherThing])처럼 doSomething 함수와 doAnotherThing 함수를 전달인자로 사용할 수 있다. 또, 덧셈 함수인 sum 역시 함수형 프로그래밍 패러다임에서 즐겨하용하는 커링(Currying) 기법으로 전달인자를 하나만 두고 반환하면서 second in first+second 처럼 전달인자를 사용할 수 있다. 또한 함수형 프로그래밍 패러다임은 위의 간단한 차이 외에도 모나드(Monad), 함수객체(Functor), 필터(Filter), 맵(Map), FlatMap(플랫맵), 리듀스(Reduce) 등의 기능을 사용할 수 있다.

                            명령형 프로그래밍                   함수형 프로그래밍
         초점            작업 수행 알고리즘, 상태 변경 추적          원하는 정보, 필요한 변환
        상태 변환        중요                                  없음
        실행 순서        중요                                  낮은 중요도
        주요 흐름 제어    제어구문(반복, 조건), 함수 호출             순환(재귀) 호출 등의 함수 호출로 제어
        주요 조작 단위    클래스나 구조체의 인스턴스                  함수
 
 49
 */