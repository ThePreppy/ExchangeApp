//
//  UIView+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    func round() {
        let value = min(frame.height, frame.width)
        
        cornerRadius = value / 2
    }
    
}
