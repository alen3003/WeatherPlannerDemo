import Resolver

extension Resolver: ResolverRegistering {

    static var custom = Resolver()

    public static func registerAllServices() {
        AppDependencies.shared.registerDependencies(in: custom)
    }

}
