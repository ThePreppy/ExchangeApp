//
//  ExchangeSuccessViewController.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

class ExchangeSuccessViewController: EAViewController {

    @IBOutlet private weak var exchangeSuccessView: ExchangeSuccessView!
    
    let presenter: ExchangeSuccessPresenterInput
    
    init(presenter: ExchangeSuccessPresenterInput) {
        self.presenter = presenter
        super.init()
    }
    
    override func setupComponents() {
        super.setupComponents()
        
        exchangeSuccessView.model = presenter.exchangeSuccessModel
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let doneButton = UIBarButtonItem(
            title: Localizable.common_done.localize(),
            style: .done,
            target: self,
            action: #selector(popToRoot)
        )
        doneButton.tintColor = AppTheme.white
        
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.hidesBackButton = true
        navigationItem.titleKey = .exchange_success_navigation_title
    }
    
    @objc
    private func popToRoot() {
        presenter.popToRoot()
    }

}
