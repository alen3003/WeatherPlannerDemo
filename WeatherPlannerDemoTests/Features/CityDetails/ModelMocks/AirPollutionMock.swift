@testable import WeatherPlannerDemo

class AirPollutionMock {

    static var airQuality: AirPollution.AirQuality {
        AirPollution.AirQuality(aqi: 1)
    }

    static var airPollutionComponents: AirPollution.AirPollutionComponents {
        AirPollution.AirPollutionComponents(co: 0, no: 0, no2: 0, o3: 0, so2: 0, nh3: 0)
    }
    
    static var airPollution: AirPollution {
        AirPollution(main: airQuality, components: airPollutionComponents)
    }

}
