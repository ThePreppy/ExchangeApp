//
//  Array+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

extension Array where Element: Equatable {
    
    func removingDuplicates() -> [Element] {
        var array: [Element] = []
        
        for value in self {
            guard !array.contains(value) else {
                continue
            }
            
            array.append(value)
        }
        
        return array
    }
    
}
