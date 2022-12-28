//
//  AppDelegate+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

extension AppDelegate {
    
    func injectServices() {
        let navigationService = NavigationService()
        ServiceLocator.shared.add(service: navigationService)
    }
    
}
