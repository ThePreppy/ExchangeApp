//
//  Numeric+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension Numeric {
    
    func truncating(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = value
        formatter.maximumFractionDigits = value
        
        return formatter.string(for: self) ?? ""
    }
    
}
