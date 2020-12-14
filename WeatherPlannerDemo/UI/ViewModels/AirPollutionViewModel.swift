import Foundation

class AirPollutionViewModel {

    var airQualityIndex: String?
    var carbonMonoxideLevel: String
    var nitrogenOxideLevel: String
    var nitrogenDioxideLevel: String
    var ozoneLevel: String
    var sulfurDioxideLevel: String
    var ammoniaLevel: String
    
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
