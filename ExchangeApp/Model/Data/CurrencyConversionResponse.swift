//
//  CurrencyConversionResponse.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct CurrencyConversionResponse: ResponseDomainable {
    typealias Model = CurrencyConversionModel
    
    let conversionRate: Double
    let conversionResult: Double
    
    enum CodingKeys: String, CodingKey {
        case conversionRate = "conversion_rate"
        case conversionResult = "conversion_result"
    }
    
    func mapToModel() -> CurrencyConversionModel {
        CurrencyConversionModel(rate: conversionRate, result: conversionResult)
    }
    
}
