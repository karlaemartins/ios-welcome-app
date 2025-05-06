//
//  SecondViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    var userName: String = ""
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
        
        // Verificar se o nome foi passado
        let greetingText = "Olá \(userName), seja bem-vindo(a) ao App Envia & Recebe!"
        
        //permite adicionar estilo ao texto
        let attributedString = NSMutableAttributedString(string: greetingText)
        
        //define a cor do texto
        let fullRange = NSRange(location: 0, length: greetingText.count)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 96/255, green: 108/255, blue: 56/255, alpha: 1), range: fullRange)
        
        // Aplicar o texto formatado na label
        welcomeLabel.attributedText = attributedString
        
        // Adicionar a label à view
        view.addSubview(welcomeLabel)
        
        // Configurar constraints para a label
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Configurar o botão de voltar (chevron)
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.left") // Chevron de voltar
        backButton.tintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1) // Cor do botão de voltar (RGB: 212, 163, 115)
        
        // Ação do botão de voltar: voltar para a primeira tela
        backButton.target = self
        backButton.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem = backButton
        
        // Configurar a navegação
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1) // Cor do botão de voltar
    }
    
    @objc func backButtonTapped() {
        // Voltar para a primeira tela
        navigationController?.popViewController(animated: true)
    }
}
