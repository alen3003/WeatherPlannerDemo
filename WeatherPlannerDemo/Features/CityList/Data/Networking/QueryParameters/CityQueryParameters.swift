struct CityQueryParameters: QueryParameters, CustomReflectable {
    let cityName: String
    let appid: String = ApiKey.main.rawValue
    var unitSystem: String = MeasurementUnit.metric.rawValue
    var language: String = WeatherResponseLanguage.en.rawValue
    var customMirror: Mirror {
        let children: [(label: String?, value: Any)] = [
            ("q", cityName),
            ("appid", appid),
            ("units", unitSystem),
            ("lang", language)
        ]
        
        return Mirror(self, children: children)
    }
}
