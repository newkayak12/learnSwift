/**
        > 불명확 타입
 
 반환 타입에 불명확 타입(Opaque Types)을 사용하면 반환할 타입의 정확한 타입을 알려주지 않은 채로 반환하겠다는 것을 의미한다.
 프로퍼티나 서브스크립트의 선언 혹은 함수의 반환 타입 위치에 프로토콜을 쓰면서 앞에 some 을 붙이면 ' 이 프로토콜을 준수하는 어떤 타입 주엥 하나일 것은 분명하다 ' 는 뜻이된다. 제네릭과 비슷해보이지만 다르다. 제네릭은 정의해줄 때 정확히 어떤 타입이 들어올지 모르는 상태에서 플레이스 홀더를 만든다. 불명확 타입은 반대로 외부에서는 어떤 타입이 나에게 반환될지 모른다. 다시 말하면 제네릭은 외부에서 타입을 정해주는것, 불명확타입은 내부에서 타입을 정해서 내보내는데 밖에서는 명확한 타입을 몰라도 쓸 수 있다는 것이다. 그래서 역제네릭 타입(Reverse Generic Type)이라고 한다. 굳이 제네릭과의 공통점을 찾으면 플레이스 홀더 타입과 불명확 타입의 반환 타입을 프로토콜로 좁혀줄 수 있다는 정도이다.
 
 즉, '프로토콜을 준수하는 타입을 뱉을 건데 어떤 것일지는 모르겠다.' 정도라고 볼 수 있다. 예시로 프로토콜 정의부에 associatedType을 사용했거나 Self 타입을 사용하는 프로토콜이라면 타입 자체가 제네릭하게 되므로 반환 타입으로 사용할 수 없는 경우를 들 수 있다.
 
 여로 종류의 피규어를 임의롤 뱉는 기계가 있다고 할때 포장을 열기 전까지는 뭐가 들었는지 모르는 경우를 예시로 들어보자
 */
//뽑기 상품 프로토콜 정의
// 포장된 상품 프로토콜 정의
protocol WrappedPrize {
    associatedtype Prize
    
    var wrapColor: String! { get }
    var prize: Prize! { get }
}

protocol Gundam {}
protocol Pokémon {}

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: Prize!
}

struct WrappedPokémon : WrappedPrize {
    var wrapColor: String!
    var prize: Prize!
}

struct PrizeMachine {
    /**
        WrappedPrize는 제네릭 타입 제약이 있어야만 사용할 수 있는 타입이기에 WrappedPrize 만으로 반환 타입이 될 수 없다. WrappedPrize와 Prize 간 힌트가 없기 때문이다. 그래서 불명확 타입 some을 붙여준다.
     */

//    func dispenseRandomPrize() -> WrappedPrize {
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()
print(wrappedPrize)
/**
 이처럼 외부에서는 정확한 타입을 알 수 없지만, 해당 프로토콜을 준수하는 어떤 타입인가를 반환한다는 약속을 불명확 타입으로 표현할 수 있다. 불명화가 타입은 함수(메소드)의 반환 타입뿐만 아니라 프로퍼티나 서브스크립트 타입에서도 사용할 수 있다.
 */
