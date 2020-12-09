import Foundation

extension Double {
    func formatedString() -> String {
        return String(format: "%.2f", self)
    }
}

extension String {
    func appendMeasuringUnit() -> String {
        return "\(self) μg/m³"
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
