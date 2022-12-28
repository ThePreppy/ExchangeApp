//
//  Localizable.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum Localizable: String {
    case exchange_navigation_title = "exchange.navigation.title"
    case exchange_calculate = "exchange.calculate"
    
    func localize() -> String {
        NSLocalizedString(rawValue, comment: "")
    }
    
}
