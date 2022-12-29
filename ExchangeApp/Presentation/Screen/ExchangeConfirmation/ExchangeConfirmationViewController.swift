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
    @IBOutlet private weak var convertButton: UIButton!
    
    //MARK: - Properties
    let presenter: ExchangeConfirmationPresenterInput
    
    //MARK: - Functions
    init(presenter: ExchangeConfirmationPresenterInput) {
        self.presenter = presenter
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        navigationItem.titleKey = .exchange_confirmation_navigation_title
        convertButton.titleKey = .exchange_confirmation_convert
        exchangeResultView.model = presenter.exchangeResultModel
        exchangeTimerView.model = presenter.exchangeTimerModel
        exchangeTimerView.startAnimation()
    }

}
