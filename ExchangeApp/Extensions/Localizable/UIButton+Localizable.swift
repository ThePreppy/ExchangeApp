//
//  UIButton+Localizable.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

extension UIButton {
    
    var titleKey: Localizable? {
        get {
            Localizable(rawValue: accessibilityLabel ?? "")
        }
        set {
            accessibilityLabel = newValue?.rawValue
            setTitle(newValue?.localize(), for: .normal)
        }
    }
    
}
