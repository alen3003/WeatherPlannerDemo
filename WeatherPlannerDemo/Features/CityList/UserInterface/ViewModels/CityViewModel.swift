import RxDataSources

class CityViewModel {
    
    let cityID: Int
    let coordination: City.Coordination
    let cityName: String
    let weatherDescription: String?
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let windSpeed: String
    
    init(city: City) {
        self.cityID = city.id
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
    
    init(city: CDCity) {
        self.cityID = Int(city.id)
        self.coordination = City.Coordination(lat: city.coordination.latitude, lon: city.coordination.longitude)
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

extension CityViewModel: IdentifiableType, Equatable {
    typealias Identity = Int
    var identity: Identity {
        return cityID
    }
    
    static func == (lhs: CityViewModel, rhs: CityViewModel) -> Bool {
        return lhs.identity == rhs.identity
    }
}
