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
        self.weather = [City.weatherInfo(cdCity)]
        self.main = City.temperatureInfo(cdCity)
        self.wind = WindInfo(speed: cdCity.wind.speed, deg: cdCity.wind.deg)
        self.coord = Coordination(lat: cdCity.coordination.latitude, lon: cdCity.coordination.longitude)
    }

    private static func weatherInfo(_ city: CDCity) -> WeatherInfo {
        WeatherInfo(
            id: Int(city.weather.id),
            main: city.weather.title,
            description: city.weather.weatherDescription)
    }

    private static func temperatureInfo(_ city: CDCity) -> TemperatureInfo {
        TemperatureInfo(
            temp: city.temperature.temp,
            feels_like: city.temperature.feelsLike,
            temp_min: city.temperature.tempMin,
            temp_max: city.temperature.tempMax,
            humidity: city.temperature.humidity)
    }

}
