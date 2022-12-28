//
//  NavigationControllerDecorator.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

struct NavigationControllerDecorator {
    
    static func decorate(_ navigationController: UINavigationController) {
        let navigationBar = navigationController.navigationBar
        let appearance = navigationBar.standardAppearance
        let titleColor: UIColor = .white
        
        appearance.backgroundColor = AppTheme.primary
        appearance.largeTitleTextAttributes = [.foregroundColor : titleColor]
        appearance.titleTextAttributes = [.foregroundColor : titleColor]
        
        navigationBar.prefersLargeTitles = true
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
    
}
