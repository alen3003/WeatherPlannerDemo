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

extension City {
    init(cdCity: CDCity) {
        self.id = Int(cdCity.id)
        self.name = cdCity.name
        self.weather = [WeatherInfo(
                            id: Int(cdCity.weather.id),
                            main: cdCity.weather.title,
                            description: cdCity.weather.weatherDescription)]
        self.main = TemperatureInfo(temp: cdCity.temperature.temp,
                                    feels_like: cdCity.temperature.feelsLike,
                                    temp_min: cdCity.temperature.tempMin,
                                    temp_max: cdCity.temperature.tempMax,
                                    humidity: cdCity.temperature.humidity)
        self.wind = WindInfo(speed: cdCity.wind.speed, deg: cdCity.wind.deg)
        self.coord = Coordination(lat: cdCity.coordination.latitude, lon: cdCity.coordination.longitude)
    }
}
