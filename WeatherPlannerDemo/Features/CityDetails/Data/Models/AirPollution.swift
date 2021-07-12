struct AirPollution: Decodable {

    struct AirQuality: Decodable {
        let aqi: Int
    }

    struct AirPollutionComponents: Decodable {
        let co: Double
        let no: Double
        let no2: Double
        let o3: Double
        let so2: Double
        let nh3: Double
    }

    let main: AirQuality
    let components: AirPollutionComponents
}

struct AirPollutionWrapper: Decodable {
    let list: [AirPollution]
}

extension AirPollution {

    init(cdAirPollution: CDAirPollution) {
        self.main = AirQuality(aqi: Int(cdAirPollution.aqi))
        self.components = AirPollution.airPollutionComponents(cdAirPollution)
    }

    private static func airPollutionComponents(_ airPollution: CDAirPollution) -> AirPollutionComponents {
        AirPollutionComponents(
            co: airPollution.co,
            no: airPollution.no,
            no2: airPollution.no2,
            o3: airPollution.o3,
            so2: airPollution.so2,
            nh3: airPollution.nh3
        )
    }

}
