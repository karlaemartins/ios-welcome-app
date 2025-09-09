//
//  FirstViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class FirstViewController: UIViewController {

    struct Constants {
        static let textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        
        static let yellowColorBorder = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 0.5).cgColor
        
        static let yellowColor = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 1)
        
        static let orangeColorDisable = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 0.5)
        
        static let orangeColorEnable = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
    }
    
    // Define dados da tela, labels, campos de texto, botões..
    private let realNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = Constants.textColor
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o seu nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Constants.yellowColorBorder
        textField.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()

    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gostaria de escolher um avatar?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = Constants.textColor
        return label
    }()

    private let avatarButton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Escolher Agora", for: .normal)
        button.backgroundColor = Constants.yellowColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()

    private let avatarButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Escolher Depois", for: .normal)
        button.backgroundColor = Constants.yellowColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.white, for: .disabled)
        button.backgroundColor = Constants.orangeColorDisable
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()

    // Guarda nome da imagem do avatar escolhido
    private var selectedAvatarName: String?

    // Constraint para o top do realNameLabel (para ajustar dinamicamente)
    private var realNameLabelTopConstraint: NSLayoutConstraint!

    //inicializador seria aqui se precisasse
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self //se torna o delegate do campo de texto
        view.backgroundColor = .white
        title = "Cadastro"
        navigationItem.backButtonTitle = ""
        setupHierarch()
        setupConfig()
        setupConstraints()
    }
    
    // verifica se a tela esta em modo paisagem ou retrato e ajusta as constraints no momento em que a tela vai aparecer
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let isPortrait = UIScreen.main.bounds.height > UIScreen.main.bounds.width
        realNameLabelTopConstraint.constant = isPortrait ? 80 : 20
        view.layoutIfNeeded()
    }
    
    //muda o layout ao girar o aparelho
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { _ in
            let isPortrait = size.height > size.width
            self.realNameLabelTopConstraint.constant = isPortrait ? 80 : 20
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()

        }, completion: nil)
    }

    private func setupHierarch() {
        let views = [realNameLabel, nameTextField, avatarLabel, avatarButton1, avatarButton2, sendButton]
        views.forEach {view.addSubview($0)}
    }
    
    private func setupConfig() {
        avatarButton1.addTarget(self, action: #selector(chooseAvatarNow), for: .touchUpInside)
        avatarButton2.addTarget(self, action: #selector(chooseAvatarLater), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        realNameLabelTopConstraint = realNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)

        NSLayoutConstraint.activate([
            realNameLabelTopConstraint,
            realNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            realNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            nameTextField.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),

            avatarLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            avatarLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),

            avatarButton1.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 15),
            avatarButton1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarButton1.trailingAnchor.constraint(equalTo: avatarButton2.leadingAnchor, constant: -10),
            avatarButton1.heightAnchor.constraint(equalToConstant: 40),
            avatarButton1.widthAnchor.constraint(equalTo: avatarButton2.widthAnchor),

            avatarButton2.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 15),
            avatarButton2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            avatarButton2.heightAnchor.constraint(equalToConstant: 40),

            // Ajusta o botão enviar respeitando safeArea, para evitar ficar por baixo do "notch" na horizontal
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 200),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    //acao para escolher avatar agr
    @objc private func chooseAvatarNow() {
        let avatarVC = AvatarSelectionViewController()
        avatarVC.delegate = self
        avatarVC.modalPresentationStyle = .custom
        avatarVC.transitioningDelegate = self
        present(avatarVC, animated: true)
    }
    
    //escolher avatar depois
    @objc private func chooseAvatarLater() {
        selectedAvatarName = "avatar7"
        print("Avatar padrão definido: avatar7")
        updateSendButtonState(for: nameTextField.text ?? "")
    }

    //criar conta
    @objc private func sendButtonTapped() {
        guard let userName = nameTextField.text, !userName.isEmpty else {
            let alert = UIAlertController(title: "Erro", message: "Por favor, insira seu nome.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }

        let secondVC = SecondViewController()
        secondVC.userName = userName
        secondVC.userAvatarName = selectedAvatarName
        navigationController?.pushViewController(secondVC, animated: true)
    }

    //validacoes para o botao de criar conta
    private func updateSendButtonState(for text: String) {
        let isNameValid = text.count >= 3
        let isAvatarSelected = selectedAvatarName != nil

        if isNameValid && isAvatarSelected {
            sendButton.isEnabled = true
            sendButton.backgroundColor = Constants.orangeColorEnable
        } else {
            sendButton.isEnabled = false
            sendButton.backgroundColor = Constants.orangeColorDisable
        }
    }
}

//acompanha campo de texto e atualiza botao
extension FirstViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if let currentText = textField.text as NSString? {
            let updatedText = currentText.replacingCharacters(in: range, with: string)
            updateSendButtonState(for: updatedText)
        }
        return true
    }
}

//AvatarSelection vai chamar esse metodo quando o usuario escolher o avatar
extension FirstViewController: AvatarSelectionDelegate {
    func didSelectAvatar(named avatarName: String) {
        selectedAvatarName = avatarName
        print("Avatar selecionado: \(avatarName)")
        updateSendButtonState(for: nameTextField.text ?? "")
    }
}

//definicoes customizadas - tela modal de escolha do avatar
extension FirstViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController)
    -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}

