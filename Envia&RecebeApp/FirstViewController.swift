//
//  FirstViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class FirstViewController: UIViewController {
//fvc herda de uivc
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Por favor, digite seu nome:"
        label.font = UIFont.boldSystemFont(ofSize: 24) // Tamanho maior e negrito
        label.textAlignment = .center
        label.textColor = UIColor(red: 96/255, green: 108/255, blue: 56/255, alpha: 1) // RGB: 96, 108, 56
        return label
    }()
    //instruir o usuario a digitar - det. ui
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 250/255, green: 237/255, blue: 205/255, alpha: 1).cgColor
        textField.layer.cornerRadius = 5
    //cria o campo de texto pro usuario digitar o nome - det. ui
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    //add espaco de margem a esquerda
    
    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.backgroundColor = UIColor(red: 212/255, green: 163/255, blue: 115/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        // Aumentar o tamanho e colocar em negrito
        button.isEnabled = false
        return button
    }()
    // cria o botao pro usu. enviar o nome - det. ui
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        
        view.backgroundColor = UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1)
        
        // elementos a serem apresentados
        view.addSubview(instructionLabel)
        view.addSubview(nameTextField)
        view.addSubview(sendButton)
        
        // Configurar constraints
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            sendButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 200),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Ação do botão
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped() {
        // Verificar se o campo de texto foi preenchido com algo, se nao erro.
        guard let userName = nameTextField.text, !userName.isEmpty else {
            let alert = UIAlertController(title: "Erro", message: "Por favor, insira seu nome.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        // Criar o SecondViewController e passar o nome
        let secondViewController = SecondViewController()
        secondViewController.userName = userName
        
        // Navegar para a segunda tela
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if let currentText = textField.text as NSString? {
            let updatedText = currentText.replacingCharacters(in: range, with: string)
            if updatedText.count > 3 {
                sendButton.isEnabled = true
            }
        }
        
        return true
    }
    
}
