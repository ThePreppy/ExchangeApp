//
//  ExchangeConfirmationViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class ExchangeConfirmationViewController: EAViewController {

    //MARK: - Outlets
    @IBOutlet private weak var exchangeResultView: ExchangeResultView!
    @IBOutlet private weak var exchangeTimerView: ExchangeTimerView!
    @IBOutlet private weak var convertButton: PrimaryButton!
    
    //MARK: - Properties
    let presenter: ExchangeConfirmationPresenterInput
    
    //MARK: - Functions
    init(presenter: ExchangeConfirmationPresenterInput) {
        self.presenter = presenter
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        convertButton.titleKey = .exchange_confirmation_convert
        convertButton.didTap = { [weak self] in
            self?.presenter.convert()
        }
        
        exchangeTimerView.model = presenter.exchangeTimerModel
        exchangeTimerView.startAnimation()
        
        exchangeResultView.model = presenter.exchangeResultModel
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.titleKey = .exchange_confirmation_navigation_title
    }

}
