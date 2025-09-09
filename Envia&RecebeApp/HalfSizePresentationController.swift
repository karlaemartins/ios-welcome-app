//
//  HalfSizePresentationController.swift
//  Envia&RecebeApp
//
//  Created by Karla E. Martins Fernandes on 11/06/25.
//

import UIKit

// definicoes visuais da tela modal de escolha do avatar
class HalfSizePresentationController: UIPresentationController {

    private let height: CGFloat = 300
    private var dimmingView: UIView!

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }

    //cria a view de fundo escuro e detecta gestos de toques, chama dismisscontroller
    private func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        dimmingView.addGestureRecognizer(tapGesture)
    }

    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerBounds = containerView?.bounds else { return .zero }
        let y = containerBounds.height - height
        return CGRect(x: 0, y: y, width: containerBounds.width, height: height)
    }

    //anima a transicao quando a tela for aparecer, escurecendo o fundo
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }
        dimmingView.frame = containerView.bounds
        containerView.insertSubview(dimmingView, at: 0)

        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 1
            }, completion: nil)
        } else {
            dimmingView.alpha = 1
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0
            }, completion: nil)
        } else {
            dimmingView.alpha = 0
        }
    }

    //fecha a tela modal após o chamado de dimmingview
    @objc private func dismissController() {
        presentedViewController.dismiss(animated: true)
    }
}
