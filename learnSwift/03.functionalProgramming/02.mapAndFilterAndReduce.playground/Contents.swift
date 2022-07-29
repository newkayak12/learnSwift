import UIKit
/**
        > 맵, 필터, 리듀스
 스위프트는 함수를 일급 객체로 취급한다. 따라서 함수를 다른 함수의 전달인자로 사용할 수 있다. 매개변수로 함수를 갖는 함수를 고차함수라고 부르는데, 스위프트에 유용한 대표적인 고차함수로는 맵, 필터, 리듀스 등이 있다.
 
 
 
    1. 맵
 맵(Map)은 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수이다. 스위프트에서 맵은 배열, 딕셔너리, 세트 , 옵셔널 등에서 사용할 수 있다. 조근 더 정확하게 설명하자면 스위프트의 Sequence, Collection 프로토콜을ㄷ 따르는 타입과 옵셔널은 모두 맵을 사용할 수 있다.
 맵을 사용하면 컨테이너가 담고 있던 각각의 값을 매개변수를 통해 받은 함수에 적용한 후 다시 컨테이너에 포장하여 반환한다. 기존 컨테이너의 값은 변경되지 않고 새로운 컨테이너가 생성되어 반환된다. 그래서 맵은 기존 데이터를 변형하는데 많이 사용한다.
 
 map 메소드의 사용법은 for-in과는 차이가 없다 다면 코드의 재사용 측면이나 컴파일러 최적화 측면에서 본다면 성능 차이가 있다. 또, 다중 쓰레드 환경일 떄 대상 컨테이너 값이 쓰레드에서 변경되는 시점에 다른 쓰레드에서도 동시에 값이 변경되려고 할 때 예측치 못한 결과가 발생하는 부작용을 방지할 수도 있다.
 
    {
        > 배열에서의  map, filter, reduce가 있고, 다른 컬렉션 타입(세트, 딕셔너리 등)을 위한 map, filter, reduce도 있다. 특히 딕셔너리에는 키에 해당하는 값을 위한 mapValue, compactMapValue, flatMapValue 등도 있다.
    }
 */
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubleNumbers: [Int] = [Int]()
var strings: [String] = [String]()

//for 구문
for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)

//map
doubleNumbers = numbers.map({ (number: Int) -> Int in number * 2})
strings = numbers.map({ (number: Int) -> String in "\(number)"})

print(doubleNumbers)
print(strings)
/**
    for-in 보다 더 간결하고 편리하게 연산을 실행하는 것을 볼 수 있다. 심지어 map을 사용하면 for-in 구문을 사용하기 위해서 빈 배열을 처음 생성해주는 작업도 필요가 없고, 배열에 append 연산을 실행하기 위한 시간도 필요 없다.
 
    위의 예시를 클로저 표현식으로 더 간략화 할 수 있다.
 */
//매개변수 및 반환 타입 생략
doubleNumbers = numbers.map({ return $0 * 2})
print(doubleNumbers)

//반환 키워드 생략
doubleNumbers = numbers.map({ $0 * 2})
print(doubleNumbers)

//후행 클로저 사용
doubleNumbers = numbers.map{ $0 * 2 }
print(doubleNumbers)


/**
 위와 같이 클로저 간략화로 더 간결해진 코드를 볼 수 있다. 그런데 처음에 언급했던 코드의 재사용 측면에서 보면 하나의 클로저를 여러 map에서 사용하는 것이 나을 수도 있다.
 */

// 클로저 반복 사용
let evenNumbers: [Int] = [0,2,4,6,8]
let oddNumbers: [Int] = [0,1,3,5,7]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubledEvenNumbers)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubledOddNumbers)

/**
    map은 배열뿐만 아니라 여러 컨테이너 타입에 모두 적용이 가능하다. 아래는 다양한 종류의 컨테이너에서 map을 실행해본 결과이다.
 */
let alphabetDictiionary: [String: String] = ["A":"a", "B":"b"]
var keys: [String] = alphabetDictiionary.map{ (tuple: (String,String)) -> String in return tuple.0}
keys = alphabetDictiionary.map{ (tuple: (String,String)) -> String in tuple.0}
keys = alphabetDictiionary.map{$0.0}

let values: [String] = alphabetDictiionary.map{$0.1}
print(keys)
print(values)


var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2}
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0 * 2 }
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)



/**
        2. 필터
 필터는 말 그대로 컨테이너 내부의 값을 걸러서 추출하는 역할을 하는 고차함수이다. 
 */
