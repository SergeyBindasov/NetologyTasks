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
    
    var window: UIWindow?
    
    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        
    
        let tabBarController = UITabBarController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let storyboardVCFeed = storyboard.instantiateViewController(withIdentifier: "feed")
        let storyboardVCLogin = storyboard.instantiateViewController(withIdentifier: "login")
        let FeedNavigationController = UINavigationController(rootViewController: storyboardVCFeed)
        
        storyboardVCFeed.title = "Feed"
        if #available(iOS 13.0, *) {
            storyboardVCFeed.tabBarItem.image = UIImage(systemName: "house.fill")
        } else {
            // Fallback on earlier versions
        }
        storyboardVCLogin.title = "Profile"
        if #available(iOS 13.0, *) {
            storyboardVCLogin.tabBarItem.image = UIImage(systemName: "person.fill")
        } else {
            // Fallback on earlier versions
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        tabBarController.viewControllers = [FeedNavigationController, storyboardVCLogin]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("ResignActive")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("BecomeActive")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("EnterBackground")
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("EnterForeground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("WillTerminate")
    }
    
}

