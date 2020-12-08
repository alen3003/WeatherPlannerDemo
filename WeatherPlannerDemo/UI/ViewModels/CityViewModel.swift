import Foundation

class CityViewModel {
    
    let city: City
    
    var name: String {
        return city.name
    }
    
    var weatherDescription: String {
        return city.weather.description
    }
    
    var temperature: String {
        return "\(Int(city.main.temp))°"
    }
    
    var minTemperature: String {
        return "\(Int(city.main.temp_min))°"
    }
    
    var maxTemperature: String {
        return "\(Int(city.main.temp_max))°"
    }
    
    var windSpeed: String {
        return "\(city.wind.speed) m/s"
    }
    
    init(city: City) {
        self.city = city
    }
}
