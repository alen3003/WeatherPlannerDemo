import Foundation

enum LocalizationKey: String {
    case helloMessage
    
    case airQualityGood
    case airQualityFair
    case airQualityModerate
    case airQualityPoor
    case airQualityVeryPoor
    
    var string: String {
        return rawValue.localized()
    }
}

extension LocalizationKey {
    static func getLocalizationKey(for string: String) -> LocalizationKey? {
        return LocalizationKey(rawValue: string)
    }
}

extension String {
    func localized() -> String {
      let localizedString = NSLocalizedString(self, comment: "")
      return localizedString
    }
}
