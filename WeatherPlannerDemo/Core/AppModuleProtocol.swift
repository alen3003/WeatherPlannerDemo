import Resolver

public protocol AppModuleProtocol {
    func registerDependencies(in container: Resolver)
}
