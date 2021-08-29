@testable import WeatherPlannerDemo

class CityMock {

    static var temperature: City.TemperatureInfo {
        City.TemperatureInfo(
            temp: 0,
            feels_like: 0,
            temp_min: 0,
            temp_max: 0,
            humidity: 0)
    }

    static var wind: City.WindInfo {
        City.WindInfo(speed: 0, deg: 0)
    }

    static var coordination: City.Coordination {
        City.Coordination(lat: 0, lon: 0)
    }

    static func city(id: Int) -> CityModel {
        let city = City(
            id: id,
            weather: [],
            main: temperature,
            wind: wind,
            name: "",
            coord: coordination)

        return CityModel(from: city)
    }

}
