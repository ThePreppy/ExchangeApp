//
//  Container.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum Container {
    
    static var navigationService: NavigationServiceProtocol {
        guard let navigationService: NavigationService = ServiceLocator.shared.getService() else {
            fatalError("NavigationService should be implement using ServiceLocator")
        }
        
        return navigationService
    }
    
    static var currenciesProvider: CurrenciesProviderProtocol {
        guard let provider: CurrenciesProvider = ServiceLocator.shared.getService() else {
            fatalError("CurrenciesProvider should be implement using ServiceLocator")
        }
        
        return provider
    }
    
    static var currencyCache: CurrencyCacheProtocol {
        guard let provider: CurrencyCache = ServiceLocator.shared.getService() else {
            fatalError("CurrencyCache should be implement using ServiceLocator")
        }
        
        return provider
    }
    
}
