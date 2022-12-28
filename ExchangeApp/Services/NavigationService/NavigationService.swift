//
//  NavigationService.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class NavigationService: NavigationServiceProtocol {
    
    private var window: UIWindow?
    
    func start() {
        showSplashScreen()
        
        Container.currenciesProvider.fetchCurrencies { [weak self] in
            self?.showMain()
        }
    }
    
    func setup(with windowScene: UIWindowScene) -> UIWindow? {
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        return window
    }
    
    func showMain() {
        let viewController = ExchangeViewController()
        let navigationController = EANavigationController(rootViewController: viewController)
        NavigationControllerDecorator.decorate(navigationController)
        
        setRoot(viewController: navigationController)
    }
    
    private func showSplashScreen() {
        let viewController = SplashViewController()
        setRoot(viewController: viewController)
    }
    
    private func setRoot(viewController: UIViewController) {
        window?.rootViewController = viewController
        animateWindow()
    }
    
    private func animateWindow() {
        guard let window = window else { return }
        
        UIView.transition(
            with: window,
            duration: .default,
            options: .transitionCrossDissolve,
            animations: nil
        )
    }
    
}
