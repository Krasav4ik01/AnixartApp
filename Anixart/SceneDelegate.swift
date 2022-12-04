//
//  SceneDelegate.swift
//  Anixart
//
//  Created by Rustem on 21.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
//    var navController = UINavigationController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
//        window?.rootViewController = MainTabBarController()
        window?.rootViewController = UINavigationController(rootViewController: MainTabBarController()) 
        window?.makeKeyAndVisible()
        
//        let navContr = UINavigationController(rootViewController: ViewController())
//
//
//
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//
//        window?.rootViewController = navContr
//        window?.makeKeyAndVisible()
        

    }


}

