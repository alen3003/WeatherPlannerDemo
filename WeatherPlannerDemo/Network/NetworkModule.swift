//
//  NetworkModule.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import Foundation

public class NetworkModule {

    func registerClient() -> ApiClientProtocol {
        return BaseApiClient(baseUrl: ApiEndpoints.base.rawValue, urlSession: URLSession.shared)
    }

}
