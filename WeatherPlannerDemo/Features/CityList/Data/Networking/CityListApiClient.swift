import RxSwift

final class CityListApiClient: BaseApiClient,
                               CityListApiClientProtocol {

    func fetchCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int
    ) -> Observable<CitiesInCircle> {
        get(
            path: ApiEndpoints.citiesInCircle.rawValue,
            queryParameters: parameters(
                for: coordinate, in: range)
                .propertyPairs())
    }

    private func parameters(
        for coordinate: City.Coordination,
        in range: Int
    ) -> CitiesInCircleQueryParameters {
        CitiesInCircleQueryParameters(
            latitude: "\(coordinate.lat)",
            longitude: "\(coordinate.lon)",
            radius: "\(range)",
            language: WeatherResponseLanguage.sl.rawValue
        )
    }

}
