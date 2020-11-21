import Foundation
//Домашнее задание №3
/*
 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
*/

enum CarAction{
    case engineOn, engineOff, windowsOpen, windowsClose
    case trunkLoad(Int)
    case trunkUnload(Int)
}
enum EngenState {
    case turnedOn, turnedOff
}

struct  Car{
    let marka: String
    let year: Int
    let maxTrunkLoad: Int
    var trunkLoad: Int = 0
    var engineState: EngenState = .turnedOff
    var isWindowsOpen: Bool = false
    var isTrunkFull: Bool = false
    
    mutating func doAction(action: CarAction){
        switch action {
        case .engineOff:
            if self.engineState == .turnedOn {
                self.engineState = .turnedOff
                print("Engine turn off")
            }
            else {print("Engine alredy Off")}
        case .engineOn:
            if self.engineState == .turnedOff {
                self.engineState = .turnedOn
                print("Engine turn on")
            }
            else {print("Engine alredy On")}
            
        case .windowsOpen:
            if !isWindowsOpen {
                isWindowsOpen.toggle()
                print("Open windows")
            }
            else {print("Windows alredy open")}
        case .windowsClose:
            if isWindowsOpen {
                isWindowsOpen.toggle()
                print("Close windows")
            }
            else {print("Windows alredy close")}
        case .trunkLoad(let load):
            if !isTrunkFull {
                trunkLoad += load
                if trunkLoad >= maxTrunkLoad {
                    isTrunkFull = true
                    trunkLoad = maxTrunkLoad
                }
                print("Trunk loaded \(trunkLoad) kg")
            }
            else {print("Trunk is fully loaded")}
        case .trunkUnload(let unLoad):
            if trunkLoad > 0 {
                trunkLoad -= unLoad
                if trunkLoad < 0 {
                    trunkLoad = 0
                }
                if trunkLoad < maxTrunkLoad {isTrunkFull = false}
                print("Trunk unLoaded \(trunkLoad) kg")
            }
            else {print("Trunk is empty")}
        }
        self.description()
    }
    
    func description(){
        print(self.marka, self.year, self.trunkLoad, self.engineState, self.isWindowsOpen, self.isTrunkFull)
    }
}

var sportCar: Car = Car(marka: "Porsh", year: 2020, maxTrunkLoad: 200)
var bigTruck: Car = Car(marka: "Kamaz", year: 2001, maxTrunkLoad: 2000)
sportCar.description()
sportCar.doAction(action: .trunkLoad(150))
sportCar.doAction(action: .trunkLoad(100))
sportCar.doAction(action: .engineOff)
sportCar.doAction(action: .engineOn)
sportCar.doAction(action: .windowsOpen)
sportCar.doAction(action: .trunkUnload(100))
print()
bigTruck.description()
bigTruck.doAction(action: .trunkUnload(100))
bigTruck.doAction(action: .trunkLoad(1000))
bigTruck.doAction(action: .trunkLoad(1000))
bigTruck.doAction(action: .engineOn)


