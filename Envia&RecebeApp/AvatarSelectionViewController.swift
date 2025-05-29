//
//  AvatarSelectionViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 29/05/25.
//

import UIKit

protocol AvatarSelectionDelegate: AnyObject {
    func didSelectAvatar(named avatarName: String)
}

class AvatarSelectionViewController: UIViewController {

    weak var delegate: AvatarSelectionDelegate?

    private let avatars = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6"]

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

    private func setupTitle() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    private func setupAvatarButtons() {
        let rowsStack = UIStackView()
        rowsStack.axis = .vertical
        rowsStack.alignment = .center
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
            rowsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func avatarTapped(_ sender: UIButton) {
        let selectedAvatar = avatars[sender.tag]
        delegate?.didSelectAvatar(named: selectedAvatar)
        dismiss(animated: true)
    }
}
