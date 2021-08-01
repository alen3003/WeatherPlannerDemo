extension AirPollutionViewModel {

    enum AirPollutionLabelType: String, CaseIterable {
        case airQualityIndex
        case carbonMonoxideLevel
        case nitrogenOxideLevel
        case nitrogenDioxideLevel
        case ozoneLevel
        case sulfurDioxideLevel
        case ammoniaLevel
    }

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
    
    func airPollutionDetails() -> [AirPollutionDetailsViewModel] {
        var airPollutionDetailsViewModel: [AirPollutionDetailsViewModel] = []
        AirPollutionLabelType.allCases.forEach({ airPollutionDetailsViewModel.append(createAirPollutionDetail($0)) })

        return airPollutionDetailsViewModel
    }
    
    private func createAirPollutionDetail(
        _ airPollutionLabelType: AirPollutionLabelType
    ) -> AirPollutionDetailsViewModel {
        switch airPollutionLabelType {
        case .airQualityIndex:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.airQualityIndex.string,
                mark: LocalizationKey.airQualityMark.string,
                value: airQualityIndex ?? "-")
        case .carbonMonoxideLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.carbonMonoxide.string,
                mark: LocalizationKey.carbonMonoxideMark.string,
                value: carbonMonoxideLevel)
        case .nitrogenOxideLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.nitrogenOxide.string,
                mark: LocalizationKey.nitrogenOxideMark.string,
                value: nitrogenOxideLevel)
        case .nitrogenDioxideLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.nitrogenDioxide.string,
                mark: LocalizationKey.nitrogenDioxideMark.string,
                value: nitrogenDioxideLevel)
        case .ozoneLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.ozone.string,
                mark: LocalizationKey.ozoneMark.string,
                value: ozoneLevel)
        case .sulfurDioxideLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.sulfurDioxide.string,
                mark: LocalizationKey.sulfurDioxideMark.string,
                value: sulfurDioxideLevel)
        case .ammoniaLevel:
            return AirPollutionDetailsViewModel(
                name: LocalizationKey.ammonia.string,
                mark: LocalizationKey.ammoniaMark.string,
                value: ammoniaLevel)
        }
    }
    
}
