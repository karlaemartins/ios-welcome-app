//
//  SceneDelegate.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
//verifica se o tipo de cena criado é UIWindowScene se nao, saí
    func scene(_ scene: UIScene,willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene
        else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        
//Cria uma pilha e define WVC como base dessa pilha.
        let navigationController = UINavigationController(rootViewController: WelcomeViewController())
        
// Configuração base da Navigation Bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1),
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
// Cor do botão voltar (título)
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        ]
        
//aplica o estilo definido em todos os tipos de tela
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        
// Cor dos botões da navigation bar (ícones, inclusive o "<")
        navigationController.navigationBar.tintColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
