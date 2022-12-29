//
//  CurrencyDataModel.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

struct CurrencyDataModel: Decodable {
    
    let currency: String
    let alphabeticCode: String?
    
    enum CodingKeys: String, CodingKey {
        case currency = "Currency"
        case alphabeticCode = "AlphabeticCode"
    }
    
}

extension CurrencyDataModel: Domainable {
    
    typealias Model = CurrencyModel
    
    func mapToModel() -> CurrencyModel {
        CurrencyModel(name: currency, code: alphabeticCode)
    }
    
}
