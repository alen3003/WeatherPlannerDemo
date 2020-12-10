import Foundation

extension Double {
    func formatedString() -> String {
        return String(format: "%.2f", self)
    }
}

extension String {
    func appendMeasuringUnit(_ unit: MeasurementUnitDescription) -> String {
        return "\(self) \(unit.rawValue)"
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
