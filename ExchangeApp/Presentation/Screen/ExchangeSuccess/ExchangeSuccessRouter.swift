//
//  ExchangeSuccessRouter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

protocol ExchangeSuccessRouterInput: AnyObject {
    
    func popToRoot()
    
}

class ExchangeSuccessRouter: ExchangeSuccessRouterInput {
    
    weak var viewController: EAViewController?
    
    func popToRoot() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
}
