import UIKit

/**
        접근 제어
 객체지향 프로그래밍 패러다임에서 은닉화는 중요한 개념 중 하나이다.
 
    1. 접근제어란
 접근제어는 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간의 접근을 제한할 수 있는 기능이다. 접근 제어를 통해 상세 구현은 숨기고 허용된 기능만 사용하는 인터페이스를 제공할 수 있다.
 
    1.1 접근 제어의 필요성
 객체지향 프로그래밍 패러다임에서 중요한 캡슐화와 은닉화를 구현하는 이유는 외부에서 보거나 접근하면 안 되는 코드가 있기 때문이다. 불필요한 접근으로 의도치 않은 결과를 초래하거나 꼭 필요한 부분만 제공을 해야하는데 전체 코드가 노출될 가능성이 있을 때 접근 제어를 이용한다.
 
    1.2 모듈과 소스파일
 스위프트의 접근 제어는 모듈과 소스파일을 기반으로 설계되었다. 모듈(module)은 배포할 코드의 묶음 단위이다. 통상 하나의 프레임워크(Framework)나 라이브러리(Library) 또는 애플리케이션(Application)이 모듈 단위가 될 수 있다. 스위프트에서는 import 키워드를 사용해서 불러온다.
 소스 파일은 하나의 스위프트 소스 코드 파일을 의미한다. 자바나 Objective-C와 같은 기존의 프로그래밍 언어에서는 통상 파일 하나에 타입을 하나만 정의한다. 스위프트에서도 보통 하나의 파일에 하나의 타입만 정의하지만, 때로는 소스파일 하나에 여러 타입( 여러 개의 클래스나 구조체, 열거형 등)이나 함수 등 많은 것을 정의하거나 구현할 수도 있다.
 
 
    2 접근 수준
 접근제어는 접근 수준(Access Level) 키워드를 통해 구현할 수 있다. 각 타입(클래스, 구조체, 열거형 등)에 특정 접근 수준을 지정할 수 있고, 타입 내부의 프로퍼티, 메소드, 이니셜라이저, 서브스크립트 각각에도 접근 수준을 지정할 수 있다. 접근 수준을 명시할 수 있는 키워드는 open, public, internal, fileprivate, private 다섯 가지가 있다.
 
        접근 수준          키워드     접근도     범위           비고
      개방 접근 수준        open      높음    모듈 외부까지  클래스에서만 사용
      공개 접근 수준        public     ↑     모듈 외부까지
      내부 접근 수준       internal    ⎮     모듈 내부
파일외부 비공개 접근 수준   fileprivate   ⎮     파일 내부
     비공개 접근 수준       private     ↓    기능 정의 내부
 
 
    2.1 공개 접근 수준 (public)
 public은 어디서든 쓰일 수 있다. 자신이 구현된 소스 파일은 물론, 그 소스파일이 속해 있는 모듈, 그 모듈을 가져다쓰는 모듈 등 모든 곳에서 할 수 있다. 공개(public) 접근 수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 만힝 쓴다. 우리가 사용하는 스위프트 기본 요소는 모두 공개 접근 수준으로 구현되어 있다.
 
     ///A value type whose instances are either "true" or "false".
     public struct Bool{
      /// Default-initalize Boolean value to 'false'
         public init(){
             
         }
     }
 
 
 
 
    2.2 개방 접근 수준 (open)
 open 키워드로 지정할 수 있는 개방(open) 접근 수준은 공개 접근 수준 이상으로 높은 접근 수준이며, 클래스와 클래스의 멤버에서만 사용할 수 있다. 기본적으로 공개 접근 수준과 비슷하지만 아래와 같은 차이점이 있다.
 
    > 개방 접근수준을 제외한 다른 모든 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속할 수 있다.
    > 개방 접근수준을 제외한 다른 모든 접근 수준의 클래스는 멤버는 해당 멤버가 정의된 모듈 안에서만 재정의 할 수 있다.
    > 개방 접근수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있다.
    > 개방 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의할 수 있다.
 
 클래스를 개방 접근 수준으로 명시하는 것은 그 클래스를 다른 모듈에서도 부모 클래스로 사용하겠다는 목적으로 클래스를 설계하고 코드를 작성했음을 의미한다.
 
    open class NSString: NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
        open var length: Int { get }
        open func character(at index: Int) -> unichar
        public init()
        public init?(coder aDecoder: NSCoder)
    }
 
 
    2.3 내부 접근 수준 (internal)
 internal 키워드로 지정하는 내부(internal) 접근 수준은 기본적으로 모든 요소에 암묵적으로 지정하는 기본 접근 수준이다. 내부 접근수준으로 지정된 요소는 소스파일이 속해 있는 모듈 어디에서든 쓸 수 있다. 다만 그 모듈을 가져다 쓰는 외부 모듈에는 접근할 수 없다. 보토 ㅇ외부에서 사용할 클래스나 구조체가 아니며, 모듈 내부에서 광역적으로 사용할 경우 내부 접근 수준을 지정한다.
 
 
 
    2.4 파일외부비공개 접근 수준(fileprivate)
 파일외부비공개(fileprivate) 접근 수준으로 지정된 요소는 그 요소가 구현된 소스파일 내부에서만 사용할 수 있다. 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 있는 경우에 사용하면 좋다.
 
 
 
    2.5 비공개 접근 수준 (private)
 비공개(private) 접근 수준은 가장 한정적인 범위이다. 비공개 접근수준으로 지정된 요소는 그 기능을 정의하고 구현한 범위 내에서만 사용할 수 있다. 비공개 접근 수준으로 지정한 기능은 같은 소스 파일 안에서 구현한 다른 타입이나 기능에서도 사용할 수 없다.
 
 
 [ 모듈(Module   [ 소스 파일(Source file)   [ 기능 정의(Functaionality declartion)   private ]   fileprivate]    internal]   public/open
 > 각 접근수준의 접근 범위
 
            
 
 
 
    3. 접근제어 구현
 접근 제어는 접근 수준을 지정해서 구현할 수 있다. 각각의 접근수준을 요소 앞에 지정해주기만 하면된다. internal은 기본 접근 수준이므로 굳이 표기해주지 않아도 된다.
 */

open class OpenClass{
    open var openProperty: Int = 0;
    public var publicProperty: Int = 0;
    internal var internalProperty: Int = 0
    fileprivate var fileprivateProperty: Int = 0;
    private var privateProperty: Int = 0;
    
    open func openMethod(){}
    public func publicMethod(){}
    internal func internalMethod(){}
    fileprivate func fileprivateMethod(){}
    private func privateMethod(){}
}

public class PublicClass {}
public struct PublicStruct {}
public enum PublicEnum{}
public var publicVariable = 0
public let publicConstant = 0
public func publicFunction(){}


internal class InternalClass{}
internal struct InternalStruct{}
internal enum InternalEnum {}
var internalVariable = 0  //internal은 기본이다.
let internalConstant = 0;
func internalFunction(){}


fileprivate class FilePrivateClass{}
fileprivate struct FilePrivatesStruct {}
fileprivate enum FilePrivateEnum {}
fileprivate var fileprivateVariable = 0
fileprivate let fileprivateConstant = 0
fileprivate func fileprivateFunction(){}

private class PrivateClass{}
private struct PrivateStruct{}
private enum PrivateEnum{}
private var privateVariable = 0;
private let privateConstant = 0;
private func privateFunction() {}


/**
    4. 접근제어 구현 참고사항
 모든 타입에 적용되는 접근 수준의 규칙은 '상위 요소보다 하위 요소가 더 높은 접근수준을 가질수 없다.'이다.
 */
