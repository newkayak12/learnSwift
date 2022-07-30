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
 필터는 말 그대로 컨테이너 내부의 값을 걸러서 추출하는 역할을 하는 고차함수이다. 맵과 마찬가지로 새로운 컨테이너 값을 담아 반환해준다. 다만 맵처럼 기존 콘텐츠를 변형하는 것이 아니라 특정 조건에 맞게 걸러내는 역할을 할 수 있다는 점이 다르다. filter 함수의 매개변수로 전달되는 함수의 반환 타입은 Bool 이다. 해당 콘텐츠의 값을 갖고 새로운 컨테이너에 포함될 항목이라고 판단하면 true, 그렇지 않으면 false를 반환한다.
 
 */
let nums: [Int] = [0, 1, 2, 3, 4, 5]
let evenNum: [Int] = numbers.filter{ ( nums: Int) -> Bool in nums % 2 == 0 }
print(evenNum)

let oddNum: [Int] = numbers.filter{ $0 % 2 == 1 }
print(oddNum)


//맵과 필터 연계 사용
//let nums: [Int] = [0,1,2,3,4,5]
let mappedNumbs: [Int] = nums.map{ $0 + 3 }
let evenNumbs: [Int] = mappedNumbs.filter{ (numbs: Int) -> Bool in numbs % 2 == 0}
print(evenNumbs)

//위의 작업을 굳이 여러 번 할 필요 없이 한 번에 할 수 있다. 메소드를 체인처럼 연결하여 사용할 수 있다.
let oddNumbs: [Int] = nums.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbs)


/**
    3. 리듀스
 리듀스는 컨테이너 내부의 콘텐츠를 하나로 합하는 기능을 실행하는 고차함수이다. 배열이라면 배열의 모든 값을 전달인자로 전달받은 클로저의 연산 결과로 합해준다. 스위프트의 리듀스는 두 가지 형태로 구현되어 있다. 첫 번째 리듀스는 클로저가 각 요소를 전달받아 연산한 후 값을 다음 클로저 실행을 위해 반환하며 컨테이너를 순환하는 형태이다.
 
 > 결과 값을 리턴
 
     public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result ) rethrows -> Result
 
 initialResult이라는 이름의 매개변수로 전달되는 값을 통해 초깃값을 지정해 줄 수 있으며, nextPartialResult라는 이름의 매개변수로 클로저를 전달받는다. nextPartialResult 클로저의 첫 번째 매개변수는 리듀스 메소드의 initialResult 매개변수를 통해 전달받은 초기값 또는 이전 클로저의 결과 값이다. 모든 순회가 끝나면 리듀스의 최종 결과 값이 된다. 두 번째 매개변수는 리듀스 메소드가 순환하는 컨테이너의 요소이다.
 
 
 > 결과 값을 리턴하지 않음
 두 번쨰의 경우 결과값을 리턴하지 않지만 inout 매개변수를 사용하여 초기값에 직접 연산을 실행하게 된다.
 
    public func reduce<Result>(into initialResult: Result, _updateAccumulatingResult: (inout Result, Element) throws -> () ) rethrows -> Result
 
 updateAccumulatingResult 매개변수로 전달받는 클로저의 매개변수 중 첫 번쨰 매개변수를 inout 매개변수로 사용한다. updateAccumulatingResult 클로저의 첫 번쨰 매개변수는 리듀스 메소드의 initialResult 매개변수를 이용해 전달 받은 초기값 또는 이전에 실행된 클로저 때문에 변경되어 있는 결과 값이다. 모든 순회가 끝나면 리듀스의 최종 결과 값이 된다. 두 번째 매개변수는 리듀스 메소드가 순환하는 컨테이너의 요소이다. 상황에 따라서 리듀스를 맵과 유사하게 사용할 수도 있다.
    
 */
let reduceNumbers: [Int] = [1,2,3]
//첫 번쨰 형태인 reduce(_:_:) 메소드 사용

// 초기값이 0이고 정수 배열의 모든 값을 합산
var sum: Int = reduceNumbers.reduce(0, { (result: Int, next: Int ) -> Int in
    print("\(result) + \(next)")
    return result + next
})
print(sum)

// 초기 값이 0이고 정수 배열의 모든 값은 감산
let substract: Int = reduceNumbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) - \(next)")
    return result - next
})
print(substract)


// 초기값이 3이고 정수 배열의 모든 값을 합산
let sumFromThree: Int = reduceNumbers.reduce(3) {
    print("\($0) + \($1)")
    return $0 + $1
}
print(sumFromThree)

// 초기값이 3이고 정수 배열의 모든 값을 감산
let substractFromThree: Int = reduceNumbers.reduce(3) {
    print("\($0) - \($1)")
    return $0 - $1
}
print(substractFromThree)


//문자열 연결
let nameRedu: [String] = ["Chope", "Jay", "Joker", "Nova"]
let reducedNames: String = nameRedu.reduce("My Friends: ") {
    return $0 + "," + $1
}
print(reducedNames)


// 두 번째 형태인 reduce(into: _:) 메소드 사용
//초기값이 0이고 정수 배열의 모든 값을 더한다.
//첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서 이전 값을 변경한다는 점이 다르다.

let otherSum = reduceNumbers.reduce(into: 0, { (result: inout Int, next: Int ) in
    print("\(result) + \(next)")
    result += next
})
print(otherSum)

let otherSubtract = reduceNumbers.reduce(into: 3, {
    print("\($0) - \($1)")
    return $0 -= $1
})
print(otherSubtract)

//첫 번쨰 리듀스 형태와 다르기 때문에 다른 컨테이너에 값을 변경하여 넣어줄 수도 있다.
//이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수도 있다.

//홀수는 걸러내고 짝수만 두 배로 변경하여 초기값인 [1,2,3] 배열에 직접 연산한다.
let nub: [Int] = [1, 2, 3]
var doubledNum: [Int] = nub.reduce(into: [1,2]) { (result: inout [Int], next: Int) in
    print("result \(result) next: \(next)")

    guard next % 2 == 0 else {
        return
    }
    
    print("result \(result) next: \(next)")

    result.append(next * 2)
}

print(doubledNum)


// 필터와 맵을 사용한 모습
doubledNum = [1,2] + nub.filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
print(doubledNum)

// 이름을 모두 대문자로 변환하여 초깃값인 빈 배열에 직접 연산한다.
var upperCaseNames: [String]
upperCaseNames = nameRedu.reduce(into: [], {
    $0.append($1.uppercased())
})

print(upperCaseNames)

//맵을 사용한다면
upperCaseNames = nameRedu.map { $0.uppercased() }
print(upperCaseNames)


//맵, 필터, 리듀스 메소드 연계 사용
let nmbs: [Int] = [1,2,3,4,5,6,7]
//짝수를 걸러내서 각 값에 3을 곱해준 후 모든 값을 더한다.
var result: Int = nmbs.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3}.reduce(0){
    $0 + $1
}
print(result)


// for-in 사용시
result = 0;
for number in nmbs {
    guard number.isMultiple(of: 2) else {
        continue
    }
    result += number * 3
}
print(result)


/**
    4. 맵, 필터, 리듀스의 활용
 조금 다른 예제를 가지고 맵, 필터, 리듀스를 활용해보겠다. 먼저 친구들의 정보를 담을 수 있는 구조체 Friend와 성별을 나타내는 열거형 Gender를 정의하고 친구들의 정보를 담을 배열 friends를 생성한다.
 */
enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}
var friends: [Friend] = [Friend]()
friends.append(Friend(name: "yoobato", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "Jisoo", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "JuHyun", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "JiYoung", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "SungHo", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "JungKi", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "YoungMin", gender: .male, location: "경기", age: 24))
/**
 작년 데이터이므로 한 살을 더하고,
 서울 외에 거주하며, 25세 이상인 친구를 찾아봅시다.
 */

let search1: [Friend] = friends.map{
    var temp = $0
    temp.age += 1
    return temp
}.filter{ $0.location != "서울" && $0.age >= 25}

let string: String = search1.reduce("서울 외 지역에 거주하며, 25세 이상의 친구") {
    return ($0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세")
}

print(string)

