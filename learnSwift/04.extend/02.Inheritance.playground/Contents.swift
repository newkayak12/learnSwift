/**
        > 상속
 클래스는 메소드나 프로퍼티 등을 다른 클래스로부터 상속받을 수 있다. 어떤 클래스로부터 상속을 받으면 상속받은 클래스는 그 어떤 클래스의 자식 클래스(Subclass/Child-class)라는 표현한다. 자클래스에게 자신의 특성을 물려준 클래스를 부모 클래스(Superclass/ Parent-class)라고 표현한다. 상속은 스위프트의 다른 타입과 클래스를 구별 짓는 클래스만의 특징이다.
 
 스위프트의 클래스는 부모클래스로부터 물려받은 메서드를 호출할 수 있고 프로퍼티에 접근할 수 있으며 서브스크립트도 사용할 수 있다. 또 부모클래스로부터 물려받은 메소드, 프로퍼티, 서브스크립트 등을 자신만의 내용으로 재정의할 수도 있다. 스위프트는 부모 클래스의 요소를 자식클래스에서 재정의할 때 자식 클래스가 부모 클래스의 요소들을 재정의한다는 것을 명확히 해줘야한다.
 
 상속받은 프로퍼티에 프로퍼티의 값이 벼녁ㅇ되었을 때 알려주는 프로퍼티 옵저버도 구현할 수 있다. 연산 프로퍼티를 정의해준 클래스에서는 연산 프로퍼티에 프로퍼티 옵저버를 구현할 수 없지만, 부모클래스에서 연산 프로퍼티로 정의한 프로퍼티든 저장프로퍼티로 정의한 프로퍼티든 자식클래스에서는 프로퍼티 감시자를 구현할 수 있다.
 
 다른 클래스로부터 상속을 받지 않은 클래스를 기반클래스(BaseClass)라고 부른다. 우리가 이제까지 어떤 클래스로부터 상속 받지 않고 생성한 대부분은 클래스를 기반클래스로 생각해도 무방하다.
 */
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        "name: \(name), age: \(age)"
    }
    
    func speak(){
        print("ABCDEFG")
    }
}

let sh: Person = Person()
sh.name = "SH"
sh.age = 99
print(sh.introduction)
sh.speak()
/**
 Person을 다른 클래스를 상속받지 않으므로 기반클래스이다. Person 클래스는 name, age 저장프로퍼티와 introduction이라는 연산 프로퍼티 speak()라는 메소드가 있다. 상속을 통해 기반 클래스인 Person을 기반으로 세분화된, 더 많은 기능이 있는 자식 클래스를 만들어줄 수 있다.
 
 
     1. 상속
 수직으로 클래스를 확장할 수 있는 상속은 다른 클래스에서 물려 받는 것을 의미한다. 부모의 메소드, 프로퍼티를 재정의하거나, 기반클래스의 기능이나 프로퍼티를 물려받고 자신의 기능을 추가할 수 있다. 클래스 이름 뒤에 콜론을 붙이고 다른 클래스 이름을 써주면 뒤에 오는 클래스의 기능을 앞의 클래스가 상속받을 것임을 뜻한다.
 
    class [클래스 이름]: [부모클래스 이름] {
        [ 프로퍼티와 메소드들 ]
    }
 */
class Student: Person {
    var grade: String = "F"
    func study(){
        print("STUDY!")
    }
}

let jay: Student = Student()
jay.name = "JAY"
jay.age = 10
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()
/**
    위의 예시는 Person을 상속받았기 때문에 부모의 클래스가 물려준 프로퍼티와 메소드를 사용할 수 있으며, 자신이 정의한 프로퍼티와 메소드도 사용할 수 있다. 아래의 예시와 같이 Peson을 상속받은 Student를 다른 클래스가 상속할 수 있다. 즉, 상속 받은 클래스가 다른 클래스의 부모가 될 수 있다.
*/
class UniversityStudent: Student {
    var major: String = ""
}
let jenny: UniversityStudent = UniversityStudent()
jenny.major = "ComputerScience"
jenny.speak()
jenny.study()

/**
 Person을 상속받은 Student는 Person의 인스턴스 메소드, 타입 메소드, 인스턴스 프로퍼티, 타입 프로퍼티, 서브스크립트 등 모든 특성을 포함하여 Student를 상속받은 UniversityStudent는 Person, Student의 특성을 모두 갖는다. 다른클래스를 상속받으면 똑같은 기능을 구현하기 위해서 코드를 다시 작성할 필요가 없으므로 코드를 재사용하기 용이하고 더불어 기능을 확장할 때 기존 클래스를 변경하지 않고도 새로운 추가 기능을 구현한 클래스를 정의할 수 있다.
 
    {
        *** final을 사용하면 모든 속성을 상속받지는 않는다.
    }
 
 
        2.  Override
 자식클래스에서 부모로부터 받은 것을 (인스턴스 메소드, 타입 메소드, 인스턴스 프로퍼티, 타입 프로퍼티, 서브스크립트 등) 그대로 사용하지 않고 자신만의 기능으로 변형하여 사용할 수 있다. 이를 재정의(override)라고 한다.
 상속받은 특성들을 재정의하려면 새로운 정의 앞에 override라는 키워드를 사용한다. override는 스위프트 컴파일러가 조상에 해당 특성이 있는지를 확인한 후 재정의하게 된다. 만약 조상 클래스에 재정의할 특성이 없는 상태에서 override 키워드를 사용하면 컴파일 에러가 발생한다.
 만약 자식클래스에서 부모 클래스의 특성을 재정의했을 때, 부모클래스의 특성을 자식클래스에서 사용하고 싶다면 super 프로퍼티를 사용하면된다. 즉, 자식클래스에서 특성을 재정의했지만 필요에 따라 부모 클래스의 특성을 활용하고 싶을 때 super를 사용한다. super 키워드를 타입 메소드 내에서 사용한다면 부모 클래스의 타입 메소드와 타입 프로퍼티에 접근할 수 있으며 인스턴스 메소드 내에서 사용하면 부모클래스 인스턴스 메소드와 인스턴스 프로퍼티, 서브스크립트에 접근할 수 있다.
 
 재정의한 someMethod()의 부모 버전 호출하고 싶다면 super.someMethod()라고 호출하면 된다. 재정의한 someProperty의 부모 버전에 접근하고 싶다면 super.someProeprty라고 접근하면 된다. 재정의한 서브스크립트에서 부모 버전의 서브스크립트로 접근하고 싶다면 super[index]라고 접근하면 된다.
 
 
        2.1 메소드 재정의
 */
class Food {
    var name: String = ""
    var nation: String = ""
    
    var introduce: String {
        "name: \(name), nation: \(nation)"
    }
    func recipe() {
        print("ABCDEFG")
    }
    
    class func introduceClass() -> String {
        return "this is food"
    }
}

class KoreanFood: Food {
    var location: String = "Seoul"
    func makeKoreanFood(){
        print("make Korean food")
    }
    override func recipe() {
        print("가나다라마바사")
    }
//    class func introduceClass() {
//        print(super.introduceClass())
//    }
}

class SeoulKoreanFood: KoreanFood {
    var dong: String = ""
    
    
    override class func introduceClass() -> String {
        return "this is traditional korean, seoul food"
    }
    override func recipe() {
        super.recipe()
        print("seoul Recipe")
    }
}

let jeon: SeoulKoreanFood = SeoulKoreanFood()
jeon.recipe()

let korFood: KoreanFood = KoreanFood()
korFood.recipe()

print(Food.introduceClass())
print(KoreanFood.introduceClass())
print(SeoulKoreanFood.introduceClass() as String)
//SeoulKoreanFood.introduceClass() as Void

/**
    KoreanFood는 Food를 상속받았고 SeoulKoreanFood는 KoreanFood를 상속 받았다. KoreanFood에서 Food 클래스의 recipe를 재정의했고, SeoulKoreanFood에서  Food의 introduceClass를 재정의 했다. KoreanFood에서 재정의한 recipe는 SeoulKoreanFood 클래스로 상속되었으므로 SeoulKoreanFood는 recipe를 호출하면 KoreanFood의 메소드가 호출된다. 스위프트에서는 반환타입, 매개변수가 다르면 서로 다른 메소드로 취급한다.
 
 
            2.2. 프로퍼티 재정의
    메소드와 마찬가지로 부모 클래스로부터 상속받은 인스턴스 프로퍼티나 타입 프로퍼티를 자식 클래스에서 용도에 맞게 재정의할 수 있다. 프로퍼티를 재정의할 떄는 저장 프로퍼티로 재정의할 수는 없다. 프로퍼티를 재정의한다는 것은 프로퍼티 자체가 아니라 프로퍼티의 접근자(Getter), 설정자(Setter), 프로퍼티 옵저버(Property Observer) 등을 재정의하는 것을 의미한다.  조상클래스에서 저장 프로퍼티로 정의한 프로퍼티는 물론이고 연산 프로퍼티로 정의한 프로퍼티도 접근자와 설정자를 재정의할 수 있다. 프로퍼티를 상속받은 자식 클래스에서 조상 클래스의 프로퍼티 종류(저장, 연산)는 알지 못하고 단지 이름과 타입만을 알기 때문이다. 재정의하려는 프로퍼티는 조상 클래스 프로퍼티의 이름과 타입이 일치해야한다. 만약 조상클래스에 없는 프로퍼티를 재정의하려고 하면 메소드와 마찬가지로 컴파일 에러가 발생한다.
 
    조상 클래스에서 읽기 전용 프로퍼티였더라도 자식 클래스에서 읽고 쓰기가 가능한 프로퍼티로 재정의해줄 수도 있다. 그러나, 읽기/ 쓰기 모두 가능했던 프로퍼티를 읽기 전용으로 재정의할 수는 없다. 읽기/ 쓰기가 모두 가능한 프로퍼티를 재정의할 때 설정자만 따로 재정의할 수는 없다. 즉, 접근자와 설정자를 모두 재정의해야한다. 만약 접근자에 따로 기능 변경이 필요 없다면 super.someProperty와 같은 식으로 부모클래스의 접근자를 사용하여 값을 받아와서 반환하면 된다.
 */

class Person2 {
    var name: String = ""
    var age: Int = 0
    var koreaAge: Int {
        self.age + 1
    }
    var introduction: String {
        "이름 \(name), 나이 \(age)"
    }
}
class Student2: Person2 {
    var grade: String = "F"
    override var introduction: String{
        super.introduction + " 학점 \(self.grade)"
    }
    override var koreaAge: Int {
        get {
            super.koreaAge
        }
        set {
            self.age = newValue - 1
        }
    }
}
let yj: Person2 = Person2()
yj.name = "YJ"
yj.age = 55
print(yj.introduction)
print(yj.koreaAge)

let jayG: Student2 = Student2()
jayG.name = "JAYG"
jayG.age = 20
jayG.koreaAge = 21
print(jayG.introduction)
print(jayG.koreaAge)
/**
    위 예시에서는 Student2 클래스에서는 Person2 클래스에서 상속받은 introduction과 koreanAge라는 연산 프로퍼티를 재정의했다. 읽기 전용이었다. koreanAge프로퍼티는 읽기/ 쓰기 모두 가능하도록 했고 introduction은 학점도 노출하도록 재정의 했다.
 
        
                2.3. 프로퍼티 옵져버 재정의
    프로퍼티 옵져버도 프로퍼티의 접근자와 설정자처럼 재정의할 수 있다. 또, 조상클래스에 정의한 프로퍼티가 연산 프로퍼티인지 저장 프로퍼티인지는 관계가 없다. 다만 상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티는 프로퍼티 옵저버를 재정의할 수 없다. 왜냐하면 상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티는 값을 설정할 수 없으므로 willSet이나 didSet 메소드를 사용한 프로퍼티 옵저버를 원칙적으로 사용할 수 없기 때문이다. 또, 프로퍼티 옵저버를 재정의하더라도 조상 클래스에 정의한 프로퍼티 옵저버도 동작한다는 점을 잊지 말아야 한다.
 
    프로퍼티의 접근자와 프로퍼티 감시자는 동시에 재정의할 수 없다. 만약 둘 다 동작하길 원한다면 재정의하는 접근자에 프로퍼티 감시자 역할을 구현해야 한다.
 */
class Person3 {
    var name: String = ""
    var age: Int = 0 {
        didSet{
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    var fullName: String {
        get {
            self.name
        }
        set {
            self.name = newValue
        }
    }
}

class Student3: Person3 {
    var grade: String = "F"
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    override var koreanAge: Int {
        get {
            super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
        
//        didSet { } //ERROR!
    }
    override var fullName: String {
        didSet{
            print("Full Name : \(self.fullName)")
        }
    }
}

let sh3: Person3 = Person3()
sh3.name = "sh3"
sh3.age = 29
sh3.fullName = "SH.Kim"
print(sh3.koreanAge)

let yj3: Student3 = Student3()
yj3.name = "YJ"
yj3.age = 14

yj3.koreanAge = 15
yj3.fullName = "Kim YJ"
print(yj3.koreanAge)
/**
    위의 Student3 클래스에는 Person3 클래스의 age라는 저장 프로퍼티의 프로퍼티 옵저버를 재정해주었으며, koreanAge와 fullName이라는 연산 프로퍼티의 프로퍼티 옵저버를 재정의해주었다. Person3 클래스 age라는 저장 프로퍼티에 이미 프로퍼티 옵저버를 정의했으므로 yj3의 age 프로퍼티 값을 할당 할 때는 Person3에 정의한 프로퍼티 옵저버와 Student에 정의한 프로퍼티 옵저버가 모두 동작한다. 또, 기존에 연산 프로퍼티로 정의했던 fullName 프로티에도 프로퍼티 옵저버를 정의했음을 볼 수 있다. 그러나 koreanAge 프로퍼티에는 프로퍼티 옵저버와 프로퍼티 설정자를 동시에 정의할 수 없다.
 
 
            2.4. 서브스크립트 재정의
    서브스크립트도 메소드와 마찬가지로 재정의가 가능하다. 서브스크립트도 매개변수와 반환 타입이 다른면 다른 서브스크립트로 취급하므로, 자식클래스에서 재정의하려는 서버스크립트라면 부모 클래스 서브스크립트의 매개변수와 반환 타입이 같아야 한다. 메소드 재정의와 방법이 같다.
 */
class School3 {
    var students: [Student3] = [Student3]()
    
    subscript(number: Int) -> Student3 {
        print("School subscript")
        return students[number]
    }
}

class MiddleSchool3: School3 {
    var middleStudents: [Student3] = [Student3]()
    //부모클래스(School3)에게 상속받은 서브스크립트 재정의
    override subscript(number: Int) -> Student3 {
        print("MiddleSchool subscript")
        return middleStudents[number]
    }
}

let university: School3 = School3()
university.students.append(Student3())
university[0] // school subscript

let middle: MiddleSchool3 = MiddleSchool3()
middle.middleStudents.append(Student3())
middle[0]


/**
            2.5. 재정의 방지
    만약 부모클래스를 상속받은 자식 클래스에서 몇몇 특성을 재정의할 수 없도록 제한하고 싶다면 재정의 방지하려는 특성 앞에 final 키워드를 명시하면 된다. 예를 들면 final var, final func, final class, final subscript와 같이 표현하면 된다.
 
    재정의를 방지한 특성을 자식클래스에서 재정의하려고 하면 컴파일 오류가 발생한다.
 
    만약클래스를 상속하거나 재정의할 수 없도록 하고 싶다면 class앞에 final을 명시하면 된다. 그렇게 하면 더 이상 자식 클래스를 가질 수 없다. 상속이 방지된 클래스를 다른 클래스가 상속받으려고 하면 컴파일 오류가 발생한다.
 */
class Ios {
    final var version: String = ""
    final func history(){
        print("3.0/ 3.1.1/ 3.1.2/ 3.1.3/ 3.1.4")
    }
}

final class IpadOs: Ios {
    //version, history는 재정의가 불가하다.
}
//final로 상속이 불가
//class WatchOs: IpadOs {
//
//}

/**
        3. 클래스의 이니셜라이저 - 상속과 재정의
 값 타입의 이니셜라이저는 이니셜라이저 위임을 위해 이니셜라이저끼리 구분할 필요가 없엇지만 클래스에서는 지정 이니셜라저와 편의 이니셜라이저로 역할을 구분한다. 또, 값 타입의 이니셜라이저는 상속을 고려할 필요가 없었지만 클래스는 상속이 가능하므로 상속받았을 때 이니셜라이저를 어떻게 재정의하는지도 큰 관건이다.
 
 두 종류의 이니셜라이저가 존재하고 상속하이라는 클래스의 특성 때문에 다양한 패턴의 이니셜라이저가 생길 수 있으며, 그에 따라 클래스를 디자인할 때 고민해볼 필요가 있다.
 
        3.1. 지정 이니셜라이저와 편의 이니셜라이저
 지정 이니셜라이저(Designated Initializer)는 클래스의 주요 이니셜라이저이다. 지정 이니셜라이저는 필요에 따라 부모 클래스의 이니셜라이저를 호출할 수 있으며, 이니셜라이저가 정의된 클래스의 모든 프로퍼티를 초기화해야하는 임무를 갖고 있다. 지정 이니셜라이저는 클래스의 이니셜라이저 중 기둥과 같은 역할을 하므로 클래스에 하나 이상 정의한다. 물론 여러 개를 정의할 수는 있지만 편의 이니셜라이저에 비하면 적은 수이다.
 
 모든 클래스는 하나 이상의 지정 이니셜라이저를 갖는다. 만약 조상클래스에서 지정 이니셜라이저가 자손 클래스의 지정 이니셜라이저 역할을 충분히 할 수 있다면, 자손클래스는 지정 이니셜라이저를 갖지 않을 수도 있다. 아마도 이런 경우는 조상클래스로부터 물려받은 프로퍼티를 제외하고 옵셔널 저장 프로퍼티 외에 다른 저장 프로퍼티가 없을 가능성이 크다.
 
 편의 이니셜라이저(Convenience Initializer)는 초기화를 조금 더 손쉽게 도와주는 역할을 한다. 편의 이니셜라이저는 지정 이니셜라이저를 자신 내부에서 호출한다. 지정 이니셜라이저의 매개변수가 많아 외부에서 일일이 전달인자를 전달하기 어렵거나 특정 목적에 사용하기 위해서 편의 이니셜라이저를 설계할 수도 있다. 예를 들어 특정 목적으로 인스턴스를 생성할 때 일부 프로퍼티는 클래스 설계자가 의도한 대로 초깃값을 지정해줘야한다. 지정 이니셜라이저를 사용하면 인스턴스를 생성할 때마다 전달인자로 초기값을 전달해야 하지만 편의 이니셜라이저를 사용하면 거의 항상 같은 값으로 초기화가 가능하다.
 
 편의 이니셜라이저는 필수 요소는 아니다. 다만 클래스 설계자의 의도대로 외부에서 사용하길 원하거나 인스턴스 생성 코드를 작성하는 수고를 덜 때 유용하게 사용할 수 있다.
 
 지정 이니셜라이저는 값 타입 이니셜라이저를 정의할 때와 같은 형식으로 정의할 수 있다.
 
            init( parameters ) {
                init statements ...
            }
 
 편의 이니셜라이저는 앞에 convenience 지정자를 init 앞에 명시하면 된다.
 
            convenience init( parameters ) {
                init statements ...
            }
 
 
 
 
        3.2. 클래스의 초기화 위임
 지정 이니셜라이저와 편의 이니셜라이저 사이의 관계를 간단히 정리해보기 위해 세 가지 규칙을 적용해볼 수 있다.
 
    1. 자식클래스의 지정 이니셜라이저는 부모 클래스의 지정 이니셜라이저를 반드시 호출해야한다.
    2. 편의 이니셜라이저는 자신을 정의한 클래스의 다른 이니셜라이저를 반드시 호출해야한다.
    3. 편의 이니셜라이저는 궁극적으로는 지정 이니셜라이저를 반드시 호출해야한다.
 
 즉, 지정/ 편의 이니셜라이저는 결국 지정 이니셜라이저에게 초기화를 위임한다. 또한 편의 이니셜라이저는 반드시 초기화를 누군가에 위임한다.
 
                             [    부모 클래스     ]
 
 [지정 이니셜라이저 ⓐ]    ←⎯    [편의 이니셜라이저 ①]    ←⎯    [편의 이니셜라이저 ②]
        ↑           ↖︎
        ⎮              ↖︎     [    자식 클래스     ]
        ⎮                 ↖︎
 [지정 이니셜라이저 ⓑ]    ←⎯    [지정 이니셜라이저 ⓒ]    ←⎯    [편의 이니셜라이저 ②]
 
 
 부모 클래스는 하나의 지정 이니셜라이저 ⓐ와 두 개의 편의 이니셜라이저 ①, ②를 갖습니다. 부모클래스의 맨 오른쪽 편의 이니셜라이저 ②는 다른 편의 이니셜라이저 ①를 호출하며 해당 편의 이니셜라이저는 궁극적으로 지정 이니셜라이저 ⓐ를 호출한다. 이는 앞의 규칙 2, 3을 만족하는 조건이다. 부모 클래스는 그 이상의 조상이 없으므로 규칙 1에는 해당 사항이 없다.
 
 자식클래스는 두 개의 지정 이니셜라이저 ⓑ, ⓒ와 하나의 편의 이니셜라이저를 ③를 갖는다. 편의 이니셜라이저 ③는 두 번쨰 지정 이니셜라이저 ⓒ를 호출한다. 편의 이니셜라이저는 자신의 클래스에 구현된 이니셜라이저만 호출할 수 있으므로 부모 클래스의 이니셜라이저는 호출할 수 없다. 이는 2,3의 규칙을 만족한다. 또, 두 지정 이니셜라이저 ⓑ, ⓒ 모두 부모 지정 이니셜라이저 ⓐ를 호출하므로 규칙 1도 만족한다.
 
 
            3.3 2단계 초기화
 스위프트 클래스 초기화는 2 단계(two-phase)를 거친다. 1 단계는 클래스에 정의된 각각의 저장 프로퍼티에 초기값이 할당된다. 모든 저장 프로퍼티의 초기 상태가 결정되면 2단계로 돌입해 저장 프로퍼티들을 사용자 정의할 기회를 얻는다. 그 후 비로소 새로운 인스턴스를 사용할 준비가 끝난다.
 
 2단계 초기화는 프로퍼티를 초기화하기 전에 프로퍼티 값에 접근하는 것을 막아 초기화를 안전하게 할 수 있도록 해준다. 또 다른 이니셜라이저가 프로퍼티의 값을 실수로 변경하는 것을 방지할 수도 있다.
 
 스위프트 컴파일러는 2단계 초기화를 오류 없이 처리하기 위해서 다음과 같은 네 가지 안전확인(safe-check)을 실행한다.
 
    1. 자식 클래스의 지정 이니셜라이저가 부모 클래스의 이니셜라이저를 호출하지 전에 자신의 프로퍼티를 모두 초기화 했는지 확인한다.
    2. 자식 클래스의 지정 이니셜라이저는 상속받은 프로퍼티에 값을 할당하기 전에 반드시 부모 클래스의 이니셜라이저를 호출해야한다.
    3. 편의 이니셜라이저는 자신의 클래스에 정의한 프로퍼티를 포함하여 그 어떤 프로퍼티라도 값을 할당하기 전에 다른 이니셜라이저를 호출해야한다.
    4. 초기화 1단계를 마치기 전까지는 이니셜라이저는 인스턴스 메소드를 호출할 수 없다. 또, 인스턴스 프로퍼티의 값을 읽어들일 수도 없다. self 프로퍼티를 자신의 인스턴스를 나타내는 값으로 활용할 수도 없다.
 
 클래스의 인스턴스는 초기화 1단계를 마치기 전까지 아직 유효하지 않다. 프로퍼티는 읽기만 가능하며, 메소드는 호출할 수 있을 뿐이다. 클래스의 인스턴스가 초기화 1단계를 마쳤을 때 비로소 유요한 인스턴스가 된다. 아래는 2단계 초기화 진행 단계이다.
 
    1단계
    1. 클래스가 지정 또는 편의 이니셜라이저를 호출한다.
    2. 그 클래스의 새로운 인스턴스를 위한 메모리가 할당된다. 메모리는 아직 초기화되지 않은 상태이다.
    3. 지정 이니셜라이저는 클래스에 정의된 모든 저장 프로퍼티에 값이 있는지 확인한다. 현재 클래스 부분까지 저장 프로퍼티를 위한 메모리는 이제 초기화됐다.
    4. 지정 이니셜라이저는 부모 클래스의 이니셜라이저가 같은 동작을 행할 수 있도록 초기화를 양도한다.
    5. 부모 클래스는 상속 체인을 따라 최상위 클래스에 도달할 때까지 이 작업을 반복한다.
 
 최상위 클래스에 도달했을 때, 최상위 클래스까지 모든 저장 프로퍼티에 값이 있다고 확인하면 인스턴스의 메모리는 모두 초기화된 것이다. 이로써 1단계가 완료됐다.
 
    2단계
    1. 최상위 클래스로부터 최하위 클래스까지 상속 체인을 따라 내려오면서 지정 이니셜라이저들이 인스턴스를 제각각 사용자 정의하게 된다. 이 단계에서는 self를 통해 프로퍼티 값을 수정할 수 있고, 인스턴스 메소드를 호출하는 등의 작업을 진행할 수 있다.
    2. 마지막으로 각각의 편의 이니셜라이저를 통해 self를 통한 사용자 정의 작업을 진행할 수 있다.
 
 */

class Person4 {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

class Student4: Person4 {
    var major: String
    init(name: String, age: Int, major: String){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    convenience init(name: String){
        self.init(name: name, age: 7, major: "")
    }
}

/**
    Student4 클래스의 지정 이니셜라이저(init(name:age:major))는 부모클래스의 지정 이니셜라이저를 호출하기 전에 자신의 self 프로퍼티를 이용해 major 프로퍼티의 값을 할당한다. 그렇게 하면 안전확인 중 1번 조건에 만족한다. 그리고 super.init(name: name, age: age)를 통해 부모 클래스의 이니셜라이저를 호출했으며 그 외에 상속받은 프로퍼티가 없으므로 부모의 이니셜라이저 호출 이후에 값을 할당해줄 프로퍼티가 없다. 따라서 2번 조건을 갖췄다. 또, 편의 이니셜라이저인 convenience init(name:)은 따로 차후에 값을 할당할 프로퍼티가 없고, 다른 이니셜라이저를 호출했으므로 3번 조건에 부합한다. 마지막으로 이니셜라이저 어디에서도 인스턴스 메소드를 호출하거나 인스턴스 프로퍼티의 값을 읽어오지 않았으므로 4번 조건도 충족한다.
 
    안전확인 후 super.init(name:name, age:age)를 통해 1단계와 2단계의 초기화까지 마치게 된다.
 
 
        
 
            3.4. 이니셜라이저 상속 및 재정의
    기본적으로 스위프트의 이니셜라이저는 부모클래스의 이니셜라이저를 상속받지 않는다. 부모 클래스로부터 물려받은 이니셜라이저는 자식클래스에 최적화되어 있지 않아서, 부모의 이니셜라이저를 사용했을 때 자식 클래스의 새로운 인스턴스가 완전하고 정확하게 초기ㅗ하 되지 않는 상황을 방지하고나 함이다. 안전하고 적절하다고 판단되는 특정한 솽황에서는 부모 클래스의 이니셜라이저가 상속되기도 한다.
 
    보통 부모 클래스의 이니셜라이저와 독같은 이니셜라이저를 자식클래스에서 사용하고 싶다면 자식 클래스에서 부모의 이니셜라이저와 똑같은 이니셜라이저를 구현해주면 된다.
 
    부모클래스와 동일한 지정 이니셜라이저를 자식 클래스에서 구현해주려면 재정의하면 된다. 그러려면 override 수식어를 붙어야 한다. 클래스에 주어지는 기본 이니셜라이저를 재정의 할 때도 마찬가지입니다. 자식클래스의 편의 이니셜라이저가 부모클래스의 지정 이니셜라이저를 재정의하는 경우에도 override 수식어를 붙인다.
 
    반대로 부모클래스의 편의 이니셜라이저와 동일한 이니셜라이저를 자식클래스에 구현할 떄는 override를 붙이지 않는다. 자식클래스에서 부모클래스의 편의 이니셜라이저는 절대로 호출할 수 없기 때문이다.
 */
class Person5 {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    convenience init(name: String){
        self.init(name: name, age: 0)
    }
}
class Student5: Person5{
    var major: String
    
    override init(name: String, age: Int){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    convenience init(name: String){
        self.init(name: name, age: 7)
    }
}
/**
    위의 코드를 보면 Person5를 상속받은 Student5에서 부모 클래스의 편의 이니셜라이저와 동일한 편의 이니셜라이저를 정의할 때 override 수식어를 붙이지 않는 것을 볼 수 있다. 반대로 지정 이니셜라이저는 재정의를 위해 override 수식어를 사용할 것을 볼 수 있다. 기본 이니셜라이저 외 지정 이니셜라이저를 자식클래스에서 동일한 이름으로 정의하려면 재정의를 위한 override를 명시해야한다.
 
    부모의 실패 가능한 이니셜라이저를 자식에서 재정의하고 싶을 때는 실패 가능한 이니셜라이저로 재정의해도 되고 필요에 따라서 실패하지 않는 이니셜라이저로 재정의할 수도 있다.
 */
class Person6 {
    var name: String
    var age: Int
    
    init(){
        self.name = "Unknown"
        self.age = 0
    }
    init?(name: String, age: Int){
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
    }
    init?(age: Int){
        if age < 0 {
            return nil
        }
        self.name = "unknown"
        self.age = age
    }
}
class Student6: Person6 {
    var major: String
    
    override init?(name: String, age: Int){
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    override init(age: Int){
        self.major = "Swift"
        super.init()
    }
}
/**
    위의 Person6은 하나의 지정 이니셜라이저와 두 개의 실패 가능 지정이니셜 라이저가 있다. 이를 Student6 에서 재정의할 때 하나는 부모 클래스와 마찬가지로 실패 가능한 이니셜라이저로 재정의했고, 하나는 실패하지 않는 이니셜라이저로 재정의했다. 이처럼 부모클래스에서는 실패 가능한 이니셜라이저였더라도 자식 클래스에서는 필요에 따라 실패하지 않는 이니셜라이저로 재정의해줄 수 있다.
 
 
 
    
            3.5. 이니셜라이저 자동 상속
    이니셜라이저 상속 및 재정의에서 기본적으로 스위프트의 이니셜라이저는 부모클래스의 이니셜라이저를 상속받지 않는다. 그러나 특정 조건에 부합한다면 부모 클래스의 이니셜라이저가 자동으로 상속된다. 사실, 대부분 경우 자식클래스에서 이니셜라이저를 재정의해줄 필요가 없다.
 
    자식클래스에서 프로퍼티 기본값을 모두 제공한다고 가정할 때, 아래의 두 가지 규칙에 따라 이니셜라이저가 자동으로 상속된다.
 
    [규칙 1] : 자식 클래스에서 별도의 지정 이니셜라이저를 구현하지 않는다면, 부모클래스의 지정 이니셜라이저가 자동으로 상속된다.
    [규칙 2] : 만약 [규칙 1]에 따라 자식클래스에서 부모 클래스의 지정 이니셜라이저를 자도응로 상속받는 경우 또는 부모 클래스의 지정 이니셜아이저를 모두 재정의하여 부모클래스와 동일한 지정이니셜라이저를 모두 사용할 수 있는 상황이라면 부모 클래스의 편의 이니셜라이저가 모두 자동으로 상속된다.
 */
class Person7 {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "Unknown")
    }
}

class Student7: Person7 {
    var major: String = "Swift"
}

//부모 클래스의 지정 이니셜라이저 자동 상속
let per7: Person7 = Person7(name: "per7")
let haha: Student7 = Student7(name: "haha")
print(per7)
print(haha)

//부모의 편의 이니셜라이저 자동 상속
let wizplan: Person7 = Person7()
let jisung: Student7 = Student7()
print(wizplan)
print(jisung)
/**
    위 예시를 살펴보면 Student7의 major 프로퍼티에 기본값이 있으며, 따로 지정 이니셜라이저를 구현하지 않았으므로 부모인 Person7의 지정 이니셜라이저가 자도응로 상속된다. 이는 [규칙1]에 부합한다. 또, 부모쿨래스의 지정 이니셜라이저를 모두 자동으로 상속받았으므로 편의 이니셜라이저도 자동으로 상속된다.
 */
class Person8 {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "Unknown")
    }
}
class Student8: Person8 {
    var major: String
    override init(name: String){
        self.major = "Unknown"
        super.init(name: name)
    }
    init(name: String, major: String){
        self.major = major
        super.init(name: name)
    }
}
// 부모클래스의 편의 이니셜라이저 자동 상속
let wzp: Person8 = Person8()
let js: Student8 = Student8()
print(wzp.name)
print(js.name)
/**
    Student8의 major 프로퍼티에 기본 값이 없더라도 이니셜라이저에서 적절히 초기화했고, 부모클래스의 지정 이니셜라이저를 모두 재정의하여 부모 클래스의 지정 이니셜라이저와 동일한 이니셜라이저를 모두 사용할 수 있는 상화잉므로 [규칙1]에 부합한다. 따라서 부모클래스의 편의 이니셜라이저가 자동으로 상속되었다.
 
    자동 상속 규칙은 자식클래스에 편의 이니셜라이저를 추가한다고 하더라도 유효하다. 또, 부모 클래스의 지정 이니셜라이저를 자식 클래스의 편의 이니셜라지어로 구현하더라도 [규칙2]를 충족한다.
 */
//편의 이니셜라이저 자동 상속2
class Person9 {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "unknown")
    }
}
class Student9: Person9 {
    var major: String
    convenience init(major: String){
        self.init()
        self.major = major
    }
    override convenience init(name: String){
        self.init(name:name, major: "unknown")
    }
    init(name: String, major: String){
        self.major = major
        super.init(name: name)
    }
}
//부모클래스의 편의 이니셜라이저 자동 상속
let wzpl: Person9 = Person9()
let jsng: Student9 = Student9(major: "Swift")
print(wzpl.name)
print(jsng.name)
print(jsng.major)

/**
    Student 클래스에서 부모클래스의 지정 이니셜라이저인 init(name:) 을 편의 이니셜라이저로 재정의했지만 부모의 지정 이니셜라이저를 모두 사용할 수 있는 상황인 [규칙2]에 부합하므로 부모 클래스의 편의 이니셜라이저를 사용할 수 있다. 또, 자신만의 편의 이니셜라이저는 convenience init(major:)를 구현해주었지만 편의 이니셜라이저 자동 상속에는 아무런 영향이 없다.
 */
class UniversityStudent2: Student9 {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    convenience init(name: String, major: String, grade: String){
        self.init(name: name, major: major)
        self.grade = grade
    }
}
let nova: UniversityStudent2 = UniversityStudent2();
print(nova.description)
let raon: UniversityStudent2 = UniversityStudent2(name: "raon")
print(raon.description)
let joker: UniversityStudent2 = UniversityStudent2(name: "joker", major: "swift")
print(joker.description)
let chope: UniversityStudent2 = UniversityStudent2(name: "chope", major: "computer", grade: "C++")
print(chope.description)
/**
    위 예시를 보면 Student9을 상속받은 UniversityStudent2는 grade 프로퍼티에 기본값이 있으며, 별도의 지정 이니셜라이저를 구현해 주지 않았으므로 규칙1에 부합한다. 따라서 부모 클래스의 이니셜라이저를 모두 자동 상속 받는다. 게다가 자신 만의 편의 이니셜라이저를 구현했지만 자동상속에는 영향이 없다. 결과적으로 UniversityStudent2는 상속받은 이니셜라이저 + 자신의 편의 이니셜라이저를 모두 사용할 수 있다.
 
 
            3.6 요구 이니셜라이저
    required 수식어를 클래스의 이니셜라이저 앞에 명시해주면 이 클래스를 상속받은 자식클래스에서 반드시 해당 이니셜라이저를 구현해주어야 한다. 다시 말하면 상속받을 때 반드시 재정의해야하는 이니셜라이저 앞에 required 수식어를 붙여준다. 다만 자식 클래스에서 요구하는 이니셜라이저를 재정의할 때는 override 수식어 대신에 required 수식어를 사용한다.
 
 */

class Person0 {
    var name: String
    required init(){
        self.name = "unknown"
    }
}

class Student0: Person0 {
    var major: String = "unknown"
}

let mijeong0: Student0 = Student0()

/**
    위 코드를 보면 person0 클래스에 init() 요청 이니셜라이저를 구현해주었지만, Person0 클래스를 상속받은 Student0 클래스에는 요구 이니셜라이저를 구현하지 안않다. 이는 Student0 클래스의 major 프로퍼티에 기본값이 있으면 별다른 지정 이니셜라이저가 없기 떄문에 이니셜라이저가 자동으로 상속된 것이다.
    
    만약 Student0 클래스에 새로운 지정 이니셜라이저를 구현한다면 부모클래스로부터 이니셜라이저가 자동으로 상속되지 않으므로 요구 이니셜라이저를 구현해줘야한다.
 */

class Person10 {
    var name : String
    required init() {
        self.name = "unknown"
    }
}
class Student10: Person10 {
    var major: String = "unknown"
    
    init( major: String ){
        self.major = major
        super.init()
    }
    required init(){
        self.major = "unknown"
        super.init()
    }
}
class UniversityStudent10: Student10 {
    var grade: String
    init( grade: String ){
        self.grade = grade
        super.init()
    }
    required init(){
        self.grade = "F"
        super.init()
    }
}
let jsoo: Student10 = Student10()
print(jsoo.major)
let ygm: Student10 = Student10(major: "Swift")
print(ygm.major)
let juHyn: UniversityStudent10 = UniversityStudent10(grade: "A+")
print(juHyn.grade)
/**
    위 코드를 보면 Student10와 UniversityStudent10 클래스는 자신만의 지정 이니셜라이저를 구현했다. 그래서 부모클래스의 이니셜라이저를 자동 상속받지 못한다. 그래서 Person10클래스에서 정의한 요구 이니셜라이저를 이니셜라이저 자동 상속 규칙에 부합하지않은 자식클래스인 Student10에도 구현해주고, 그 자식클래스 UniversityStudent 클래스에도 구현해줘야한다. 이니셜라이저 자동 상속의 규칙에 부합하지 않는 한, 요구 이니셜라이저는 반드시 구현해줘야한다.
 
    만약 부모클래스의 이ㄹ반 이니셜라이저를 자신의 클래스부터 요구 이니셜라이저로 변경할 수도 있다. 그럴 때는 required override를 명시해주어 재정의됨과 동시에 요구 이니셜라이저가 될 것임을 명시해줘야한다. 또, 편의 이니셜라이저도 요구 이니셜라이저로 변경될 수 있다. 마찬가지로 required convienience를 명시해주어 편의 이니셜라이저가 앞으로 요구될 것으로 명시해주면 된다.
 */
class Person11 {
    var name: String
    init() {
        self.name = "unknown"
    }
}
class Student11: Person11 {
    var major: String = "unknown"
    init(major: String) {
        super.init()
        self.major = major
    }
    
    //부모 클래스의 이니셜라이저를 재정의함과 동시에 요구 이니셜라이저로 변경됨을 알린다.
    required override init() {
        super.init()
        self.major = "unknown"
    }
    
    //이 요구 이니셜라이저는 앞으로 계속 요구한다.
    required convenience init( name: String ) {
        self.init()
        self.name = name
    }
}

class UniversityStudent11: Student11 {
    var grade: String
    init( grade: String ){
        self.grade = grade
        super.init()
    }
    
    //student 클래스에서 요구했으므로 구현해줘야한다.
    required init() {
        self.grade = "F"
        super.init()
    }
    
    //student 클래스에서 요구했으므로 구현해줘야한다.
    required convenience init( name: String ){
        self.init()
        self.name = name
    }
}

let yj11: UniversityStudent11 = UniversityStudent11()
print(yj11.grade)

let jh11: UniversityStudent11 = UniversityStudent11(name: "JY")
print(jh11.name)


/**
    위 코드에서 Person11에는 별다른 요구 이니셜라이저가 없다. 다만 Student11 크랠스에서 Person11의  init() 이니셜라이저를 재정의하면서 요구 이니셜라이저로 변경했다. 따라서 UniversityStudent11 클래스에서는 init() 이니셜라이저를 요구 이니셜라이저로 필히 구현해줘야한다. 또, Student 클래스의 편의 이니셜라이저 init(name:)이 요구 이니셜라이저로 지정되어있기 때문에 UniversityStudent11에서 다시 구현해줘야한다.
 */

