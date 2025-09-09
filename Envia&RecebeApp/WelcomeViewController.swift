//
//  WelcomeViewController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 29/05/25.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {
    
    //label inicial e todos as suas configuracoes
    private let welcomeLabel: UILabel = {
        let label = UILabel()
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
        }
        
        label.attributedText = attributedText
        return label
    }()
    
    //exibe gif
    private let gifImageView: SDAnimatedImageView = {
        let imageView = SDAnimatedImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //botao
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 247/255, green: 105/255, blue: 85/255, alpha: 1)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return button
    }()
    
    //espaçador invisivel
    private let spacerView = UIView()
    
    //organizaçao vertical
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 20
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    //container geral 'moldura'
    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //permite usar auto layout
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        
        //hierarquia de views
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(gifImageView)
        stackView.addArrangedSubview(spacerView)
        stackView.addArrangedSubview(continueButton)
        
        let guide = view.safeAreaLayoutGuide
        
        //constraints
        NSLayoutConstraint.activate([
            // container preenchendo safe area com margens laterais
            containerView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            
            // stackView fixada nas bordas do container
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // limita a altura do gif para ate 35% da altura da tela
            gifImageView.heightAnchor.constraint(lessThanOrEqualTo: containerView.heightAnchor, multiplier: 0.35),
            
            // Espaçador para evitar que elementos grudem
            spacerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
        
        //açao do botao
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        loadGif()
    }
    
    //carrega e exibe o gif
    private func loadGif() {
        if let path = Bundle.main.path(forResource: "gif_01", ofType: "gif"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            gifImageView.image = SDAnimatedImage(data: data)
        }
    }
    
    //remove e restaura a NB
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc private func continueTapped() {
      
        let backItem = UIBarButtonItem()
        backItem.title = "" // remove o nome voltar ao lado do chevron
        navigationItem.backBarButtonItem = backItem
        
        //navega para a prox tela
        let firstVC = FirstViewController()
        navigationController?.pushViewController(firstVC, animated: true)
    }
}
