//
//  ExchangeSuccessModuleBuilder.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

struct ExchangeSuccessParameters {
    let targetCurrency: String
    let conversionRate: Double
    let conversionResult: Double
}

enum ExchangeSuccessModuleBuilder {
    
    static func build(with parameters: ExchangeSuccessParameters) -> UIViewController {
        let router = ExchangeSuccessRouter()
        let interactor = ExchangeSuccessInteractor()
        
        let presenter = ExchangeSuccessPresenter(
            parameters: parameters,
            router: router,
            interactor: interactor
        )
        
        let viewController = ExchangeSuccessViewController(presenter: presenter)
        
        router.viewController = viewController
        
        return viewController
    }
    
}
