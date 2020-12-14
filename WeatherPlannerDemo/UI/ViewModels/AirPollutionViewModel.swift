import Foundation

class AirPollutionViewModel {

    let carbonMonoxideLevel: String
    let nitrogenOxideLevel: String
    let nitrogenDioxideLevel: String
    let ozoneLevel: String
    let sulfurDioxideLevel: String
    let ammoniaLevel: String
    var airQualityIndex: String?
    
    lazy var airPollutionDetailsViewModel: [AirPollutionDetailsViewModel] = {
        return airPollutionDetails()
    }()
    
    init(airPollution: AirPollution) {
        self.carbonMonoxideLevel = airPollution.components.co.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.nitrogenOxideLevel = airPollution.components.no.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.nitrogenDioxideLevel = airPollution.components.no2.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.ozoneLevel = airPollution.components.o3.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.sulfurDioxideLevel = airPollution.components.so2.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.ammoniaLevel = airPollution.components.nh3.formatedString().appendMeasuringUnit(.airPollutionLevel)
        self.airQualityIndex = airPollutionDescription(airPollution.main.aqi)
    }
    
}
