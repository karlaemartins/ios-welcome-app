//
//  FirstViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class FirstViewController: UIViewController {
    // fvc herda de uivc
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        label.font = UIFont.boldSystemFont(ofSize: 18) // Tamanho maior e negrito
        label.textAlignment = .left
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        return label
    }()
    // instruir o usuario a digitar - det. ui
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 0.5).cgColor
        textField.layer.cornerRadius = 5
        // cria o campo de texto pro usuario digitar o nome - det. ui
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    // add espaco de margem a esquerda
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // Aumentar o tamanho e colocar em negrito
        
        // Cores do título para estados normal e desabilitado
        button.setTitleColor(UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1), for: .normal)    // branco ativado
        button.setTitleColor(UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 0.5), for: .disabled)  // branco desativado
        
        // Background inicial para desativado
        button.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 185/255, alpha: 0.5)
        
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    // cria o botao pro usu. enviar o nome - det. ui
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        // Cor de fundo da view
    view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
    title = "Cadastro"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // elementos a serem apresentados
        view.addSubview(instructionLabel)
        view.addSubview(nameTextField)
        view.addSubview(sendButton)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            instructionLabel.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            instructionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),

            
            nameTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 200),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Ação do botão
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1),
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
    }

    
    @objc func sendButtonTapped() {
        guard let userName = nameTextField.text, !userName.isEmpty else {
            let alert = UIAlertController(title: "Erro", message: "Por favor, insira seu nome.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let secondViewController = SecondViewController()
        secondViewController.userName = userName
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func updateSendButtonState(for text: String) {
        if text.count >= 3 {
            sendButton.isEnabled = true
            sendButton.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
        } else {
            sendButton.isEnabled = false
            sendButton.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 0.5)
        }
    }
}

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
