import Resolver

public class NetworkModule: AppModuleProtocol {
    
    public func registerDependencies(in container: Resolver) {
        registerCityListApiClient(in: container)
        registerCityDetailsApiClient(in: container)
    }

    private func registerCityListApiClient(in container: Resolver) {
        container
            .register { CityListApiClient(baseUrl: ApiEndpoints.base.rawValue) }
            .implements(CityListApiClientProtocol.self)
            .scope(Resolver.application)
    }
        
    private func registerCityDetailsApiClient(in container: Resolver) {
        container
            .register { CityDetailsApiClient(baseUrl: ApiEndpoints.base.rawValue) }
            .implements(CityDetailsApiClientProtocol.self)
            .scope(Resolver.application)
    }
}
