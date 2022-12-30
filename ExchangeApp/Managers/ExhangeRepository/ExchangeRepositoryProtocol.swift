//
//  ExchangeRepositoryProtocol.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangeRepositoryProtocol {
    
    func fetchCurrencyRate(
        sourceCode: String,
        targetCode: String,
        amount: Int,
        completion: @escaping (Result<CurrencyConversionModel?, Error>) -> Void
    )
    
}
