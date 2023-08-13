//
//  SceneDelegate.swift
//  News Browser
//
//  Created by Николай Циминтия on 02.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let articlesCoordinator = ArticlesCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.frame = windowScene.coordinateSpace.bounds
        
        window?.rootViewController = articlesCoordinator.navigationController
        articlesCoordinator.start()
        
        window?.makeKeyAndVisible()
    }


}

