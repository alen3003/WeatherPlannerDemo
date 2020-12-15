import Foundation

struct City: Decodable {
    
    struct WeatherInfo: Decodable {
        let id: Int
        let main: String
        let description: String
    }
    
    struct TemperatureInfo: Decodable {
        let temp: Float
        let feels_like: Float
        let temp_min: Float
        let temp_max: Float
        let humidity: Float
    }
    
    struct WindInfo: Decodable {
        let speed: Float
        let deg: Float
    }
    
    struct Coordination: Decodable {
        let lat: Double
        let lon: Double
    }
    
    let id: Int
    let weather: [WeatherInfo]
    let main: TemperatureInfo
    let wind: WindInfo
    let name: String
    let coord: Coordination
}
