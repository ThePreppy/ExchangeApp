//
//  AppDelegate+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

extension AppDelegate {
    
    func configureContainer() {
        let navigationService = NavigationService()
        ServiceLocator.shared.add(service: navigationService)
        
        let currenciesProvider = CurrenciesProvider()
        ServiceLocator.shared.add(service: currenciesProvider)
    }
    
}
