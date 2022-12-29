//
//  ExchangeError.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

enum ExchangeError: LocalizedError {
    case incorrectAmount
    
    var errorDescription: String? {
        switch self {
        case .incorrectAmount:
            return Localizable.exchange_incorrect_amount_error.localize()
        }
    }
    
}
