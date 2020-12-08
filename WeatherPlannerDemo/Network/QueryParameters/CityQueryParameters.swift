import Foundation

struct CityQueryParameters: QueryParameters, CustomReflectable {
    let cityName: String
    let appid: String = ApiKey.main.rawValue
    var unitSystem: String = MeasurementUnit.metric.rawValue
    var language: String = WeatherResponseLanguage.en.rawValue
    
    var customMirror: Mirror {
        return Mirror(self, children: ["q": cityName, "appid": appid, "units": unitSystem, "lang": language])
    }
}

