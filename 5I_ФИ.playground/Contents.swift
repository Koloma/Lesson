import Foundation
//Домашнее задание №5
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
*/


enum CarAction{
    case move, stop, windowsOpen, windowsClose, loadTrunk(Int)
}
enum FuelType{
    case dizel,petrol
}

protocol Car: CustomStringConvertible{
    var carName: String {get set}
    var isMoving: Bool { get set }
    var isWindowOpen: Bool { get set}
    var fuelType: FuelType { get }

}

extension Car {
    mutating func move() -> Bool {
        isMoving.toggle()
        isMoving == true ? print("\(carName) is moving") : print("\(carName) is stopped")
        return isMoving
    }

    mutating func openWindow() -> Bool {
        isWindowOpen.toggle()
        isWindowOpen == true ? print("\(carName) windows is open") : print("\(carName) windows is closed")
        return isWindowOpen
    }
    
    mutating func doAction(carAction: CarAction) {
        switch carAction {
        case .move: move()
        case .stop: move()
        case .windowsOpen: openWindow()
        case .windowsClose: openWindow()
        case let .loadTrunk(weight) where self is TruckCar:
            let truck = self as! TruckCar
            truck.loadCargo(weight: weight)
        default:
            print("\(carName) action not define: \(carAction)")
        }
    }
}



class SportCar: Car{
    var carName: String
    var description: String {
        get{
            return  """
            \(carName) with engine on fuel type: \(self.fuelType).
            Windows open state: \(isWindowOpen)
            """
        }
    }
    var isMoving: Bool = false
    var isWindowOpen: Bool = false
    var fuelType: FuelType
    
    init(carName: String) {
        self.carName = carName
        self.fuelType = .petrol
    }
    

}

class TruckCar : Car{
    var carName: String
    var description: String {
        get{
            return """
            \(carName) with engine on fuel type: \(self.fuelType). Max load: \(truncMaxLoad)Kg.
            Trunc status: loaded \(truncLoaded)Kg
            """
        }
    }
    var isMoving: Bool = false
    var isWindowOpen: Bool = false
    var fuelType: FuelType
    var truncMaxLoad: Int
    var truncLoaded: Int = 0
    
    init(carName: String, trunkMaxLoad: Int) {
        self.carName = carName
        self.fuelType = .dizel
        self.truncMaxLoad = trunkMaxLoad
    }
    
    func loadCargo(weight: Int){
        if weight + truncLoaded <= truncMaxLoad{
            truncLoaded += weight
            print("\(carName) trunk loaded: \(truncLoaded)Kg")
        }
        else{
            print("Not enough free space for: \(weight) ")
            print("Trunk: \(truncLoaded)Kg trunc max load \(truncMaxLoad)")
            
        }
        
    }
}
var sportCar: SportCar = SportCar(carName: "Sport Car")
var truckCar: TruckCar = TruckCar(carName: "Big Truck",trunkMaxLoad: 2000)

sportCar.doAction(carAction: .move)
sportCar.doAction(carAction: .stop)
sportCar.doAction(carAction: .loadTrunk(150))
truckCar.doAction(carAction: .loadTrunk(150))
truckCar.doAction(carAction: .loadTrunk(1050))
truckCar.doAction(carAction: .loadTrunk(1000))
truckCar.doAction(carAction: .windowsOpen)
truckCar.doAction(carAction: .windowsClose)
print(sportCar)
print(truckCar)
