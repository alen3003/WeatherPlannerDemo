import RxSwift

public protocol ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]?
    ) -> Observable<ResultType>

}

/**
 ApiClientProtocol extension that adds support for default parameters.
 */
public extension ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]? = nil
    ) -> Observable<ResultType> {
        return get(path: path, queryParameters: queryParameters)
    }
    
}
