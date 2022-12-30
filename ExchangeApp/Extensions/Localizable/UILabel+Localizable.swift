//
//  UILabel+Localizable.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

extension UILabel {
    
    var textKey: Localizable? {
        get {
            Localizable(rawValue: accessibilityLabel ?? "")
        }
        set {
            accessibilityLabel = newValue?.rawValue
            text = newValue?.localize()
        }
    }
    
}
