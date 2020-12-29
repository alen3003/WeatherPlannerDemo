import Resolver

public class NetworkModule: AppModuleProtocol {
    
    public func registerDependencies(in container: Resolver) {
        registerCityListApiClient(in: container)
        registerCityDetailsApiClient(in: container)
    }

    private func registerCityListApiClient(in container: Resolver) {
        container.register { _ -> CityListApiClientProtocol in
            return CityListApiClient(baseUrl: ApiEndpoints.base.rawValue)
        }
        .scope(Resolver.application)
    }
        
    private func registerCityDetailsApiClient(in container: Resolver) {
        container.register { _ -> CityDetailsApiClientProtocol in
            return CityDetailsApiClient(baseUrl: ApiEndpoints.base.rawValue)
        }
        .scope(Resolver.application)
    }
}
