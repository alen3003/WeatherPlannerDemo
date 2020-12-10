import Foundation

extension AirPollutionViewModel {
    func airPollutionDescription(_ airPollutionIndex: Int) -> String? {
        switch airPollutionIndex {
        case 1:
            return LocalizationKey.airQualityGood.string
        case 2:
            return LocalizationKey.airQualityFair.string
        case 3:
            return LocalizationKey.airQualityModerate.string
        case 4:
            return LocalizationKey.airQualityPoor.string
        case 5:
            return LocalizationKey.airQualityVeryPoor.string
        default:
            return nil
        }
    }
    
    func airPollutionData() -> [(name: String, mark: String, value: String)] {
        return [
            (LocalizationKey.airQualityIndex.string, LocalizationKey.airQualityMark.string, airQualityIndex ?? "-"),
            (LocalizationKey.carbonMonoxide.string, LocalizationKey.carbonMonoxideMark.string, carbonMonoxideLevel),
            (LocalizationKey.nitrogenOxide.string, LocalizationKey.nitrogenOxideMark.string, nitrogenOxideLevel),
            (LocalizationKey.nitrogenDioxide.string, LocalizationKey.nitrogenDioxideMark.string, nitrogenDioxideLevel),
            (LocalizationKey.ozone.string, LocalizationKey.ozoneMark.string, ozoneLevel),
            (LocalizationKey.sulfurDioxide.string, LocalizationKey.sulfurDioxideMark.string, sulfurDioxideLevel),
            (LocalizationKey.ammonia.string, LocalizationKey.ammoniaMark.string, ammoniaLevel)
        ]
    }
}
