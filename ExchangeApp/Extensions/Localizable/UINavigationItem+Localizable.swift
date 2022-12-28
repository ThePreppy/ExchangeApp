//
//  UINavigationItem+Localizable.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

extension UINavigationItem {
    
    var titleKey: Localizable? {
        get {
            Localizable(rawValue: accessibilityLabel ?? "")
        }
        set {
            accessibilityLabel = newValue?.rawValue
            title = newValue?.localize()
        }
    }
    
}
