import Resolver

public class CoreDataModule: AppModuleProtocol {
    
    public func registerDependencies(in container: Resolver) {
        registerStack(in: container)
        registerService(in: container)
    }
    
    private func registerStack(in container: Resolver) {
        container.register { _ -> CoreDataStackProtocol in
            return CoreDataStack(containerName: "WeatherPlannerModel")
        }
        .scope(Resolver.application)
    }
    
    private func registerService(in container: Resolver) {
        container.register { _ -> CoreDataServiceProtocol in
            return CoreDataService(coreDataStack: container.resolve())
        }
        .scope(Resolver.application)
    }
    
}
