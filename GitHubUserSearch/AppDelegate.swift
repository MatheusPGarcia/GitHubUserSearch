//
//  AppDelegate.swift
//  GitHubUserSearch
//
//  Created by Matheus Garcia on 26/07/19.
//  Copyright © 2019 Matheus Garcia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let storyboard = UIStoryboard(name: "UserSearch", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as? UserSearchViewController
        UserSearchRouter.createUserSearchModule(withViewController: viewController)

        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
