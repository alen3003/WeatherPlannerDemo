//
//  BaseApiClient.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import Foundation

public class BaseApiClient: ApiClientProtocol {
    
    private let baseUrl: String
    private let urlSession: URLSession
    
    public init(baseUrl: String, urlSession: URLSession) {
        self.baseUrl = baseUrl
        self.urlSession = urlSession
    }
    
    public func get<ResultType: Decodable>(
        path: String,
        queryParameters: [String : String]?,
        memberType: ResultType.Type,
        resultHandler: @escaping (Result<ResultType, ApiError>) -> ()
    ) {
        executeAndReturn(path: path, method: .get, parameters: queryParameters, resultHandler: resultHandler)
    }
    
    private func executeAndReturn<ParamsType: Encodable, ResultType: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil,
        resultHandler: @escaping (Result<ResultType, ApiError>) -> ()
    ) {
        let request = buildRequest(path: path, method: method, parameters: parameters)

        let urlTask = urlSession.dataTask(with: request) {  (data, response, error) in
            guard
                let httpReponse = response as? HTTPURLResponse,
                //when [weak self], self if always nil ???
                //let self = self,
                let statusCode = HttpStatusCode(rawValue: httpReponse.statusCode)
            else { return }
            
            if let error = self.mapToApiError(status: statusCode){
                print("Request failed with error: \(error)")
                resultHandler(.failure(error))
                return
            }
            
            guard let result: ResultType = self.parse(data: data) else {
                resultHandler(.failure(ApiError.noData))
                return
            }
            
            resultHandler(.success(result))
        }
        
        urlTask.resume()
    }

    private func execute<ParamsType: Encodable>(
        path: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil,
        resultHandler: @escaping (Result<Bool, ApiError>) -> ()
    ) {
        let request = buildRequest(path: path, method: method, parameters: parameters)

        let urlTask = urlSession.dataTask(with: request) { [weak self] (data, response, error) in
            guard
                let httpReponse = response as? HTTPURLResponse,
                let self = self,
                let statusCode = HttpStatusCode(rawValue: httpReponse.statusCode)
            else { return }
            
            if let error = self.mapToApiError(status: statusCode){
                print("Request failed with error: \(error)")
                resultHandler(.failure(error))
                return
            }
            
            resultHandler(.success(true))
        }
        
        urlTask.resume()
    }
    
    private func buildRequest<ParamsType: Encodable>(
        path: String,
        method: HTTPMethod,
        parameters: ParamsType? = nil
    ) -> URLRequest {
        var components = URLComponents(string: "\(baseUrl)\(path)")!

        if
            method == .get || method == .delete,
            let parameters = parameters as? [String: String]
        {
            components.queryItems = parameters.map(URLQueryItem.init)
        }

        var urlRequest = URLRequest(url: components.url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if
            let parameters = parameters,
            method == .post || method == .patch
        {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }

        return urlRequest
    }

    private func parse<ResultType: Decodable>(data: Data?) -> ResultType? {
        guard let data = data else {
            print("Data does not exist...")
            return nil
        }

        do {
            let dataString = String(decoding: data, as: UTF8.self)
            print("Got data: \(dataString)")
            return try JSONDecoder().decode(ResultType.self, from: data)
        } catch {
            print("Unexpected error on decoding data to \(ResultType.self)! (\(error)")
            return nil
        }
    }

    private func mapToApiError(status: HttpStatusCode) -> ApiError? {
        switch status {
        case .ok, .created, .accepted, .noContent:
            return nil
        case .badRequest, .notAcceptable, .unsupportedMediaType:
            return .badRequest
        case .unauthorized, .forbidden:
            return .unauthorized
        case .notFound:
            return .notFound
        case .methodNotAllowed, .requestTimeout:
            return .general
        case .internalServerError, .notImplemented, .badGateway, .serviceUnavailable, .gatewayTimeout:
            return .serverError
        }
    }
}
