//
//  Logger.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import Foundation

class Logger {
    static func print(string: String){
        #if DEBUG
        Swift.print(string)
        #endif
    }
}
