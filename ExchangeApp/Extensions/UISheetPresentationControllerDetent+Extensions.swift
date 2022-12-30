//
//  UISheetPresentationControllerDetent+Extensions.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

extension UISheetPresentationController.Detent {
 
    static func constant(height: CGFloat) -> UISheetPresentationController.Detent {
        .custom { _ in return height }
    }
    
}
