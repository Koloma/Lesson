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
    case engineOn, engineOff, windowsOpen, windowsClose
    case trunkLoad(Int)
    case trunkUnload(Int)
}
enum FuelType{
    case dizel,petrol
}

class Engine{
    let horsePower:Int
    let valveCount:Int
    let fuelType: FuelType
    init(horsePower:Int, valveCount:Int, fuelType: FuelType) {
        self.horsePower = horsePower
        self.valveCount = valveCount
        self.fuelType = fuelType
    }
    deinit {
        print("Engine with horsePower \(self.horsePower) is deleted and fuelType \(fuelType)")
    }
}

class Car{
    var name: String
    let wheelCount: Int
    let fuelTank: Int
    weak var engine: Engine?
    init(name: String, wheelCount: Int, fuelTank: Int, engine: Engine?) {
        self.name = name
        self.wheelCount = wheelCount
        self.engine = engine
        self.fuelTank = fuelTank
    }
    
    func doAction(carAction: CarAction){}
    deinit {
        print("Car \(self.name) is deleted")
    }
    func drive(){
        if engine != nil{
            print("Drive")
        }
        else{
            print("Please buy engine :)")
        }
    }
    func info() {
        if let engine = engine {
            print("\(name), has \(wheelCount) weels, \(engine.horsePower) horse power and \(fuelTank)L fuel tank ")
        }
        else{
            print("\(name), has \(wheelCount) weels, \(fuelTank)L fuel tank, NO ENGINE!!! ")
        }
    }
    
}

 
class SportCar: Car{
    var maxSpeed:Int
    init(name: String, sportCarEngine:Engine?, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        super.init(name: name + " SportCar", wheelCount: 4,  fuelTank: 200, engine:sportCarEngine)
    }
    override func info() {
        super.info()
        print("Max speed \(maxSpeed)")
    }
    func setNewEngine(engine:Engine){
        super.engine = engine
    }
}

class TruckCar: Car{
    let maxLoadKg: Int
    init(name: String, wheelCount: Int, maxLoadKg: Int, truckEngine:Engine) {
        self.maxLoadKg = maxLoadKg
        super.init(name: name + " Big Powerful Truck", wheelCount: wheelCount, fuelTank: 500, engine: truckEngine)
    }
    override func drive() {
        print("Slow drive...but whery powerful")
    }
    override func info() {
        super.info()
        print("Max load \(maxLoadKg)Kg")
    }
}
var sportCarEngine: Engine? //= Engine(horsePower: 300, valveCount: 32, fuelType: .petrol)
var truckCarEngine: Engine? = Engine(horsePower: 800, valveCount: 64, fuelType: .dizel)
    
var sportCar: SportCar? = SportCar(name: "Super Puper Fast Car", sportCarEngine: sportCarEngine, maxSpeed: 320)
var truckCar: TruckCar? = TruckCar(name:"Tutu",wheelCount: 8 , maxLoadKg: 15000, truckEngine: truckCarEngine!)

sportCar!.drive()
sportCarEngine = Engine(horsePower: 300, valveCount: 32, fuelType: .petrol)
sportCar!.setNewEngine(engine: sportCarEngine!)
sportCar!.drive()

sportCar!.info()
truckCar!.info()

sportCar = nil
truckCar = nil
sportCarEngine = nil
truckCarEngine = nil

