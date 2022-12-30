//
//  UIStackView+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

extension UIStackView {
    
    static func vertical(
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let result = UIStackView(arrangedSubviews: arrangedSubviews)
        result.axis = .vertical
        result.spacing = spacing
        result.alignment = alignment
        result.distribution = distribution
        
        return result
    }
    
    static func horizontal(
        spacing: CGFloat = 0,
        alignment: Alignment = .fill,
        distribution: Distribution = .fill,
        arrangedSubviews: [UIView] = []
    ) -> UIStackView {
        let result = UIStackView(arrangedSubviews: arrangedSubviews)
        result.axis = .horizontal
        result.spacing = spacing
        result.alignment = alignment
        result.distribution = distribution
        
        return result
    }
    
}
