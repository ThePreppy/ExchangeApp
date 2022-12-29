//
//  UserDefined.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

enum UserDefined {
    
    static func value<T>(for key: Key) -> T? {
        guard let path = Bundle.main.path(
            forResource: Constants.File.Name.constants,
            ofType: Constants.File.plist
        ) else {
            return nil
        }
        
        let url = URL(fileURLWithPath: path)
        let dict = NSDictionary(contentsOf: url)
        
        return dict?[key.rawValue] as? T
    }
    
}

extension UserDefined {
    
    enum Key: String {
        case currencyApiKey = "CURRENCY_API_KEY"
    }
    
}
