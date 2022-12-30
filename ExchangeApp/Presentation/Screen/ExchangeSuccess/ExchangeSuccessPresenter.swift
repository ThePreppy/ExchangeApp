//
//  ExchangeSuccessPresenter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangeSuccessPresenterInput: AnyObject {
    
    var exchangeSuccessModel: ExchangeSuccessView.Model { get }
    
    func popToRoot()
    
}

class ExchangeSuccessPresenter: ExchangeSuccessPresenterInput {
    
    //MARK: - Properties
    private var parameters: ExchangeSuccessParameters
    private(set) var exchangeSuccessModel: ExchangeSuccessView.Model
    
    private let router: ExchangeSuccessRouterInput
    private let interactor: ExchangeSuccessInteractorInput
    
    //MARK: - Functions
    init(
        parameters: ExchangeSuccessParameters,
        router: ExchangeSuccessRouterInput,
        interactor: ExchangeSuccessInteractorInput
    ) {
        self.router = router
        self.interactor = interactor
        self.parameters = parameters
        self.exchangeSuccessModel = ExchangeSuccessView.Model(
            title: Localizable.exchange_success_title_message.localized(arguments: "\(parameters.conversionResult.truncating(2)) \(parameters.targetCurrency)"),
            subtitle: Localizable.exchange_success_subtitle_message.localized(arguments: parameters.conversionRate.truncating(2))
        )
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
}
