//
//  EATextField.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class EATextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
