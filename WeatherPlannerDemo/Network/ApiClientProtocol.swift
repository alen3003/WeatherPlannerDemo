//
//  ApiClientProtocol.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import Foundation

public protocol ApiClientProtocol {

    func get<ResultType: Decodable>(path: String, queryParameters: [String: String]?, memberType: ResultType.Type, resultHandler: @escaping (Result<ResultType, ApiError>) -> ())

}

/**
 ApiClientProtocol extension that adds support for default parameters.
 */
public extension ApiClientProtocol {

    func get<ResultType: Decodable>(path: String, queryParameters: [String: String]? = nil, memberType: ResultType.Type, resultHandler: @escaping (Result<ResultType, ApiError>) -> ()){
        return get(path: path, queryParameters: queryParameters, memberType: memberType, resultHandler: resultHandler)
    }
    
}
