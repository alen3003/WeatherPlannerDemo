import Foundation

public protocol ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]?,
        memberType: ResultType.Type,
        resultHandler: @escaping (Result<ResultType, ApiError>) -> Void
    )

}

/**
 ApiClientProtocol extension that adds support for default parameters.
 */
public extension ApiClientProtocol {

    func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String: String]? = nil,
        memberType: ResultType.Type,
        resultHandler: @escaping (Result<ResultType, ApiError>) -> Void
    ) {
        return get(path: path, queryParameters: queryParameters, memberType: memberType, resultHandler: resultHandler)
    }
    
}
