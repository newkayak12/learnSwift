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

for(person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}
/**
 Biscuit 제공
 Biscuit
 yj Chips
 Chips 제공
 dw Chocolate
 
 ////error
 Playground execution terminated: An error was thrown and was not caught:
 __lldb_expr_13.VendingMachineError.invalidSelection

 */
