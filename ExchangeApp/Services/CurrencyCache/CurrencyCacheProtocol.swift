//
//  CurrencyCacheProtocol.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol CurrencyCacheProtocol {
    
    func insert(sourceCurrency: String, targetCurrency: String, conversionRate: Double)
    func value(sourceCurrency: String, targetCurrency: String) -> Double?
    
}
