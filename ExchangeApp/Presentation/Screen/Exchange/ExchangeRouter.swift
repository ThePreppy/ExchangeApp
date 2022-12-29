//
//  ExchangeRouter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import UIKit

protocol ExchangeRouterInput: AnyObject, ErrorRepresentable {
    
    func pushExchangeConfirmation(parameters: ExchangeConfirmationParameters)
    func presentPicker<T: Selectable>(items: [T], didSelect: @escaping DataClosure<T>)
    
}

class ExchangeRouter: ExchangeRouterInput {
    
    weak var viewController: EAViewController?
 
    func pushExchangeConfirmation(parameters: ExchangeConfirmationParameters) {
        let exchangeViewController = ExchangeConfirmationModuleBuilder.build(with: parameters)
        
        viewController?
            .navigationController?
            .pushViewController(exchangeViewController, animated: true)
    }
    
    func presentPicker<T: Selectable>(
        items: [T],
        didSelect: @escaping DataClosure<T>
    ) {
        let selectionViewController = SelectionViewController(items: items, didSelect: didSelect)
        
        let sheetController = selectionViewController.sheetPresentationController
        sheetController?.detents = [.constant(height: 260)]
        sheetController?.preferredCornerRadius = 16
        sheetController?.prefersGrabberVisible = true
        
        viewController?.present(selectionViewController, animated: true)
    }
    
    func handle(error: Error?) {
        viewController?.handle(error: error)
    }
    
}
