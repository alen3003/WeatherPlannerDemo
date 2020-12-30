import Resolver

public class CoreDataModule: AppModuleProtocol {
    
    public func registerDependencies(in container: Resolver) {
        registerStack(in: container)
        registerService(in: container)
    }
    
    private func registerStack(in container: Resolver) {
        container
            .register { CoreDataStack(containerName: "WeatherPlannerModel") }
            .implements(CoreDataStackProtocol.self)
            .scope(Resolver.application)
    }
    
    private func registerService(in container: Resolver) {
        container
            .register { CoreDataService() }
            .implements(CoreDataServiceProtocol.self)
            .scope(Resolver.application)
    }
    
}
