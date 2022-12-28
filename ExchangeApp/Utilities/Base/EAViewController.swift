//
//  EAViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

class EAViewController: XIBViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
    }
    
    func setupComponents() {
        view.backgroundColor = AppTheme.systemWhite
    }
    
}
