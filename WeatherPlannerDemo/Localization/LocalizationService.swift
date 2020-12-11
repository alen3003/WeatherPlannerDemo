import Foundation

enum LocalizationKey: String {
    case helloMessage
    
    case windSpeed
    case maxTemp
    case minTemp
    
    case airQualityGood
    case airQualityFair
    case airQualityModerate
    case airQualityPoor
    case airQualityVeryPoor
    
    case airQualityIndex
    case carbonMonoxide
    case nitrogenOxide
    case nitrogenDioxide
    case ozone
    case sulfurDioxide
    case ammonia
    
    case airQualityMark
    case carbonMonoxideMark
    case nitrogenOxideMark
    case nitrogenDioxideMark
    case ozoneMark
    case sulfurDioxideMark
    case ammoniaMark
    
    var string: String {
        return rawValue.localized()
    }
}

extension LocalizationKey {
    static func getLocalizationKey(for string: String) -> LocalizationKey? {
        return LocalizationKey(rawValue: string)
    }
}
