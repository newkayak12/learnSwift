/**
            > 메모리 안전
 스위프트는 안전을 중요시하는 언어이다. 그래서 컴파일러가 코드에서 위험을 줄일 수 있도록 많은 장치를 두었다. 그 중 큰 부분을 차지하는 것이 메모리의 안전한 접근이다. 변수를 사용하기 전에 초기화를 강제하고, 해제된 메모리에 접근할 수 없도록 설계된 것들이 대표적인 예시이다.
 스위프트는 메모리를 자동으로 관리하기 때문에 특별한 경우가 아니라면 프로그래머가 메모리의 접근에 대해 크게 신경쓸 필요가 없다. 그렇지만 메모리 접근 중 출돌할 수 있는 상황을 이해해두면 메모리가 충돌할 만한 상황을 피할 수 있다.
 
 
 
            1. 메모리 접근 충돌의 이해
 프로그래머가 변수에 값을 할당한다던가 함수의 전달인자로 변수의 값을 전달하는 등 다양한 경우에 코드를 통해 메모리에 접근하게 된다.
 */
//코드를 통해 메모리에 접근하는 유형
var one: Int = 1
//저장된 메모리 위치에 읽기 접근
print("숫자 출력 : \(one)")
/**
 메모리 접근 충돌은 서로 다른 코드에서 동시에 같은 위치의 메모리에 접근할 때 발생한다. 동시에 여러 접근을 하게 되면 예상치 못한 결과를 얻을 수 있다. 예를 들어서 어떤 인스턴스 내부의 여러 프로퍼티의 값을 합산하여 반환하는 함수가 있을 때 외부의 한 코드에 인스턴스의 프로퍼티 값 일부를 수정을 하고, 동시에 또 다른 어딘가의 코드에서 합산하여 결과를 돌려주는 함수를 호출한다면 그 결과를 예측할 수 있을까?
 
 동시에 일어나는 일이라면 수정 전의 합산 결과를 돌려줄지, 수정된 값의 합산 결과를 돌려줄지 누구도 장담할 수 없다. 이런 일이 발생하지 않을 것이라고 생각하지만 멀티 쓰레드를 다루면 흔히 겪을 수 있다.
 
            1.1. 메모리 접근의 특성
 메모리 접근 충돌을 일으키는 메모리 접근에는 세 가지 특성이 있다. 다음의 세 가지 조건에 모두 해당하는 메모리 접근이 두 군데 이상의 코드에서 동시에 일어나면 메모리 접근 충돌이 발생한다.
 
    - 최소한 한 곳에서 쓰기 접근한다.
    - 같은 메모리 위치에 접근한다.
    - 접근 타이밍이 겹친다.
 
 순차적으로 코드를 실행하고, 메모리에 접근하는 것이 순간적이라면 다른 코드에서 같은 메모리 위치에 동시에 접근할 일이 없다. 단일 쓰레드 환경 대부분의 메모리 접근이 순간적 접근이고 동시에 다른 코드에서 접근한 일이 없다.
 */
//순차적, 순간적 메모리 접근
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber)
/**
 반면에 장기적 메모리 접근이라는 접근 방식도 있다. 장기적 메모리 접근 중에는 해당 메모리 접근이 끝나기 전에 다른 코드에서 메모리에 접근할 가능성 있다. 접근 타이밍이 겹치게 되는 것이다.
 
 접근 타이밍이 겹치게 되는 대표적 상황은 함수나 메소드에서 inout을 사용한 입출력 매개변수를 사용하는 경우나 구조체에서 mutating 키워드를 사용하는 가변 메소드를 사용하는 경우이다. 메모리의 같은 위치에 접근하는 여러 접근의 타이밍이 겹치는 경우 대개 메모리 접근 충돌이 발생할 가능성이 크다. 메모리 접근 충돌을 코드에서 정적으로 예측할 수 있는 경우 컴파일러에서 오류로 취급하여 컴파일하지 않는다.
 
 */
// 특정 변수나 상수의 메모리 주소를 알고 싶다면 아래의 예제를 찾고하자. 해당 변수의 메모리 주소가 다른 변수의 메모리 주소와 같다면 두 변수는 서로 같은 메모리 위치를 참조하게 된다.

// 값 타입의 경우
var numberSet: Int = 100
//print(Unmanaged<AnyObject>.fromOpaque(&numberSet).toOpaque())

//참조 타입의 경우
class SomeClass {}
var object: SomeClass = SomeClass()
//print(Unmanaged<AnyObject>.passUnretained(object).toOpaque())

/**
            2. 입출력 매개변수에서의 메모리 접근 충돌
 
 입출력 매개변수를 갖는 함수는 동작 중 모두 장기적 메모리 접근을 한다. 즉, 함수의 실행과 동시에 입출력 매개변수의 쓰기 접근이 시작되고 함수가 종료될 때까지 쓰기 접근을 유지한다. 함수가 종료될 때 쓰기 접근을 종료한다.
 입출력 매개변수를 통한 장기적 메모리 접근 중에는 매개변수로 전달하는 변수는 다른 접근이 제한된다.
 */
var step: Int = 1
func increment(_ number: inout Int) {
    number += step
}
//increment(&step)
/**
 Simultaneous accesses to 0x1057c4240, but modification requires exclusive access.
 Previous access (a modification) started at  (0x1057c88e8).
 Current access (a read) started at:
 0    libswiftCore.dylib                 0x000000018f9af0d0 swift::runtime::AccessSet::insert(swift::runtime::Access*, void*, void*, swift::ExclusivityFlags) + 428
 1    libswiftCore.dylib                 0x000000018f9af2f0 swift_beginAccess + 72
 4    06.memorySafe                      0x0000000102e873c8 main + 0
 5    CoreFoundation                     0x0000000180361f80 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 20
 6    CoreFoundation                     0x00000001803610d0 __CFRunLoopDoBlocks + 408
 7    CoreFoundation                     0x000000018035b730 __CFRunLoopRun + 764
 8    CoreFoundation                     0x000000018035afdc CFRunLoopRunSpecific + 572
 9    GraphicsServices                   0x000000018c25f56c GSEventRunModal + 160
 10   UIKitCore                          0x0000000184d886b8 -[UIApplication _run] + 992
 11   UIKitCore                          0x0000000184d8d5c4 UIApplicationMain + 112
 12   06.memorySafe                      0x0000000102e873c8 main + 192
 Fatal access conflict detected.
 */

/**
    step 변수는 increment(_:) 함수의 입출력 매개변수로 전달되었는데 함수 내부에서 같은 메모리 공간에 일긱 접근을 시도하기 때문에 메모리 접근 충돌이 발생한다. 그래서 위 코드를 실행하면 런타임 오류가 발생한다. 이런 경우 아래처럼 새로운 변수를 생성해서 해결할 수 있다.
 */

//입출력 매개변수에서의 메모리 접근 충돌 해결
var step2: Int = 1
var copyOfStep: Int = step2

func increment2(_ number: inout Int){
    number += copyOfStep
}
increment(&step2)
/**
 입출력 매개변수에서 메모리 접근 충돌이 발생할 수 있는 다른 예를 들자면 두 개 이상의 입출력 매개변수로 같은 변수를 전달하는 상황을 들 수 있다.
 */
//복수의 입출력 매개변수로 하나의 변수를 전달하여 메모리 접근 충돌
func balance(_ x: inout Int, _ y: inout Int){
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)
//balance(&playerOneScore, &playerOneScore)
/**
    위 예시에서 첫 번쨰 함수 호출의 경우 각각 다른 변수 입출력 매개변수로 전달하여 문제가 없지만 두 번째는 같은 변수를 동시에 전달하여 메모리 접근 충돌이 발생한다. 왜냐하면 playerOneScroe라는 변수의 메모리 위치를 함수가 실행되는 동안 장기적 접근을 시도하기 때문에 문제가 발생한다. 이 경우 컴파일러에서 미리 컴파일 오류로 알려준다.
 
 
 
 
                           3. 메소드 내부에서 self 접근의 출돌
   구조체의 가변 메소드는 메소드 실행 중에 self에 쓰기 접근을 한다. 게임 캐릭터를 구조체로 구현했다고 생각했을 때, 캐릭터가 상처를 입으면 체력이 떨어진다. 체력을 회복하는 메소드와 체력을 다른 캐릭터와 공유하는 메소드를 만들고 아래처럼 표현하면
 */
//게임 캐릭터를 정의한 GamePlayer 구조체
struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func resotreHealth() {
        self.health = GamePlayer.maxHealth
    }
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}
/**
    위 예시에서 restoreHealth() 메소드는 실해 중 인스턴스 잔신인 self에 장기적으로 쓰기 접근을 한다. 현재 restoreHealth() 메소드는 내부의 코드 중 인스턴스의 다른 프로퍼티를 동시에 접근하는 코드가 없다. 반면에 shareHealth(with:) 메소드는 다른 캐릭터의 인스턴스를 입출력 매개변수로 받기 때문에 메모리 접근 충돌이 발생할 여지가 있다.
 */
// 메모리 접근 충돌이 없는 shareHealth(with:) 메소드 호출
var oscar: GamePlayer = GamePlayer(name: "oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "maria", health: 5, energy: 10)

oscar.shareHealth(with: &maria)
/**
    위 예시에서 shareHealth(with:) 메소드의 호출은 메모리 접근 충돌을 일으키지 않는다. teammate 매개변수로 전달된 maria는 shareHealth(with:) 메소드가 실행되는 중에 쓰기 접근을 하고, 가변 메소드를 실행해야 하는 oscar도 쓰기 접근을 한다. 하지만 서로 다른 메모리 위치에 있기 때문에 메모리 접근 충돌이 발생하지 않는 것이다.
 
    그렇지만 아래와 같이 teammate 입출력 매개변수로 전달받은 메모리 위치와 oscar인스턴스 메모리 위치가 같기에 동시에 쓰기접근을 하면 접근 충돌이 발생한다.
 */
//oscar.shareHealth(with: &oscar)

/**
        4. 프로퍼티 접근 중 충돌
 구조체, 열거형 등은 프로퍼티로 구성되고, 튜플은 요소의 모임으로 구성된다. 이 프로퍼티나 요소는 각각 독립적인 값을 가진 타입의 구성 요소이다. 구조체, 열거형, 튜플 등은 값 타입이다. 그래서 자신의 인스턴스 내부에 프로퍼티를 변경한다는 뜻은 자신 스스로의 값을 변경한다는 의미로도 생각할 수 있다. 그말은 프로퍼티에 읽고 쓰기를 위한 접근을 하는 것은 인스턴스 자신 전체에 대한 읽고 쓰기 접근 권한이 필요하다는 뜻이다.
 */
//프로퍼티 접근 중 메모리 접근 충돌
//balance(&oscar.health, &oscar.energy)
/**
 imultaneous accesses to 0x106b5c408, but modification requires exclusive access.
 Previous access (a modification) started at  (0x106b61128).
 Current access (a modification) started at:
 0    libswiftCore.dylib                 0x000000018f9af0d0 swift::runtime::AccessSet::insert(swift::runtime::Access*, void*, void*, swift::ExclusivityFlags) + 428
 1    libswiftCore.dylib                 0x000000018f9af2f0 swift_beginAccess + 72
 3    06.memorySafe                      0x000000010421f3c8 main + 0
 4    CoreFoundation                     0x0000000180361f80 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 20
 5    CoreFoundation                     0x00000001803610d0 __CFRunLoopDoBlocks + 408
 6    CoreFoundation                     0x000000018035b730 __CFRunLoopRun + 764
 7    CoreFoundation                     0x000000018035afdc CFRunLoopRunSpecific + 572
 8    GraphicsServices                   0x000000018c25f56c GSEventRunModal + 160
 9    UIKitCore                          0x0000000184d886b8 -[UIApplication _run] + 992
 10   UIKitCore                          0x0000000184d8d5c4 UIApplicationMain + 112
 11   06.memorySafe                      0x000000010421f3c8 main + 192
 Fatal access conflict detected.
 
 
 
 위 balance(_:_:) 함수의 두 매개변수는 모두 입출력 매개변수이므로 함수가 실행 중이면 두 매개변수 모두 쓰기 접근을 한다. oscar의 프로퍼티인 health만 매개변수로 전달했더라도 oscar 인스턴스 자체의 값이 변경될 것을 의미하므로 oscar 인스턴스 자체에 쓰기 접근을 해야한다. 이와 마찬가지로 두 번쨰 입출력 매개변수로 oscar.energy 프로퍼티를 전달하더라도 oscar 인스턴스의 쓰기 접근을 해야하므로 두 접근이 충돌할 수밖에 없다.
 
 위와 같은 예시는 전역변수 일때 자주 발생한다. 우리가 자주 사용하는 지역변수를 사용하면 이야기가 조금 달라진다. 만약 위 변수가 특정 함수나 메소드, 반복문, 조건문 등의 안에서 쓰이는 지역변수일 경우
 */
func localFunction(){
    var oscar = GamePlayer(name: "oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}
/**
 위 지역 변수는 balance(_:_:) 함수가 실행 되는 도중 다른 곳에서 해당 메모리 위치에 접근하려는 코드가 있을 수 있을까? 자세히 말하면 내부에 생성된 변수는 다른 코드에서 어디서든 쓰였던 전역변수와 달리 다른 위치의 코드에서 접근할 일이 없다. 위 함수 안에서 balance(_:_:) 함수의 매개변수로 지역변수를 전달하였음에도 불구하고 지역변수로 쓰이던 oscar은 현재 함수 안에서 순차적 실행될 코드 외의 영역에서 접근할 코드가 없기 때문에 다른 코드에서 oscar의 메모리 위치에 접근하여 문제가 발생할 여지가 없다.
 
 balance(_:_:) 함수 안에서만 oscar의 메모리 위치에 접근하면 되는 상황이다. 이런 상황이면 문제가 될 것이 없다. 컴파일러도 이를 문제시 하지 않는다.
 
 메모리 안전 때문에 구조체의 프로퍼티 메모리에 접근하는 타이밍이 겹치는 것을 무조건 제한해야하는 것은 아니다. 특히 아래의 세 가지 경우를 충독하면 구조체의 프로퍼티 메모리에 동시에 접근해도 안전이 보장된다.
 
    - 연산 프로퍼티나 클래스 프로퍼티가 아닌 인스턴스의 저장 프로퍼티에만 접근
    - 전역 변수가 아닌 지역 변수
    - 클로저에 의해 획득되지 않았거나 비탈출 클로저에 의해서만 획득됐을 때
 
 앞의 새 조건을 충족하지 않는 경우에는 컴파일러가 안전을 담보할 수 없기 때문에 접근을 제한할 수 있도록 오류로 취급한다.
 
 */
