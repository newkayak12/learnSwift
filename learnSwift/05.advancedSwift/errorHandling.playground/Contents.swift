/**
 
                오류처리
 대부분의 프로그래밍 언어는 프로그램에서 발생하는 오류에 대비하기 위해서 오류를 처리하는 기능을 제공한다. 스위프트도 오류를 처리할 수 있는 기능을 제공한다.
 
 
        1. 오류처리란
 오류처리(Error Handling)는 프로그램이 오류를 일으켰을 때 이것을 감지하고 회복시키는 일련의 과정이다. 프로그램에서 모든 기능이 우리가 원하는대로 100% 정확히 동작한다는 보장이 없다. 특히나 전달받아야 하느 값이 까다롭거나 데이터를 가공하는 데 소비하는 자원이 많을 경우 오류가 발생한 확률이 높다. 이런 가능성이 있는 기능을 구현할 떄느 ㄴ오류가 발생할 수 있음을 고려해야 한다.
 
 에르 들어 디스크 파일을 읽어올 때, 파일이 존재하지 않을 수 있으며, 권한이 없을 수 있고, 잘못된 파일일 수도 있다. 이렇게 여러 오류 발생 가능 상황이 존재한다. 오류 처리 기능을 통해서 이런 상황을 구별하여 자체적으로 오류를 해결할 수 있고, 사용자와 상호 작용으로 이를 해결해갈 수도 있다. 다만 주의할 점은 스위프트의 오류 처리 기능을 통해 시스템( 예를들어 운영체제 등 우리가 작성하는 응용프로그램 외부)에서 발생한 오류를 처리할 수 있는 것이 아님을 명심해야한다.
 
        2. 오류의 표현
 스위프트에서 오류(Error)는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현된다. Error 프로토콜은 사실상 요구사항이 없는 빈 프로토콜일 뿐이지만, 오류를 표현하기 위한 타입(주로 열거형)은 이 프로토콜을 채택한다.
 
 스위프트의 열거형은 오류의 종류를 나타내기에 아주 적합하다. 연관 값을 통해서 오류에 관한 부가 정보를 제공할 수도 있다.
 */
//오류 예시
enum VendingMachineError: Error {
    case invalidSelection
    case insufficeintFunds(coinsNeeded: Int)
    case outOfStock
}
/**
 VendingMachineError 열거형을 살펴보면 Error 프로토콜을 채택함으로써 오류처리를 위한 타입임을 알 수 있다. 그리고 이 코드에서 오류 중류는 invalidSelection, insufficeintFunds, outOfStock 세 가지가 있다. 이처럼 열거형을 통해 오류의 종류를 표현하는 것이 가장 일반적이며 편리한 방법이다.
 
 이렇게 오류의 종류를 미리 예상한 다음, 오류 때문에 다음에 행할 동작이 정상적으로 진행되지 않을 때라면 오류를 던져(Throw Error)주면 된다. 오류를 던져줄 때는 throw 구문을 사용한다. 만약 자금이 부족하고 동전이 5개 더 필요한 상황이라면 throw VendingMachineError, insufficientFunds(coinsNeeded: 5)라고 오류를 던져줄 수 있다.
 
        3. 오류 포착 및 처리
 오류를 던질 수도 있지만 오류가 던져지 것에 대비하여 던져진 오류를 처리하기 위한 코드도 작성해야 한다. 예를 들어 던져진 오류가 무엇인지 판단하여 다시 문제를 해결한다든지, 다른 방법으로 문제 해결을 시도한다던지, 오류를 알리고 사용자에게 선택 권한을 넘기고 이후 동작을 결정하게 한다던지의 코드를 작성해야한다.
 
 스위프트에는 오류 처리를 위한 네 가지 방법이 있다.
 
    - 함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법
    - do-catch 구문을 이용하여 오류를 처리하는 방법
    - 옵셔널 값으로 오류를 처리하는 방법
    - 오류가 발생하지 않을 것이라고 확신하는 방법
 
 
        3.1. 함수에서 발생한 오류 알리기
 먼저 함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법이다. 함수가 오류를 던지면 프로그램 흐름이 바뀔 가능성이 매우 크다. 그러므로 어디서 오류를 던지고 받는가 결정하는 것이 중요하다. try 키워드로 던져진 오류를 받을 수 있다. try는 try, try?, try! 등으로 표현할 수 있다.
 
 함수, 메소드, 이니셜라지어의 매개변수 뒤에 throws 키워드를 사용하면 해당 함수, 메소드, 이니셜라이저는 오류를 던질 수 있다. 일반적으로 func cannotThrowErros() -> String처럼 표현하던 것에 func canThrowErros() throws -> String 처럼 throws 키워드를 명시하면 오류를 던질 수 있다. 이런 함수는 호출했을 때, 동작 도중 오류가 발생하면 자신을 호출한 코드에 오류를 던져서 오류를 알릴 수 있다.
 
    {
        throws는 함수나 메소드의 자체 타입에도 영향을 미친다. 즉, throws 함수나 메소드 같은 이름의 throws가 명시되지 않은 함수나 메소드와 구분된다. 또, throws를 포함한 함수, 메소드, 이니셜라이저는 일반 함수, 메소드, 이니셜라이저로 재정의할 수 없다. 반대로 일반 함수, 메소드 이니셜라이저는 throws 함수, 메소드, 이니셜라이저로 재정의할 수 있다.
    }
 */
//자판기 동작 도중 발생한 오류 던지기
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func dispense(snak: String){
        print("\(snak) 제공")
    }
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficeintFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snak: name)
    }
}

let favoriteSnacks = [
    "yj":"Chips",
    "sh":"Biscuit",
    "dw": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurcahsedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
    
let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurcahsedSnack = try PurcahsedSnack(name: "Biscuit", vendingMachine: machine)
//비스킷 제공

print(purchase.name)

//for(person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}
/**
 Biscuit 제공
 Biscuit
 yj Chips
 Chips 제공
 dw Chocolate
 
 ////error
 Playground execution terminated: An error was thrown and was not caught:
 __lldb_expr_13.VendingMachineError.invalidSelection

 
 위의 자판기 VendingMachine 클래스는 오류를 던질 수 있는 vend(itemNamed:)메소드가 있다. vend(itemNamed:) 메소드 내부에서는 오류가 발생했을 떄 흐름을 제어하기 위해서 guard를 통한 빠른 종료 구문을 사용한다. 특정 조건이 충족되지 않는다면 throws 키워드를 통해 오류를 던져서 오류가 발생했다는 것을 자신을 호출한 코드에 알린다.
 
 또한 vend(itemNamed:) 메소드가 오류를 던질 가능성이 있으므로, vend(itemNamed:) 메소드를 호출하는 함수 또한 오류를 던질 수 있어야 한다. 그래서 buyFavoriteSnack(person: vendingMachine:) 함수도 throws 키워드를 통해 오류를 던질 수 있는 함수로 구현해줘야 한다.
 
 오류를 던질 수 있는 함수, 메소드, 이니셜라이저를 호출하는 코드는 반드시 오류를 처리할 수 있는 구문을 작성해줘야한다. 그러나 위 예시에는 오류가 발생할 수 있는 메소드와 함수를 호출하면서도 try로 시도만 할 뿐 오류가 발생했을 때 처리할 수 있는 코드는 작성되어 있지 않다. 위 예시의 for-in 구문 내에서 buyFavoriteSnack(person:vendingMachine:) 함수 호출 중 오류가 발생한 후 적절한 처리를 해주지 않았기 때문에 다음 크도가 정상적으로 작동하지 않을 것이다. 이렇게 발생한 오류는 자신을 호출한 코드로 던져서 알릴 수는 있지만, 오류를 받은 코드가 적절히 오류를 처리해주지 ㅇ낳는다면 이후의 코드는 작동하지 않는다. 던져진 오류를 처리하는 방법에 대해서 알아보자
 
            3.2 do-catch 구문을 이용하여 오류처리
 다음은 do-catch 구문을 이용하여 오류를 처리하는 방법이다. 함수, 메소드, 이니셜라이저 등에서 오류를 던져주면 오류 발생을 전달받은 코드 블록은 do-catch 구문을 사용하여 오류를 처리해줘야한다. do 절 내부의 코드에서 오류를 던지면 catch 절에서 오류를 전달받아 적절이 처리해주면 된다.
 
        do {
            //try 오류 발생 가능 코드
            //오류가 발생하지 않으면 실행할 코드
        } catch 오류 패턴 1 {
            //처리 코드
        } catch 오류 패턴 2 where 추가 조건 {
            //처리 코드
        }
 catch 절에서는 catch 키워드 뒤에 처리할 오류의 종류를 써준다. 만약 catch 뒤에 오류의 종류를 명시하지 않고 코드 블록을 생성하면 블록 내부에 암시적으로 error라는 이름의 지역 상수가 오류의 내용으로 들어온다.
 */
func buyFavoriteSnackError(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}
struct PurchaseSnackError{
    let name: String
    init(name: String, vendingMachine: VendingMachine){
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}
func tryingVend(itemNamed: String, vendingMachine: VendingMachine){
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficeintFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요")
    } catch {
        print("그 외 오류 발생 :", error)
    }
}

let machineError: VendingMachine = VendingMachine()
machineError.coinsDeposited = 20

var purchaseError: PurchaseSnackError = PurchaseSnackError(name: "Biscuit", vendingMachine: machineError)

print(purchaseError.name)

purchaseError = PurchaseSnackError(name: "Ice Cream", vendingMachine: machine)
// 유효하지 않은 선택

print(purchaseError.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnacks)
    try buyFavoriteSnackError(person: person, vendingMachine: machineError)
}
/**
    위 예시는 이전 예시와 달리 던져진 오류를 do-catch 구문을 사용하여 처리하는 함수를 별도로 만들어줬다. 그에 따라 오류를 받아서 다시 던지던 함수들이 더 이상 다른 곳으로 오류를 던지지 않아도 되는 형태가 되었다. 더불어 오류를 적절히 처리해주자 코드가 중간에 중단되지 않고 끝까지 정상 동작하는 것을 볼 수 있다.
 
 
 
            3.3. 옵셔널 값으로 오류 처리
    try?를 사용하여 옵셔널 값으로 변환해서 오류를 처리할 수도 있다. try? 표현을 통해 동작하던 코드가 오류를 던지면 그 코드의 반환 값을 nil이 된다.
 */
//옵셔널 값으로 오류 처리
func someThrowingFunction(sholudThrowError: Bool) throws -> Int {
    if sholudThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    return 100
}

let x: Optional = try? someThrowingFunction(sholudThrowError: true)
print(x)
let y: Optional = try? someThrowingFunction(sholudThrowError: false)
print(y)

/**
    위 예시에서 try? 표현을 사용하여 함수가 오류를 던지면 반환값을 nil로 반환하고 아니면 옵셔널을 반환한다. 이렇게 do-catch를 사용하지 않아도 옵셔널로 오류를 처리할 수 있다. 여기서 주목할 점은 someThrowingFunctions(shouldThrowError:)의 반환 타입이 Int라고 try?표현을 쓰면 옵셔널이 된다는 점이다.
 
 */
struct Data {
    
}
func fetchDataFromDisk() throws -> Data?{
    enum Errors: Error{
        case makeError
    }
    throw Errors.makeError
    return nil
}
func fetchDataFromServer()  throws -> Data?{
    enum Errors: Error{
        case makeError
    }
    throw Errors.makeError
    return nil
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
/**
    fetchData의 반환 타입을 옵셔널로 정의했다. 즉, 함수 내부에서 제대로 처리가 이뤄지지 않으면 nil이 될 수 있음을 내포하는 것이다.
 
 
 
 
            3.4. 오류가 발생하지 않을 것이라 확신하는 방법
    오류를 처리하는 마지막 방법으로는 오류가 발생하지 않을 것이라고 확신을 갖고 처리하는 방법이다. 코드를 작성하는 프로그래머가 오류를 던질 수 있는 함수 등을 호출할 때 오류가 절대로 발생하지 않을것이라고 확신할 수 있는 상황이라면 오류가 발생하지 않을 것이라는 전제 하에 try! 표현을 사용할 수 있다. 이 표현은 다른 느낌표 표현( 암시적 추출 옵셔널, 강제 타입 캐스팅 등)과 마찬가지로 실제 오류가 발생하면 런타임 오류가 발생해서 프로그램이 강제로 종료된다.
 */
//오류가 발생하지 않음을 확신하여 오류 처리
/**
 func someThrowingFunction(sholudThrowError: Bool) throws -> Int {
     if sholudThrowError {
         enum SomeError: Error {
             case justSomeError
         }
         
         throw SomeError.justSomeError
     }
     return 100
 }
 */
let z: Int = try! someThrowingFunction(sholudThrowError: false)
print(z)

//let k: Int = try! someThrowingFunction(sholudThrowError: true)

/**
 
        3.5. 다시 던지기
 함수나 메소드는 rethrows 키워드를 사용하여 자신의 매개변수로 전달받은 함수가 오류를 던진다는 것을 나타낼 수 있다. rethrows 키워드를 사용하여 다시 던지기(Rethrowing) 가 가능하게 하려면 최소 하나 이상의 오류 발생 가능한 함수를 매개변수로 전달받아야한다.
 */
// 오류를 던지는 함수
func someThrowingFunction2() throws {
    enum SomeError: Error {
        case someError
    }
    
    throw SomeError.someError
}


//다시 던지기 함수
func someFunction2(callback: () throws -> Void) rethrows {
    try callback() //다시 던질 뿐 따로 처리는 하지 않는다.
}

do {
    try someFunction2(callback: someThrowingFunction2)
} catch {
    print(error)
}
//justSomeError
/**
    다시 던지기 함수 또는 메소드는 기본적으로 스스로 오류를 던지지 못한다. 즉, 자신 내부에 직접적으로 throw 구문을 사용할 수 없다. 그러나 catch절 내부에서는 throw 구문을 작성할 수 있다. 그러나 catch 절 내부에서는 throw 구문을 작성할 수 있다. 다시 던지기 함수나 메소드가 오류를 던지는 함수를 do-catch 구문 내부에서 호출하고 catch 절 내부에서 다른 오류를 던짐으로써 오류를 던지는 함수에서 발생한 오류를 제어할 수 있다. 다시 던지기 내부의 catch 절에서는 다시 던지기 함수의 매개변수로 전달받은 오류 던지기 함수만 호출하고 결과로 던져진 오류만 제어할 수 있다.
 */
func someThrowingFunction3() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

func someFunction3(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        //매개변수로 전달한 오류 던지기 함수이므로 catch에서 제어 가능
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    
//    do{
//        //매개변수로 전달한 오류 던지기 함수가 아니므로 catch에서 제어 불가능
//        try someFunction3 ()
//    } catch {
//        //오류
//        throw AnotherError.justAnotherError
//    }

//    catch 절 외부에서 단독으로 오류 던질 수 없음
//    throw AnotherError.justAnotherError
}

/**
 부모클래스의 다시 던지기 메소드(rethrows메소드)는 자식 클래스에서 던지기 메소드 (throws 메소드)로 재정의할 수 없다. 그러나 부모클래스의 던지기 메소드는 자식 클래스에서 다시 던지기 메소드로 재정의할 수 있다.
 
 그리고 만약 프로토콜 요구사항 중에 다시 던지기 메소드가 있다면, 던지기 메소드를 구현한다고 해서 요구사항을 충족시킬 수는 없다. 그러나 프로토콜 요구사항 중에 던지기 메소드가 있다면 다시 던지기 메소드를 구현하여 요구사항을 충족시킬 수 있다.
 */
//프로토콜 상속에서 던지기 함수와 다시 던지기 함수
protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}
class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws {}
    func SomeFunction(callback: () throws -> Void) rethrows { }
    
    //던지기 메소드는 다시 던지기 메소드를 요구하는 프로토콜을 충족할 수 없다.
    //오류
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {}
    
    //다시 던지기 메소드는 던지기 메소드를 요구하는 프로토콜의 요구 사항에 부합한다.
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws {}
}

class SomeChildClass: SomeClass {
    //부모클래스의 던지기 메소드는 자식클래스에서 다시 던지기 메소드로 재정의 할 수 있다.
    override func someThrowingFunction(callback: () throws -> Void ) rethrows {}
    
    //부모 클래스의 다시 던지기 메소드는 자식 클래스에서 던지기 메소드로 재정의할 수 없다.
    //오류
//    override func someFunction(callback: () throws -> Void) throws {}
}

/**
 위의 SomeProtocol에서 요구한 던지기 함수 someThrowingFunctionFromProtocol(callback:) 과 던지기 함수 someRethrowingFunctionFromProtocol(callback:)을 각각 다시 던지기와 던지기 함수로 구현했다. 던지기 메소드는 다시 던지기에 부합하지만 다시 던지기는 던지기에 부합하지 않는다. 또, 부모 클래스의 던지기는 자식 클래스에서 다시 던지기로 재정의 할 수 있지만 부모의 다시 던지기는 자식에서 던지기로 재정의할 수 없다.
 
 
            3.6 후처리 defer
 
 defer 구문을 사용하여 현재 코드 블록을 나가기 전에 꼭 실행해야하는 코드를 작성할 수 있다. 즉, defer 구문은 코드가 블록을 어떤식으로 빠져나가든 간에 꼭 실행해야하는 마무리 작업을 할 수 있도록 도와준다. 그 말인즉슨, 오류가 발생하여 코드 블록을 빠져나가는 것이든, 정상적으로 코드가 블록을 빠져나가는 것이든 간에 defer 구문은 코드가 블록을 빠져나가기 전에 무조건 실행하는 것을 보장한다.
 
 
 예를 들어 함수 내에서 파일을 열어 사용하다가 오류가 발생하여 코드가 블록을 빠져나가더라도 파일을 정상적으로 닫아 메모리에서 해제해야하기 때문에 defer 구문 내부에는 파일을 닫는 코드를 작성해줘서 정상적으로 파일이 메모리에서 해제될 수 있도록 해야한다.
 
        {
                defer 구문과 오류 처리
            defer은 꼭 오류 처리에만 사용하는 것은 아니지만 오류 처리에서 유용하게 쓰인다. defer은 오류 처리 상황뿐만 아니라 함수, 메소드, 반복, 조건문 등등 보통의 코드 블록 어디든 사용할 수 있다.
    
        }
 */


for i in 0...2 {
    defer {
        print("A", terminator: " ")
        
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
}
/**
 // 파일 쓰기 예제에서 defer
 
 func writeData() {
     let file = openFile()
     
     //함수 코드 블록 빠져나가기 전 무조건 실행되며, 파일을 닫아 줌
     defer {
         closeFile(file)
     }
     
     if ... {
         return
     }
     if ... {
         return
     }
     // 처리 끝
 }
 
 만약 defer 구문이 없었다면 아래와 같은 중복된 코드가 많아질 것이다.
 
 func writeData() {
  let file = openFile()
  
  if ... {
  closeFile(file)
  return
  }
  
  if ... {
  closeFile(file)
  return
  }
  
  closeFile(file)
  // 처리 끝
 }
 
 
 defer 구문은 현재 코드 범위를 벗어나기 전까지 실행을 미루고(defer) 있다가 프로그램 실행 흐름이 코드 범위를 벗어나기 직전 실행된다. defer 구문 내부에는 break, return 등과 같이 구문을 빠져나갈 수 있는 코드 또는 오류를 던지는 코드를 작성하면 안된다. 여러 개의 defer 구문이 하나의 범위 속해있다면 맨 마지막에 작성한 것에서 역순으로 처리한다.
 */
 
func someThrowingFunction2(shouldThrowError: Bool) throws -> Int {
    defer{
        print("FIRST!")
    }
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    defer{
        print("Second!")
    }
    defer{
        print("Third!")
    }
    return 100
}
 print("\n")
try? someThrowingFunction2 (shouldThrowError: true)
print("\n")
try? someThrowingFunction2 (shouldThrowError: false)
/**
 
    그런데, do 구문을 catch 절과 함께 사용하지 않고 단독으로 사용할 수도 있다. 코드 블록 내부에 또 한 단계 하위 블록을 만들고자 할 때이다. 이럴 때는 하위 블록이 종료될 때 그 내부의 defer가 실행된다. 아래에서 defer이 여러 개 존재할 때 어떤 순서로 실행되는지 확인해보자
 */
func someFunction4() {
    print("1")
    defer{
        print("2")
    }
    do {
        defer {
            print("3")
        }
        print("4")
    }
    defer {
        print("5")
    }
    print("6")
    
}
 someFunction4()
/**
  이처럼 스위프트는 오류를 처리하는 다양한 방법을 제공하며, 다른 기능과도 조합하여 사용할 수 있다. 스위프트 표준 라이브러리의 함수나 메소드 등에도 throws와 rethrows 키워드가 종종 발견된다. 언제 어떻게 오류를 던져줄지 잘 생각해보면 스위프트에 대한 이해도도 높아질 것이다. 
 */
