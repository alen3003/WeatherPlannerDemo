import Foundation

public class NetworkModule {

    func registerClient() -> ApiClientProtocol {
        return BaseApiClient(baseUrl: ApiEndpoints.base.rawValue, urlSession: URLSession.shared)
    }

}
