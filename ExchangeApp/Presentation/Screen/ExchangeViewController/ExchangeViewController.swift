//
//  ExchangeViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class ExchangeViewController: EAViewController {
    
    @IBOutlet private weak var calculateButton: PrimaryButton!
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.titleKey = .exchange_navigation_title
        
        calculateButton.titleKey = .exchange_calculate
    }

}
