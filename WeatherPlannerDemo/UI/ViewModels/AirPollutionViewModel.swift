import Foundation

class AirPollutionViewModel {
    
    let airPollution: AirPollution
    
    var airQualityIndex: String? {
        return airPollutionDescription(airPollution.main.aqi)
    }
    
    var carbonMonoxideLevel: String {
        return airPollution.components.co.formatedString().appendMeasuringUnit()
    }
    
    var nitrogenOxideLevel: String {
        return airPollution.components.no.formatedString().appendMeasuringUnit()
    }
    
    var nitrogenDioxideLevel: String {
        return airPollution.components.no2.formatedString().appendMeasuringUnit()
    }
    
    var ozoneLevel: String {
        return airPollution.components.o3.formatedString().appendMeasuringUnit()
    }
    
    var sulfurDioxideLevel: String {
        return airPollution.components.so2.formatedString().appendMeasuringUnit()
    }
    
    var ammoniaLevel: String {
        return airPollution.components.nh3.formatedString().appendMeasuringUnit()
    }
    
    init(airPollution: AirPollution) {
        self.airPollution = airPollution
    }
    
}
