//
//  RequestPath.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum RequestPath {
    case pair(source: String, target: String, amount: String)
    
    var rawValue: String {
        switch self {
        case .pair(let source, let target, let amount):
            return "/pair/\(source)/\(target)/\(amount)"
        }
    }
    
}
