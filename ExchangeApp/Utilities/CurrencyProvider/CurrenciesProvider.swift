//
//  CurrenciesProvider.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

class CurrenciesProvider: CurrenciesProviderProtocol {
    
    private var currencies: [CurrencyModel] = []
    
    private var url: URL? {
        Bundle.main.url(
            forResource: Constants.File.Name.currencies,
            withExtension: Constants.File.json
        )
    }
    
    func fetchCurrencies(completion: Closure) {
        guard let url else {
            Logger.error("Currencies.json should be implemented")
            return
        }
        
        do {
            let data = try Data.init(contentsOf: url)
            let models = try JSONDecoder().decode([CurrencyDataModel].self, from: data)
            
            currencies = models.mapToModels()
            completion()
            
        } catch {
            Logger.error(error)
        }
    }
    
    func getCurrencies() -> [CurrencyModel] {
        currencies.filter { $0.code != nil }
    }
    
}
