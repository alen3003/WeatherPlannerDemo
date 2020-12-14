import Foundation

class CityViewModel {

    var coordination: City.Coordination
    var cityName: String
    var weatherDescription: String?
    var temperature: String
    var minTemperature: String
    var maxTemperature: String
    var windSpeed: String
    
    init(city: City) {
        self.coordination = city.coord
        self.cityName = city.name
        self.weatherDescription = city.weather.first?.description.capitalizingFirstLetter()
        self.temperature = "\(Int(city.main.temp))".appendMeasuringUnit(.celsius, spacing: false)
        self.minTemperature = "\(LocalizationKey.minTemp.string) \(Int(city.main.temp_min))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.maxTemperature = "\(LocalizationKey.maxTemp.string) \(Int(city.main.temp_max))"
            .appendMeasuringUnit(.celsius, spacing: false)
        self.windSpeed = "\(LocalizationKey.windSpeed.string) \(city.wind.speed)".appendMeasuringUnit(.velocityBasic)
    }
}
