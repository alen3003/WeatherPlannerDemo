//
//  AppDelegate.swift
//  WeatherPlannerDemo
//
//  Created by Alen Sebalj on 07.12.2020..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let networkModuleClient = NetworkModule().registerClient()
        let cityParameters = CityQueryParameters(q: "zagreb", lang: WeatherResponseLanguage.hr.rawValue).propertyPairs()
        networkModuleClient.get(path: ApiEndpoints.weather.rawValue, queryParameters: cityParameters, memberType: City.self) { (result) in
            switch result{
            case .success(let city):
                print(city.name)
            case .failure(let error):
                //error happened
                break
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

