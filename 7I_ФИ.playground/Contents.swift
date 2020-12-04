import Foundation
//Домашнее задание №6
/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/

enum MyCoolErrors: String, Error{
    case DivisionByZero = "Нельзя делить на ноль!"
    case WrongType = "Испольуется неправильный тип переменных. Must be Double!"
}


func division(a: Any, b: Any) throws -> Double{
    guard a is Double else {throw MyCoolErrors.WrongType}
    guard b is Double else {throw MyCoolErrors.WrongType}
    let bb: Double = b as! Double
    let aa: Double = a as! Double
    guard bb != 0 else {throw MyCoolErrors.DivisionByZero}
    
    return aa / bb
}

do{
    let result = try division(a: 12.0, b: 0.0)
    print(result)
}
catch{
    if error is MyCoolErrors{
        print((error as! MyCoolErrors).rawValue)
    }
    else {
        print(error.localizedDescription)
    }
    
}


do{
    let result = try division(a: 12.0, b: 5)
    print(result)
}
catch{
    if error is MyCoolErrors{
        print((error as! MyCoolErrors).rawValue)
    }
    else {
        print(error.localizedDescription)
    }
}

if let result = try? division(a: 12.0, b: 5){
    print (result)
}
else{
    print("\nПрограммный косяк или Вы что-то не так ввели\nИспользуйте правильную обработку ошибок\n");
}

let result = try? division(a: 12.0, b: 3.0)
print (result)




