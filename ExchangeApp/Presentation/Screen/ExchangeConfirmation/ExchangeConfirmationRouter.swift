//
//  ExchangeConfirmationRouter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

protocol ExchangeConfirmationRouterInput: AnyObject {
    
    func showTimeExpiredAlert()
    
}

class ExchangeConfirmationRouter: ExchangeConfirmationRouterInput {
    
    weak var viewController: EAViewController?
    
    func showTimeExpiredAlert() {
        let alertViewController = AlertBuilder()
            .message(key: .exchange_confirmation_time_expired)
            .addAction(.ok(handler: { [weak self] in
                self?.viewController?.navigationController?.popViewController(animated: true)
            }))
            .build()
        
        viewController?.present(alertViewController, animated: true)
    }
    
}
