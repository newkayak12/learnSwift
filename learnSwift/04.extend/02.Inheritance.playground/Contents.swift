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
    위 예시에서는 Student2 클래스에서는 Person2 클래스에서 상속받은 introduction과 koreanAge라는 연산 프로퍼티를 재정의했다. 읽기 전용이었다. koreanAge프로퍼티는 읽기/ 쓰기 모두 가능하도록 했고 introduction은 학점도 노출하도록 재정의 했다 .
 */
