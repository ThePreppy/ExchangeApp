//
//  CurrencyModel.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

struct CurrencyModel {
    let name: String
    let code: String?
}

extension CurrencyModel {
    
    static var usd: CurrencyModel {
        CurrencyModel(name: "US Dollar", code: "USD")
    }
    
    static var eur: CurrencyModel {
        CurrencyModel(name: "Euro", code: "EUR")
    }
    
}

extension CurrencyModel: Selectable {
    
    var title: String {
        "\(name) - \(code ?? "")"
    }
    
}

extension CurrencyModel: Equatable {
    
}
