struct AirPollutionQueryParameters: QueryParameters, CustomReflectable {
    let appid: String = ApiKey.main.rawValue
    let latitude: String
    let longitude: String
    var customMirror: Mirror {
        let children: [(label: String?, value: Any)] = [
            ("lat", latitude),
            ("lon", longitude),
            ("appid", appid)
        ]

        return Mirror(self, children: children)
    }
}
