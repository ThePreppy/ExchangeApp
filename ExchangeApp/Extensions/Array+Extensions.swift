//
//  Array+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension Array where Element: Equatable {
    
    func removingDuplicates() -> [Element] {
        var uniqueElements: [Element] = []
        
        for value in self {
            guard !uniqueElements.contains(value) else {
                continue
            }
            
            uniqueElements.append(value)
        }
        
        return uniqueElements
    }
    
}
