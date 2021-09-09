@testable import WeatherPlannerDemo

class AirPollutionMock {

    private let airQuality: AirPollution.AirQuality
    private let airPollutionComponents: AirPollution.AirPollutionComponents

    var airPollution: AirPollution {
        AirPollution(main: airQuality, components: airPollutionComponents)
    }

    init() {
        airQuality = AirPollution.AirQuality(aqi: 1)
        airPollutionComponents = AirPollution.AirPollutionComponents(
            co: 0.12,
            no: 0.5,
            no2: 0.01,
            o3: 0.03,
            so2: 0.02,
            nh3: 0.0001)
    }

}
