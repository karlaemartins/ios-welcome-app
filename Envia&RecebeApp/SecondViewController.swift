//
//  SecondViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    var userName: String = ""
    var userAvatarName: String?  // <- nova propriedade para o avatar

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1).cgColor
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
        
        // Texto de boas-vindas
        let greetingText = "Olá \(userName), seja bem-vindo(a) ao App Envia & Recebe!"
        let attributedString = NSMutableAttributedString(string: greetingText)
        let fullRange = NSRange(location: 0, length: greetingText.count)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 96/255, green: 108/255, blue: 56/255, alpha: 1), range: fullRange)
        welcomeLabel.attributedText = attributedString
        
        // Configura avatar
        if let avatarName = userAvatarName, let avatarImage = UIImage(named: avatarName) {
            avatarImageView.image = avatarImage
        } else {
            avatarImageView.image = nil
        }
        
        // Adiciona subviews
        view.addSubview(welcomeLabel)
        view.addSubview(avatarImageView)
        
        // Constraints
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            welcomeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Botão voltar (chevron)
        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.left")
        backButton.tintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
        backButton.target = self
        backButton.action = #selector(backButtonTapped)
        navigationItem.leftBarButtonItem = backButton
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
