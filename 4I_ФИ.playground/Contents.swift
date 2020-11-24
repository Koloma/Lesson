import Foundation
//Домашнее задание №4
/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
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

