//
//  ExchangeRepository.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

class ExchangeRepository: ExchangeRepositoryProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: Int,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    ) {
        if let rate = Container.currencyCache.value(
            sourceCurrency: sourceCode,
            targetCurrency: targetCode
        ) {
            
            let result = Double(amount) * rate
            let model = CurrencyConversionModel(
                rate: rate,
                result: result
            )
            
            completion(.success(model))
            return
        }
        
        let endpoint = CurrencyRateEndpoint(
            source: sourceCode,
            target: targetCode,
            amount: String(amount)
        )
        networkService.loadModel(endpoint: endpoint) {
            
            switch $0 {
            case .success(let model):
                model.map {
                    Container.currencyCache.insert(
                        sourceCurrency: sourceCode,
                        targetCurrency: targetCode,
                        conversionRate: $0.rate
                    )
                }
                
                completion(.success(model))
                
            case .failure(let error):
                completion(.failure(error))
                
            }
            
        }
    }
    
}
