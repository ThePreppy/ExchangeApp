//
//  ExchangeInteractor.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangeInteractorInput: AnyObject {
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: Int,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    )
    
}

class ExchangeInteractor: ExchangeInteractorInput {
    
    let repository: ExchangeRepositoryProtocol
    
    init(repository: ExchangeRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: Int,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    ) {
        repository.fetchCurrencyRate(
            sourceCode: sourceCode,
            targetCode: targetCode,
            amount: amount,
            completion: completion
        )
    }
    
}
