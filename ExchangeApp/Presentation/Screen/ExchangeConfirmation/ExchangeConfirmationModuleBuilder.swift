//
//  ExchangeConfirmationModuleBuilder.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

struct ExchangeConfirmationParameters {
    let amount: Int
    let sourceCurrency: CurrencyModel
    let targetCurrency: CurrencyModel
    let conversionRate: Double
    let conversionResult: Double
}

enum ExchangeConfirmationModuleBuilder {
    
    static func build(with parameters: ExchangeConfirmationParameters) -> UIViewController {
        let router = ExchangeConfirmationRouter()
        let interactor = ExchangeConfirmationInteractor()
        
        let presenter = ExchangeConfirmationPresenter(
            parameters: parameters,
            router: router,
            interactor: interactor
        )
        
        let viewController = ExchangeConfirmationViewController(presenter: presenter)
        
        router.viewController = viewController
        
        return viewController
    }
    
}
