//
//  CurrencyRateEndpoint.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

struct CurrencyRateEndpoint: Endpoint {
    typealias Response = CurrencyConversionResponse
    
    let source: String
    let target: String
    let amount: String
    
    var path: RequestPath {
        .pair(source: source, target: target, amount: amount)
    }
    
}
