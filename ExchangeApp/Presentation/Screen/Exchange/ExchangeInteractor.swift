//
//  ExchangeInteractor.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangeInteractorInput {
    
    init(networkService: NetworkServiceProtocol)
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: String,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    )
    
}

class ExchangeInteractor: ExchangeInteractorInput {
    
    let networkService: NetworkServiceProtocol
    
    required init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: String,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    ) {
        
        let endpoint = CurrencyRateEndpoint(
            source: sourceCode,
            target: targetCode,
            amount: amount
        )
        networkService.loadModel(endpoint: endpoint, completion: completion)
        
    }
    
}
