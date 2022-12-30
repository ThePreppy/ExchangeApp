//
//  PrimaryButton.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

@IBDesignable
class PrimaryButton: EAButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        round()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        clipsToBounds = true
        backgroundColor = AppTheme.primary
        setTitleColor(AppTheme.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
}
