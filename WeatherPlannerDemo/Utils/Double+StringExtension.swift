import Foundation

extension Double {
    func formatedString() -> String {
        return String(format: "%.2f", self)
    }
}

extension String {
    func appendMeasuringUnit(_ unit: MeasurementUnitDescription, spacing: Bool = true) -> String {
        return "\(self)\(spacing ? " ": "")\(unit.rawValue)"
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func localized() -> String {
      let localizedString = NSLocalizedString(self, comment: "")
      return localizedString
    }
}
