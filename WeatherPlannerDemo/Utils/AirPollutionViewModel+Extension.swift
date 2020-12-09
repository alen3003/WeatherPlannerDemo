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
}
