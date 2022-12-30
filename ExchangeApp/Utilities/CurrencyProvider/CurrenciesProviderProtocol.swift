//
//  CurrenciesProviderProtocol.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

protocol CurrenciesProviderProtocol {
    
    func fetchCurrencies(completion: Closure)
    func getCurrencies() -> [CurrencyModel]
    
}
