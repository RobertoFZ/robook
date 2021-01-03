//
//  NavigationHelper.swift
//  Subasta Ganadera
//
//  Created by Roberto Franco on 04/09/20.
//  Copyright © 2020 Roberto Franco. All rights reserved.
//

import Foundation
import UIKit

open class NavigationHelper {
    public static func sendToHomeViewController() {
        let story = UIStoryboard(name: Storyboard.Home.rawValue, bundle:nil)
        let nvc = story.instantiateViewController(withIdentifier: NavigationControllers.NavigationController.rawValue) as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    public static func sendToLogin() {
        let story = UIStoryboard(name: Storyboard.Login.rawValue, bundle:nil)
        let nvc = story.instantiateViewController(withIdentifier: NavigationControllers.NavigationController.rawValue) as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    public static func sendToHomeViewFromDelegate(){
       /*
         let homeViewController = NavigationHelper.getViewControllerFromStoryboardWithId(
             Storyboard.Home,
             targetViewController: NavigationControllers.HomeViewController
             ) as! HomeViewController
         self.setRootController(homeViewController)
        */
    }
    
    public static func sendToViewController(storyboard: String) {
        let story = UIStoryboard(name: storyboard, bundle:nil)
        let nvc = story.instantiateViewController(withIdentifier: NavigationControllers.NavigationController.rawValue) as! UINavigationController
        UIApplication.shared.windows.first?.rootViewController = nvc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

}

extension NavigationHelper {
    
    static func setRootController(_ newRootViewController: UIViewController, changingStatusBar: Bool = false){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if appDelegate.window == nil {
            print("Window on delegate is nil, creating new main screen with bounds")
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        if changingStatusBar {
            let navigation = UINavigationController(rootViewController: newRootViewController)
            appDelegate.window?.rootViewController = navigation
        } else {
            appDelegate.window?.rootViewController = newRootViewController
        }
        appDelegate.window?.makeKeyAndVisible()
        
        if changingStatusBar {
            // TODO: Maybe change status bar style
        }
    }
    
    static func getViewControllerFromStoryboardWithId(_ targetStoryboardName: Storyboard, targetViewController: NavigationControllers) -> UIViewController? {
        let storyboard = UIStoryboard(name: targetStoryboardName.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: targetViewController.rawValue)
    }
    
}

public enum Storyboard: String {
    case Home
    case Login
}

public enum NavigationControllers: String {
    case HomeViewController
    case LoginViewController
    case SideMenuViewController
    case NavigationController
}

public enum Segues: String {
    case Test
}
