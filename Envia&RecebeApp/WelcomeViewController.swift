//
//  WelcomeViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 29/05/25.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(red: 39/255, green: 105/255, blue: 166/255, alpha: 1)
        label.textAlignment = .center
        
        let texto = """
        Bem-vindo ao Envia&RecebeApp!

        Aqui, você pode enviar mensagens para seus amigos, de forma anônima ou aberta.
        Vamos começar a conversar?
        """
        
        let attributedText = NSMutableAttributedString(string: texto)
        let fonteNormal = UIFont.systemFont(ofSize: 18)
        let fonteNegrito = UIFont.boldSystemFont(ofSize: 20)
        
        attributedText.addAttribute(.font, value: fonteNormal, range: NSRange(location: 0, length: texto.count))
        
        if let primeiroQuebra = texto.firstIndex(of: "\n") {
            let distancia = texto.distance(from: texto.startIndex, to: primeiroQuebra)
            attributedText.addAttribute(.font, value: fonteNegrito, range: NSRange(location: 0, length: distancia))
        } else {
            attributedText.addAttribute(.font, value: fonteNegrito, range: NSRange(location: 0, length: texto.count))
        }
        
        label.attributedText = attributedText
        return label
    }()
    
    private let gifImageView: SDAnimatedImageView = {
        let imageView = SDAnimatedImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(gifImageView)
        view.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            gifImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            gifImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gifImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gifImageView.heightAnchor.constraint(equalTo: gifImageView.widthAnchor, multiplier: 0.75),
            
            continueButton.topAnchor.constraint(greaterThanOrEqualTo: gifImageView.bottomAnchor, constant: 30),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 220),
            continueButton.heightAnchor.constraint(equalToConstant: 55),
            continueButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
        
        if let path = Bundle.main.path(forResource: "gif_01", ofType: "gif"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let animatedImage = SDAnimatedImage(data: data)
            gifImageView.image = animatedImage
        }
        
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        
        navigationItem.backButtonTitle = ""
    }
    
    @objc private func continueTapped() {
        let firstVC = FirstViewController()
        navigationController?.pushViewController(firstVC, animated: true)
    }
}
