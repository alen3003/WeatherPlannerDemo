//
//  CityQueryParameters.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import Foundation

struct CityQueryParameters: QueryParameters {
    let q: String
    let appid: String = ApiKey.main.rawValue
    var units: String = MeasurementUnit.metric.rawValue
    var lang: String = WeatherResponseLanguage.en.rawValue
}

