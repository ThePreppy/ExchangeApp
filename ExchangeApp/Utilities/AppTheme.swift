//
//  AppTheme.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

enum AppTheme {
    
    static var primary: UIColor {
        let _ = #colorLiteral(red: 0.9137254902, green: 0.1921568627, blue: 0.137254902, alpha: 1)
        return UIColor(named: "Primary")!
    }
    
    static var white: UIColor {
        let _ = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return UIColor(named: "White")!
    }
    
    static var black: UIColor {
        let _ = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return UIColor(named: "Black")!
    }
    
    static var grey: UIColor {
        let _ = #colorLiteral(red: 0.8470588235, green: 0.8470588235, blue: 0.8470588235, alpha: 1)
        return UIColor(named: "Grey")!
    }
    
    static var green: UIColor {
        let _ = #colorLiteral(red: 0, green: 0.7803921569, blue: 0, alpha: 1)
        return UIColor(named: "Green")!
    }
    
    static var systemWhite: UIColor {
        let _ = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let _ = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return UIColor(named: "SystemWhite")!
    }
    
    static var systemBlack: UIColor {
        let _ = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let _ = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return UIColor(named: "SystemBlack")!
    }
    
}
