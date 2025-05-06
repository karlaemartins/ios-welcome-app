//
//  AppDelegate.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
//opcionais mas validos para analisar comportamento do app
    
    func applicationWillResignActive(_ application: UIApplication) {
        //vai passar para o 2 plano - ex: recebe ligacao ou troca de app
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //entrou oficialmente em 2 plano - salva dados temporarios antes de fechar
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //voltando ao primeiro plano - atualiza a interface e/ou dados
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //voltou a ficar ativo - pode iniciar as tarefas que foram pausadas
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //app será encerrado - salvar o que for necessário
    }
}
