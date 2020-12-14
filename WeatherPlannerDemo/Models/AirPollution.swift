import Foundation

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
