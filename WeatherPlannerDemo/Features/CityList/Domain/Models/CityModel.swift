struct CityModel {

    let id: Int
    let name: String
    let weatherInfo: String?
    let weatherDescription: String?
    let temperature: Float
    let temperatureFeelsLike: Float
    let minTemperature: Float
    let maxTemperature: Float
    let humidity: Float
    let windSpeed: Float
    let windDeg: Float
    let latitude: Double
    let longitude: Double

}

extension CityModel {

    init(from model: City) {
        self.id = model.id
        self.name = model.name
        self.weatherInfo = model.weather.first?.main
        self.weatherDescription = model.weather.first?.description
        self.temperature = model.main.temp
        self.temperatureFeelsLike = model.main.feels_like
        self.minTemperature = model.main.temp_min
        self.maxTemperature = model.main.temp_max
        self.humidity = model.main.humidity
        self.windSpeed = model.wind.speed
        self.windDeg = model.wind.deg
        self.latitude = model.coord.lat
        self.longitude = model.coord.lon
    }

}
