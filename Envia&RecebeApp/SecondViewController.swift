//
//  SecondViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class SecondViewController: UIViewController {

    var userName: String = ""
    var userAvatarName: String?

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

    private let messageCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        label.numberOfLines = 0
        label.text = "Adicione novos amigos e fique por dentro dos seus envios e recebimentos!"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

        // Título da navigation bar
        title = "Feed"

        // Remove texto do botão voltar na navigation bar (deixa só a seta)
        navigationItem.backButtonTitle = ""

        setupNavigationBar()
        setupViews()
        configureUserData()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        // Não altera tintColor aqui para respeitar configuração global do SceneDelegate

        // Botão Logout
        let logoutButton = UIBarButtonItem(title: "Sair",
                                           style: .plain,
                                           target: self,
                                           action: #selector(logoutTapped))
        logoutButton.tintColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
        navigationItem.rightBarButtonItem = logoutButton
    }

    private func setupViews() {
        view.addSubview(avatarImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(messageCountLabel)

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),

            welcomeLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            messageCountLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            messageCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func configureUserData() {
        // Configura avatar
        if let avatarName = userAvatarName, let avatarImage = UIImage(named: avatarName) {
            avatarImageView.image = avatarImage
        } else {
            avatarImageView.image = UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        }

        // Texto de boas-vindas com cor customizada
        let greetingText = "Olá \(userName)"
        let attributedString = NSMutableAttributedString(string: greetingText)
        let fullRange = NSRange(location: 0, length: greetingText.count)
        attributedString.addAttribute(.foregroundColor,
                                      value: UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1),
                                      range: fullRange)
        welcomeLabel.attributedText = attributedString
    }

    @objc private func logoutTapped() {
        // Voltar para a primeira tela limpando os dados
        navigationController?.popToRootViewController(animated: true)
    }
}
