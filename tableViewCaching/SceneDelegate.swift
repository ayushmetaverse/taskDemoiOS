//
//  SceneDelegate.swift
//  tableViewCaching
//
//  Created by apple on 24/07/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}

//cool woking fine but i want it like instagram feed typle like multiple cell in one row and collum and i need evey data displayed in text from with img
