//
//  AvatarSelectionViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 29/05/25.
//

import UIKit

// definição do protocolo
protocol AvatarSelectionDelegate: AnyObject {
    // func para receber o nome do avatar selecionado
    func didSelectAvatar(named avatarName: String)
}

class AvatarSelectionViewController: UIViewController {
    
    // var que referencia quem vai receber o avatar selecionado
    weak var delegate: AvatarSelectionDelegate?

    // array com o nome dos avatars
    private let avatars = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6"]

    // título da tela
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Escolha o seu avatar"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true

        setupTitle()
        setupAvatarButtons()
    }

    // definicoes do título
    private func setupTitle() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    // definicoes para os botoes de avatar
    private func setupAvatarButtons() {
        let rowsStack = UIStackView()
        rowsStack.axis = .vertical
        rowsStack.alignment = .fill
        rowsStack.spacing = 15
        rowsStack.translatesAutoresizingMaskIntoConstraints = false

        for i in 0..<2 {
            let rowStack = UIStackView()
            rowStack.axis = .horizontal
            rowStack.alignment = .center
            rowStack.distribution = .equalSpacing
            rowStack.spacing = 20
            rowStack.translatesAutoresizingMaskIntoConstraints = false

            for j in 0..<3 {
                let index = i * 3 + j
                if index < avatars.count {
                    let button = UIButton(type: .custom)
                    button.setImage(UIImage(named: avatars[index]), for: .normal)
                    button.imageView?.contentMode = .scaleAspectFit
                    button.tag = index
                    button.translatesAutoresizingMaskIntoConstraints = false
                    button.widthAnchor.constraint(equalToConstant: 80).isActive = true
                    button.heightAnchor.constraint(equalToConstant: 80).isActive = true
                    button.layer.cornerRadius = 40
                    button.layer.borderColor = UIColor.lightGray.cgColor
                    button.layer.borderWidth = 1
                    button.clipsToBounds = true
                    button.addTarget(self, action: #selector(avatarTapped(_:)), for: .touchUpInside)
                    rowStack.addArrangedSubview(button)
                }
            }
            rowsStack.addArrangedSubview(rowStack)
        }

        view.addSubview(rowsStack)

        NSLayoutConstraint.activate([
            rowsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            rowsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            rowsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rowsStack.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }

    // metodo para quando o usu escolhe o avatar
    @objc private func avatarTapped(_ sender: UIButton) {
        let selectedAvatar = avatars[sender.tag]
        delegate?.didSelectAvatar(named: selectedAvatar)
        dismiss(animated: true)
    }
}
