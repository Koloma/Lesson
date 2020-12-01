import Foundation
//Домашнее задание №6
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

class Queue<T>{
    private var array: [T] = [];
    
    func push(_ element: T){
        array.append(element)
    }
    
    func pop() -> T?{
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
       
    subscript(indecies: Int...) -> [T]?{
        var tempArray: [T] = []
        for index in indecies where index < self.array.count{
            tempArray.append(array[index])
        }
        
        return tempArray.count > 0 ? tempArray : nil
    }
    
    func filter (closure: (T) -> Bool ) -> [T]{
        var tempArray: [T] = []
         for value in array {
            if closure(value){
                tempArray.append(value)
            }
         }
        return tempArray
     }
    
}

func filter(queue: Queue<Int >){
    
}

let queue = Queue<String>()

queue.push("One")
queue.push("Two")
queue.push("2")
queue.push("3")
queue.push("5")
queue.push("Formula One")

type(of: queue[1,3])
print(queue[1,2,7,1]!)
queue[5]

let arrayFiltered = queue.filter(){value -> Bool in
    return value > "3"
}
print ("arrayFiltered: \(arrayFiltered)")
print( queue.filter(){$0.lowercased().contains("o")})

for _ in 1...8 {
    print(queue.pop())
}

