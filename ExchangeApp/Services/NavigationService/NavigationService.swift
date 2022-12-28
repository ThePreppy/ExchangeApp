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
        
    }
    
    func setup(with windowScene: UIWindowScene) -> UIWindow? {
        window = UIWindow(windowScene: windowScene)
        
        return window
    }
    
}
