import Foundation

struct CitiesInCircleParameters: QueryParameters, CustomReflectable {
    let appid: String = ApiKey.main.rawValue
    let latitude: String
    let longitude: String
    let radius: String
    var unitSystem: String = MeasurementUnit.metric.rawValue
    var language: String = WeatherResponseLanguage.en.rawValue
    
    var customMirror: Mirror {
        
        let children: [(label: String?, value: Any)] = [
            ("lat", latitude),
            ("lon", longitude),
            ("cnt", radius),
            ("appid", appid),
            ("units", unitSystem),
            ("lang", language)
        ]

        return Mirror(self, children: children)
    }
}
