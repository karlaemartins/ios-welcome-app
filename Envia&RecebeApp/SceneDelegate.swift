//
//  SceneDelegate.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //inicia primeira tela do app
        guard let windowScene = scene as? UIWindowScene else { return }

        window = UIWindow(windowScene: windowScene)

        let navigationController = UINavigationController(rootViewController: FirstViewController())
        //inicia o app com a tela FirstViewController mas dentro de um UINav. que permite usar o botao de voltar e navegagar entre as telas.
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Para quando a cena for desconectada
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Para quando a cena se tornar ativa
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Para quando a cena for desativada
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Para quando a cena entrar em primeiro plano
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Para quando a cena for para segundo plano
    }
}
