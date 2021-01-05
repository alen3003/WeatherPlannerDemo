@testable import WeatherPlannerDemo

class CityMock {
    static var temperature: City.TemperatureInfo {
        return City.TemperatureInfo(
            temp: 0,
            feels_like: 0,
            temp_min: 0,
            temp_max: 0,
            humidity: 0)
    }
    
    static var wind: City.WindInfo {
        return City.WindInfo(speed: 0, deg: 0)
    }
    
    static var coordination: City.Coordination {
        return City.Coordination(lat: 0, lon: 0)
    }
    
    static func city(id: Int) -> City {
        return City(
            id: id,
            weather: [],
            main: temperature,
            wind: wind,
            name: "",
            coord: coordination)
    }
}
