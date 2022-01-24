//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //let appConfiguration: AppConfiguration
        
        var _: AppConfiguration
        
        let stringOne = AppConfiguration.firstCase(first: "https://swapi.dev/api/people/8")
        let stringTwo = AppConfiguration.secondCase(second: "https://swapi.dev/api/starships/3")
        let stringThree = AppConfiguration.thirdCase(third: "https://swapi.dev/api/planets/5")
        
        NetworkManager.performRequest(with: stringOne.urlString)
        NetworkManager.performRequest(with: stringTwo.urlString)
        NetworkManager.performRequest(with: stringThree.urlString)
     
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

