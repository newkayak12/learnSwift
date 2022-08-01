import UIKit
import Foundation

/**
          >  서브스크립트
 클래스, 구조체, 열거형에는 컬렉션, 리스트, 시퀀스 등 타입의 요소에 접근한 단축 문법인 서브스크립트(subScript)를 정의할 수 있다. 서브스크립트는 별도의 설정자(Setter) 또는 접근자(Getter) 등의 메소드를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올 수 있다. 예를 들어서 someArray라는 Array 인스턴스의 index를 통해 해당 인덱스의 값에 접근하고 싶다면 someArray[index]라고 표현하며, someDictionary라는 Dictionary의 key를 통해 해당 키의 값을 가져오고 싶다면 someDictionary[key]라고 표현하는 것이 바로 서브스크립트이다.
 
 한 타입에 여러 개의 서브스크립트를 정의할 수 있으며 다른 타입을 인덱스로 갖는 여러 개의 서브스크립트를 중복 정의(Overload)할 수도 있다. 앞서 예를 들었던 Array와 Dictionary처럼 하나의 매개변수를 가질 수 있으며, 필요에 따라 여러 개의 매개변수를 인덱스로 사용할 수도 있다.
 
 
    1. 서브스크립트 문법
 서브스크립트는 인스턴스 이름 뒤에 대괄호로 감싼 값을 써줌으로써 인스턴스 내부의 특정 값에 접근할 수 있다. 서브스크립트 문법은 연산 프로퍼티나 인스턴스 메소드 문법과 유사한 형태로 볼 수 있다.
 
 서브스크립트는 subscript 키워드를 사용하여 정의한다. 인스턴스 메소드와 비슷하게 매개변수의 개수, 타입, 반환 타입 등을 지정하며, 읽기 쓰기가 가능하도록 구현하거나 읽기 전용으로만 구현할 수 있다. 이는 접근자와 설정자를 사용할 수 있는 연산 프로퍼티의 형태와 유사하다.
 
 아래는 서브스크립트를 정의하는 문법이다. 서브스크립트를 정의하는 코드는 각 타입의 구현부 또는 타입의 익스텐션 구현부에 위치해야 한다.
 
        // 서브스크립트 정의 문법
    subscript(index: Int) -> Int {
        get{
            //서브스크립트 결과값 반환
        }
        set(newValue){
            //설정자 역할 수행
        }
    }
 
 위 예시에서 구현한 서브스크립트 설정자의 newValue의 타입은 서브스크립트의 반환 타입과 동일하다. 연산 프로퍼티 마찬가지로 매개변수를 따로 명시해주지 않으면 설정자의 암시적 전달인자 newValue를 사용할 수 있다. 또, 연산 프로퍼티와 마찬가지로 읽기 전용 프로퍼티를 구현할 떄는 get이나 set 키워드를 사용하지 않고 적절한 값만 반환해주는 형태로 구현해도 된다.
 
        //읽기 전용 서브스크립트
    subscript(index: Int) -> Int{
        get{
                //적절한 서브스크립트 값 반환
        }
    }
 
    subscript(index: Int) -> Int {
        //적절한 서브스크립트 결과값 반환
    }

 위 두 서브스크립트 정의는 동일한 역할을 한다. get 메소드 없이 단순히 값만 반환하도록하면 읽기 전용이 된다.
 
        2. 서브스크립트 구현
 서브스크립트는 자신이 가지는 시퀀스나 컬렉션, 리스트 등의 요소를 반환하고 설정할 때 주로 사용된다.
 */
struct Student {
    var name: String
    var number: Int
}
class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String){
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        if index < self.number{
            return self.students[index]
        }
        return nil
    }
}
let highSchool: School = School()
highSchool.addStudents(names: "MIJEONG", "JUHYUN", "JIYOUNG", "SEONGUK", "MOONDUK")
let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")


/**
        3. 복수 서브스크립트
 하나의 타입이 여러 개의 서브스크립트를 가질 수도 있다. 다양한 매개변수 타입을 사용하여 서브스크립트를 구현하면 여러 용도로 서브스크립트 사용할 수 있다는 뜻이다.
 */
struct Student2 {
    var name: String
    var number: Int
}
class School2 {
    var number: Int = 0
    var students: [Student2] = [Student2]()
    
    func addStudent(name: String){
        let student: Student2 = Student2(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...){
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student2? {
        get{
            if index < self.number{
                return self.students[index]
            }
            return nil
        }
        set{
            guard var newStudent: Student2 = newValue else {
                return
            }
            
            var number: Int = index
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int? {
        get {
            return self.students.filter{ $0.name == name }.first?.number
        }
        set {
            guard var number: Int = newValue else {
                return
            }
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student2 = Student2(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String, number: Int) -> Student2? {
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool2: School2 = School2()
highSchool2.addStudents(names: "MIJEONG", "JUHYUN", "JIYOUNG", "SEONGUK", "MOONDUK")

let aStudent2: Student2? = highSchool2[1]
print("\(aStudent2?.number) \(aStudent2?.name)")

print(highSchool2["MIJEONG"])
print(highSchool2["DONGJIN"])

highSchool2[0] = Student2(name: "HONGEUI", number: 0)
highSchool2["MANGGU"] = 1

print(highSchool2["JUHYUN"])
print(highSchool2["MANGGU"])
print(highSchool2["SEONGHUK", 3])
print(highSchool2["HEEJIN", 3])

/**
    위의 예시에서 School2 클래스에 총 3개의 스크립트를 정의했다. 두 개의 읽고 쓰기 가능한 서브스크립트 하나와 읽기 전용 서브스크힙트를 작성했고 각각 서브스크힙트는 매개변수 타입 개수, 반환 티입이 모두 다르다.
 
    첫 번쨰 서브스크립트튼 학생의 번호를 전달받아 해당하는 학생이 있다면 Student 인스턴스를 반환하거나 특정 번호에 학생을 할당하는 서브스크립트이다. 두 번쨰 서브스크립트는 학생의 이름을 전달받아 해당하는 학생이 있다면 번호를 반환하거나 특정 이름의 학생을 해당 번호에 할당하는 서브스크립트이다. 마지막 세 번째 서브스크립트는 이름과 번호를 전달받아 해당하는 학생이 있다면 찾아서 Student 인스턴스를 반환다.
    
    이처럼 서브스크립트는 메소드인듯 아닌듯, 연산 프로퍼티인 듯 아닌 듯 중간 형태를 띠며 인스턴스 이름 뒤에 대괄호만 써서 편리하게 내부 값에 접근하고 설정해줄 수 있다. 또, 다양한 목적으로 구현해주는 데 용이하다.
    
 
        
        4. 타입 서브스크립트
    이전까지 설명한 서브스크립트는 인스턴스에서 사용할 수 있는 서브스크립트이다. 타입 서브스크립트는 인스턴스가 아니라 타입 자체에서 사용할 수 있는 서브스크립트이다. 타입 서브스크립트를 구현하려면 서브스크립트를 정의할 때 subscript앞에 static 키워드를 붙여주면 된다. 클래스의 경우 class 키워드를 사용할 수도 있다.
 */
enum SchoolEnum: Int {
    case elementary = 1, middle, high, university
    
    static subscript( level: Int ) -> SchoolEnum? {
        return Self(rawValue: level)
    }
}

let schoolEnum: SchoolEnum? = SchoolEnum[2]
print(schoolEnum)
