//
//  SceneDelegate.swift
//  SendData
//
//  Created by Taras Kolesnyk on 09.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let firstVC = FirstViewController()
        let navigateionVC = UINavigationController(rootViewController: firstVC)
        window.rootViewController = navigateionVC // Your initial view controller.
        window.makeKeyAndVisible()
        self.window = window
        
    }


}

