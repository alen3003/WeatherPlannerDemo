struct CityViewModel {

    let cityID: Int
    let latitude: Double
    let longitude: Double
    let cityName: String
    let weatherDescription: String?
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let windSpeed: String

}

extension CityViewModel {

    init(city: CityModel) {
        self.cityID = city.id
        self.latitude = city.latitude
        self.longitude = city.longitude
        self.cityName = city.name
        self.weatherDescription = city.weatherDescription?.capitalizingFirstLetter()
        self.temperature = "\(Int(city.temperature))".appendMeasuringUnit(.celsius, spacing: false)
        self.minTemperature = "\(LocalizationKey.minTemp.string) \(Int(city.minTemperature))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.maxTemperature = "\(LocalizationKey.maxTemp.string) \(Int(city.maxTemperature))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.windSpeed = "\(LocalizationKey.windSpeed.string) \(city.windSpeed)".appendMeasuringUnit(.velocityBasic)
    }

    init(city: CDCity) {
        self.cityID = Int(city.id)
        self.latitude = city.coordination.latitude
        self.longitude = city.coordination.longitude
        self.cityName = city.name
        self.weatherDescription = city.weather.weatherDescription
        self.temperature = "\(Int(city.temperature.temp))".appendMeasuringUnit(.celsius, spacing: false)
        self.minTemperature = "\(LocalizationKey.minTemp.string) \(Int(city.temperature.tempMin))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.maxTemperature = "\(LocalizationKey.maxTemp.string) \(Int(city.temperature.tempMax))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.windSpeed = "\(LocalizationKey.windSpeed.string) \(city.wind.speed)".appendMeasuringUnit(.velocityBasic)
    }

}
