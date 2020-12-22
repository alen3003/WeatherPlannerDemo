import RxSwift

public protocol ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]?,
        memberType: ResultType.Type
    ) -> Observable<ResultType>

}

/**
 ApiClientProtocol extension that adds support for default parameters.
 */
public extension ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]? = nil,
        memberType: ResultType.Type
    ) -> Observable<ResultType> {
        return get(path: path, queryParameters: queryParameters, memberType: memberType)
    }
    
}
