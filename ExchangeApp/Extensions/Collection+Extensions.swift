//
//  Collection+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
