//
//  SceneDelegate.swift
//  FlashChat
//
//  Created by Ildar Garifullin on 13/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let startViewController = WelcomeViewController()
        
        let navigationController = UINavigationController(rootViewController: startViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
