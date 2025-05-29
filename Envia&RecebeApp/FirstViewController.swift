//
//  FirstViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 26/04/25.
//

import UIKit

class FirstViewController: UIViewController {

    private let realNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome:"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        return label
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o seu nome"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 0.5).cgColor
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
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        return label
    }()

    private let avatarButton1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Escolher Agora", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()

    private let avatarButton2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Escolher Depois", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 196/255, blue: 93/255, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor(red: 254/255, green: 250/255, blue: 224/255, alpha: 0.5), for: .disabled)
        button.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()

    // MARK: - Properties

    private var selectedAvatarName: String?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        view.backgroundColor = .white
        title = "Cadastro"
        navigationItem.backButtonTitle = ""

        view.addSubview(realNameLabel)
        view.addSubview(nameTextField)
        view.addSubview(avatarLabel)
        view.addSubview(avatarButton1)
        view.addSubview(avatarButton2)
        view.addSubview(sendButton)

        avatarButton1.addTarget(self, action: #selector(chooseAvatarNow), for: .touchUpInside)
        avatarButton2.addTarget(self, action: #selector(chooseAvatarLater), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)

        setupConstraints()
    }

    // MARK: - Constraints Setup

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            realNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            realNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            realNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),

            nameTextField.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: 25),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),

            avatarLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            avatarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            avatarLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),

            avatarButton1.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 15),
            avatarButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            avatarButton1.trailingAnchor.constraint(equalTo: avatarButton2.leadingAnchor, constant: -10),
            avatarButton1.heightAnchor.constraint(equalToConstant: 40),
            avatarButton1.widthAnchor.constraint(equalTo: avatarButton2.widthAnchor),

            avatarButton2.topAnchor.constraint(equalTo: avatarLabel.bottomAnchor, constant: 15),
            avatarButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            avatarButton2.heightAnchor.constraint(equalToConstant: 40),

            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 200),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Actions

    @objc private func chooseAvatarNow() {
        let avatarVC = AvatarSelectionViewController()
        avatarVC.delegate = self
        avatarVC.modalPresentationStyle = .custom
        avatarVC.transitioningDelegate = self
        present(avatarVC, animated: true)
    }

    @objc private func chooseAvatarLater() {
        selectedAvatarName = "avatar7"
        print("Avatar padrão definido: avatar7")
        updateSendButtonState(for: nameTextField.text ?? "")
    }

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

    private func updateSendButtonState(for text: String) {
        let isNameValid = text.count >= 3
        let isAvatarSelected = selectedAvatarName != nil

        if isNameValid && isAvatarSelected {
            sendButton.isEnabled = true
            sendButton.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
        } else {
            sendButton.isEnabled = false
            sendButton.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 0.5)
        }
    }
}

// MARK: - UITextFieldDelegate

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

// MARK: - AvatarSelectionDelegate

extension FirstViewController: AvatarSelectionDelegate {
    func didSelectAvatar(named avatarName: String) {
        selectedAvatarName = avatarName
        print("Avatar selecionado: \(avatarName)")
        updateSendButtonState(for: nameTextField.text ?? "")
    }
}

// MARK: - UIViewControllerTransitioningDelegate

extension FirstViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController)
    -> UIPresentationController? {
        return HalfSizePresentationController(presentedViewController: presented, presenting: presenting)
    }
}

// MARK: - HalfSizePresentationController

class HalfSizePresentationController: UIPresentationController {

    private let height: CGFloat = 300
    private var dimmingView: UIView!

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }

    private func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        dimmingView.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        dimmingView.addGestureRecognizer(tapGesture)
    }

    @objc private func dimmingViewTapped() {
        presentedViewController.dismiss(animated: true)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerBounds = containerView?.bounds else { return CGRect.zero }
        return CGRect(x: 0,
                      y: containerBounds.height - height,
                      width: containerBounds.width,
                      height: height)
    }

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        dimmingView.frame = containerView.bounds
        containerView.insertSubview(dimmingView, at: 0)

        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            })
        } else {
            dimmingView.alpha = 1
        }

        presentedView?.layer.cornerRadius = 16
        presentedView?.clipsToBounds = true
    }

    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            })
        } else {
            dimmingView.alpha = 0
        }
    }

    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        dimmingView.frame = containerView?.bounds ?? .zero
    }
}
