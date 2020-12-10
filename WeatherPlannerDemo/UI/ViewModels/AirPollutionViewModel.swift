import Foundation

class AirPollutionViewModel {
    
    let airPollution: AirPollution
    
    var airQualityIndex: String? {
        return airPollutionDescription(airPollution.main.aqi)
    }
    
    var carbonMonoxideLevel: String {
        return airPollution.components.co.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    var nitrogenOxideLevel: String {
        return airPollution.components.no.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    var nitrogenDioxideLevel: String {
        return airPollution.components.no2.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    var ozoneLevel: String {
        return airPollution.components.o3.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    var sulfurDioxideLevel: String {
        return airPollution.components.so2.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    var ammoniaLevel: String {
        return airPollution.components.nh3.formatedString().appendMeasuringUnit(.airPollutionLevel)
    }
    
    init(airPollution: AirPollution) {
        self.airPollution = airPollution
    }
    
}
