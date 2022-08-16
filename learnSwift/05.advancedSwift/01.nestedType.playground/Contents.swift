/**
                > 타입 중첩
    열거형은 특정 클래스나 구조체의 기능을 명확히 사용하기 용이하다. 그러나 굳이  클래스 외부에서는 열거형을 사용할 필요가 없을 떄도 있다. 즉, 클래스나 구조체 내부에서 자신의 역할을 할 수 있도록 역할을 구분짓는 열거형을 선언해주고 자신의 내부에서만 사용할 수 있다는 것이다. 또는 특정 데이터 타입들을 하나의 클래스나 구조체에 구현하여 외부와 헷깔림을 피하고 싶을 수도 있다.
    
    어찌됐든 스위프트에는 타입 내부에 타입을 정의하고 구현할 수 있다. 이처럼 타입 내부에 새로운 타입을 선언해준 것을 중첩 타입(Nested Type)이라고 한다.
 
 
                1. 중첩 데이터 타입
    함수를 중첩해서 사용했듯이 클래스 내부에 새 클래스, 클래스 내부에 새 구조체, 구조체 내부에 새 열거형 등의 타입을 중첩하여 타입 내부에 새 타입을 정의할 수 있다.
 */
class Person {
    enum Job {
        case jobless, programmer, student
    }
    var job: Job = .jobless
}

class Student: Person {
    enum School {
        case elementary, middle, high
    }
    var school: School
    init(school: School) {
        self.school = school
        super.init()
        self.job = .student
    }
}

let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)
print(student.job)
print(student.school)
/**
    Person 클래스 내부에 중첩 데이터 타입으로 Job이라는 열거형 타입이 정의되어 있다. 또, Student 클래스 내부에는 중첩 데이터 타입으로 School이라는 열거형 타입이 정의되어 있다. 또, Student 클래스 내부에는 중첩 데이터 타입으로 School이라는 열거형 타입이 정의되어 있다. 데이터 타입을 중첩 구현하는 것은 보기에는 열거형을 외부에 정의했던 것과는 다르지 않아 보인다. 다만 중첩 데이터 타입을 사용할 때는 자신을 둘러싼 타입(자신이 속한)의 이름을 앞서 적어줘야한다는 것이 다르다. Person.Job과 같이 말이다. 이런 표현으로 중첩된 타입이 정확히 어떤 역할을 위해서 만들어진 것인지 알 수 있다.
 
    아직 이유에 대해서는 완벽하게 다루지 않았다.
 */
struct Sports {
    enum GameType {
        case football, basketball
    }
    var gameType: GameType
    struct GameInfo {
        var time: Int
        var play: Int
    }
    var gameInfo: GameInfo {
        switch self.gameType {
            case .basketball:
                return GameInfo(time: 40, play: 5)
            case .football:
                return GameInfo(time: 90, play: 11)
        }
    }
}

struct ESports {
    enum GameType {
        case online, offline
    }
    var gameType: GameType
    struct GameInfo {
        var location: String
        var package: String
    }
    var gameInfo: GameInfo {
        switch self.gameType {
            case .online:
                return GameInfo(location: "www.liveGame.com", package: "LOL")
            case .offline:
                return GameInfo(location: "제주", package: "SA")
        }
    }
}


var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)

var lol: ESports = ESports(gameType: .online)
print(lol.gameInfo)

let someGameType: Sports.GameType = .football
let anotherGameType: ESports.GameType = .online
//let errorIfYouWantIt: Sports.GameType = .online//Error
/**
    각 구조체에 맞는 열거형, 구조체에 따른 요구 정보가 다르다는 점, 이러한 경우 공용으로 사용할 경우 혼란을 야기할 수 있다. 물론 열거형 이름에 구조체를 명시해도 되지만 내부에 중첩해서 구현하면 타입의 목적성을 명확히 할 수 있다.
 */
