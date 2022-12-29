//
//  ExchangeModuleBuilder.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

enum ExchangeModuleBuilder {
    
    static func build() -> UIViewController {
        let networkService = NetworkService()
        let router = ExchangeRouter()
        let interactor = ExchangeInteractor(networkService: networkService)
        
        let presenter = ExchangePresenter(
            router: router,
            interactor: interactor,
            currenciesProvider: Container.currenciesProvider
        )
        
        let viewController = ExchangeViewController(presenter: presenter)
        
        router.viewController = viewController
        presenter.loader = viewController
        
        return viewController
    }
    
}
