//
//  ExchangeViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import UIKit

class ExchangeViewController: EAViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var exchangeView: ExchangeView!
    @IBOutlet private weak var amountInputView: AmountInputView!
    @IBOutlet private weak var calculateButton: PrimaryButton!
    
    //MARK: - Properties
    let presenter: ExchangePresenterInput
    
    //MARK: - Functions
    init(presenter: ExchangePresenterInput) {
        self.presenter = presenter
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        setupUI()
    }
    
    //MARK: - Private Functions
    private func setupUI() {
        navigationItem.titleKey = .exchange_navigation_title
        exchangeView.model = presenter.exhangeViewModel
        
        calculateButton.titleKey = .exchange_calculate
        calculateButton.didTap = { [weak self] in
            let text = self?.amountInputView.text
            self?.presenter.proceedConvertion(with: text)
        }
    }
    
}
