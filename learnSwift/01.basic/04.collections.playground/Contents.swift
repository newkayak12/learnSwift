import UIKit
/**
    스위프트는 튜플 외엥도 많은 수의 데이터를 묶에서 저장하고 관리할 수 있는 컬렉션 타입을 제공한다. 컬렉션 타입에는 배열(Array), 딕셔너리(Dictionary), 세트(Set)가 있다.


    1. 배열(Array)
    배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입이다. 각기 다른 위치에 같은 값이 중복해서 들어갈 수도 있다.
    배열 타입을 선언하는 방법은 다양하다. let 키워드를 사용해서 상수로 선언하면 변경할 수 없는 배열이되고, var 키워드로 배열을 선언하면 변경 가능한 배열이 된다. 실제로 배열을 사용할 때는 Array라는 키워드와 타입 이름의 조합으로 사용한다. 또, 대괄호로 값을 묶어 Array 타입임을 표현할 수 있다. 빈 배열은 이니셜라이저 또는 리터럴 문법을 통해서 생성해줄 수 있는데, isEmpty 프로퍼티로 비어있는 배열인지 확인해볼 수 있다. 그리고 배열에 몇 개의 요소가 존재하는지 알고 싶으면 count 프로퍼티로 확인하면 된다.typealias

        {
            스위프트의 Array는 C언어의 배열처럼 버퍼(buffer)이다. 단 C언어처럼 한 번 선언하면 크기가 고정되던 버퍼가 아니라, 필요에 따라 자동으로 버퍼의 크리를 조절해주므로 요소의 삽입 및 삭제가 자유롭다. 스위프트는 이런 리스트 타입을 Array, 즉 배열이라고 표현한다.
        }
*/

//대괄호를 사용하여 배열임을 표현한다.
var names: Array<String> = ["hello", "hi", "how are you?"]

//이를 더 축약할 수 있다.
var names2: [String] = ["a","b","c","d"];

var emptyArray:[Any] = [Any]() //Any 데이터 요소를 갖는 빈 배열을 생성한다.
var emptyArray2:[Any] = Array<Any>();


//배열의 타입을 정확히 명시해줬다면 []만으로도 빈 배열을 생성할 수 있다.
var emptyArray3:[Any] = []


/**
    배열은 각 요소에 인덱스를 통해서 접근할 수 있다. 인덱스는 0부터 시작한다. 잘못된 인덱스로 접근하려고 하면 Exception이 발생한다. 또, 맨 처음과 맨 마지막 요소는 first와 last 프로퍼티를 통해서 가져올 수 있다. index(of:) 메솧소드를 사요하면 해당 요소의 인덱스를 알아낼 수도 있다. 만약 중복된 요소가 있다면 제일 먼저 발견된 요소의 인덱스를 반환한다. 맨 뒤에 요소를 추가하고 싶다면 append(_:) 메소드를 사용한다.
    중간에 요소를 삽입하고 싶다면 insert(_:at:) 메소드를 사용하면 된다. 요소를 삭제하고 싶다면 remove(_:) 메소드를 사용하게 되는데, 메소드를 사용하면 해당 요소가 삭제된 후 반환된다.
*/

print(names[2])
// print(name[99]) //범위를 벗어났기 때문에 오류 발생

names.append("LOL"); //맨 마지막에 LOL 이 추가된다.
names.append(contentsOf:["john", "limbo"])//맨 마지막에 ["john", "limbo"]가 추가된다.
names.insert(contentsOf:["john", "limbo"], at:2) //인덱스 2에 ["john", "limbo"]가 삽입된다.

print(names.index(of:"john"))
print(names.first)
print(names.last)


let firstItem: String = names.removeFirst()
let lastItem: String = names.removeLast()
let indexZeroItem: String  = names.remove(at:0)

print(firstItem)
print(lastItem)
print(indexZeroItem) //삭제한 값을 반환한다. (pop 같다.)
print(names[1...3]) //스프레드도 가능

/**
    names[1...3]는 범위 연산자를 사용하여 names 배열의 일부만 가져온 것이다. 코드처럼 읽기 뿐만 아니라 names[1..3] = ["A", "B", "C"]와 같이 변경도 가능하다.
    스위프트의 배열을 비롯한 컬렉션 타입을 활용할 떄 서브스크립트(SubScript) 기능을 많이 사용한다.


    2. 딕셔너리(Dictionary)
    딕셔너리는 요소들이 순서 없이 키와 값의 쌍으로 구성되는 컬렉션 타입이다. 딕셔너리에 저장되는 값은 항상 키와 쌍을 이루게 되는데, 딕셔너리 안에는 키가 하나이거나 여러 개일 수 있다. 단, 하나의 딕셔너리 안에는 같은 이름의 키를 중복해서 사용할 수 없다.
    딕셔너리는 Dictionary라는 키워드와 키의 타입과 값의 타입 이름의 조합으로 써준다. 대괄호로 키와 값의 타입 이름의 쌍을 묶어 딕셔너리 타입임을 표현한다. let 키워드를 사용하여 상수로 선언하면 변경 불가능한 딕셔너리가 되고, var키워드를 사용하여 변수로 선언해주면 ㅂ3ㅕㄴ경 가능한 딕셔너리가 된다. 빈 딕셔너리는 이니셜라지저 또는 리터러 문법을 통해 생성할 수 있다. isEmpty 프로퍼티를 통해서 비어있는 딕셔너리인지 확인 할 수 있다. 그리고 count 프로퍼티로 딕셔너리의 요소 개수를 확인할 수 있다.
*/
//typealias를 통해서 조금 더 단순하게 표현할 수도 있다.
typealias StringIntDictionary  = [String: Int]
//키는 String, 값은 Int 타입인 빈 딕셔너리를 생성한다.
var numberForName: Dictionary<String, Int>  = Dictionary<String, Int>();
//위 선언과 같은 표현이다.
var numberForName2: [String:Int] = [String:Int]()
var numberForName3: StringIntDictionary = StringIntDictionary();

// 딕셔너리의 키와 값 타입을 정확히 명시했다면 [:]만으로도 빈 딕셔너리를 생성할 수 있다.
var numberForName4: [String:Int] = [:];

// 초기 값을 부여해서 생성할 수도 있다.
var numberForName5: [String:Int] = ["hello":1, "hi":2, "howAreYou":3];

/**
    딕셔너리는 각 값에 키로 접근할 수 있다. 딕셔너리 내부에서 키는 유일해야하며, 값은 유일하지 않아도 된다. 딕셔너리는 배열과 다르게 딕셔너리 냅주에 없는 키로 접근해도 오류를 반환하지 않는다. 다만 nil을 반환한다. 특정 키에 해당하는 값을 제거하려면 removeValue(forKey:) 메소드를 이용한다. 키에 해당하는 값이 제거된 후 반환된다.
*/
print(numberForName5["hello"]) //1
print(numberForName5["hello2"]) //nil

numberForName5["kkk"] = 1234
print(numberForName5["kkk"]) //1234

print(numberForName5.removeValue(forKey:"kkk")) //1234

//위에서 kkk에 대한 값이 삭제되었으므로 nil이 반환된다.
//키에 대한 값이 없으면 기본값을 반환하도록 할 수도 있다.
print(numberForName5.removeValue(forKey:"kkk"))

print(numberForName5["kkk", default: 0]);


/**
    3. 세트(Set)
    세트는 같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션이다. 세트 내의 값은 모두 유일한 값, 즉 중복된 값이 존재하지 않는다. 그래서 세트는 보통 '순서가 중요하지 ㅇ낳거나 각 요소가 유일한 값이어야하는 경우'에 사용한다.또 세트의 요소로는 해시 가능한 값이 들어와야한다.(Hashable 프로토콜을 따른 다는 것을 의미한다. )

    세트는 Set 키워드와 타입 이름의 조합으로 써준다. 또, 배열과 마찬가지로 대괄호로 값을 묶어 세트 타입임을 표현한다. 배열과 달리 줄여서 표현할 수 있는 축향형이 없다. let으로 선언하면 변경불가, var로 선언하면 변경 가능한 세트가 된다. 빈 세트는 이니셜라이저 또는 리터럴 문법을 통해서 생성할 수 있다. isEmpty로 비어있는지 확인할 수 있고 count로 개수를 확인할 수도 있다.
*/

var nameSet : Set<String> = Set<String>();
var nameSet2: Set<String> = [];

//Array와 마찬가지로 대괄호를 사용한다.
var nameSet3: Set<String> = ["hi", "Hello", "howAreYou", "bye", "hi"];

//그렇기 때문에 타입 추론을 사용하게 되면 컴파일러는 Set이 아닌 Array로 타입을 지정한다.
var numberss = [100, 200, 300]
print(type(of:numberss); //Array<Int>

print(names3.isEmpty)
print(names3.count)

/**
    세트에 요소를 추가하고 싶으면 insert(_:)를 사용하면 되고 요소를 삭제하고 싶다면 remove(_:) 메소드를 사용하는데, 해당 요소가 삭제후 리턴된다.
*/
print(nameSet3.remove("hi")) //hi
/**
    세트는 자신 내부의 값들이 모두 유일함을 보장하므로, 집합관계를 표현하고자 할 떄 유용하게 쓰일 수 있으며, 두 세트의 교집합, 합집합 등을 연산하기에 매우 용이하다. 또한 sorted() 메소드를 통해서 정렬된 '배열'을 반환해줄 수도 있다.
*/

let englishClassStudent: Set<String> = ["john","clerk", "minsoo"]
let koreanClassStudent: Set<String> = ["jenny", "jaeSik", "minsoo", "john"]

//교집합
let intersectSet: Set<String> = englishClassStudent.intersection(koreanClassStudent)

//여집합의 합
let symmetricDiffSet: Set<String> = englishClassStudent.symmetricDiffernece(koreanClassStudent)

//합집합
let union: Set<String> = englishClassStudent.union(koreanClassStudent)

//차집합
let subtractSet: Set<String>  = englishClassStudent.subtracting(koreanClassStudent)

// 세트는 포함 관계를 연산할 수 있는 메소드도 구현되어 있다.

let 새: Set<String> = ["비둘기", "닭", "기러기"];
let 포유류:Set<String> = ["사자", "호랑이", "곰"];
let 동물:Set<String> = 새.union(포유류);

print(새.isDisjoint(with:포유류)) //서로 배타적인지 : true
print(새.isSubset(of:동물)) //새가 동물의 부분집합인가? : true
print(동물.isSuperset(of:포유류)) //동물은 포유류의 전체집합인가 :true
print(동물.isSuperset(of:새)) //동물은 새의 전체집합인가 :true

/**
    {
      컬렉션에서 임의의 요소 추출과 뒤섞기
    }
*/
