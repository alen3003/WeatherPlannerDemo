import Foundation

class CityViewModel {
    
    let city: City
    
    var cityName: String {
        return city.name
    }
    
    var weatherDescription: String? {
        return city.weather.first?.description.capitalizingFirstLetter()
    }
    
    var temperature: String {
        return "\(Int(city.main.temp))".appendMeasuringUnit(.celsius, spacing: false)
    }
    
    var minTemperature: String {
        return "\(LocalizationKey.minTemp.string) \(Int(city.main.temp_min))"
            .appendMeasuringUnit(.celsius, spacing: false)
    }
    
    var maxTemperature: String {
        return "\(LocalizationKey.maxTemp.string) \(Int(city.main.temp_max))"
            .appendMeasuringUnit(.celsius, spacing: false)
    }
    
    var windSpeed: String {
        return "\(LocalizationKey.windSpeed.string) \(city.wind.speed)".appendMeasuringUnit(.velocityBasic)
    }
    
    init(city: City) {
        self.city = city
    }
}
