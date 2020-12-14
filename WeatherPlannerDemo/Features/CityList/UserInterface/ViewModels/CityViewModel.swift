import Foundation

class CityViewModel {

    let coordination: City.Coordination
    let cityName: String
    let weatherDescription: String?
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let windSpeed: String
    
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