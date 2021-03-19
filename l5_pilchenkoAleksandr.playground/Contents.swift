import Cocoa

enum windows {
    case open
    case closed
}
enum engine {
    case on
    case off
}

protocol Car {
    var marka: String {get}
    var yearMaking: Int {get}
    var engineState: engine {get set}
    var windowsState: windows {get set}
}

extension Car {
    mutating func changeEngineState(engineState: engine){
        self.engineState = engineState
    }
    
    mutating func chageWindowsState(windowsState: windows){
        self.windowsState = windowsState
    }
}
class basicCar: Car{
    var marka: String
    var yearMaking: Int
    var engineState: engine = .off
    var windowsState: windows = .closed
    init(marka: String, yearMaking: Int) {
        self.marka = marka
        self.yearMaking = yearMaking
    }
}
class sportCar: basicCar, CustomStringConvertible{
    var description: String{
        return "Двигатель: \(engineState) \nОкна: \(windowsState) \nГод выпуска:  \(yearMaking)"
    }
}
class truckCar: basicCar, CustomStringConvertible{
    var description: String{
        return "Двигатель: \(engineState) \nОкна: \(windowsState) \nГод выпуска: \(yearMaking)"
    }
}
var subaru = sportCar(marka: "Subaru", yearMaking: 2019)

subaru.changeEngineState(engineState: .on)
print(subaru.description)

var ford = truckCar(marka: "Ford", yearMaking: 2020)

ford.chageWindowsState(windowsState: .open)
print("""
    --------------
\(ford.description)
""")


