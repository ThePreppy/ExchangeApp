//
//  ExchangeConfirmationPresenter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangeConfirmationPresenterInput: AnyObject {
    
    var exchangeResultModel: ExchangeResultView.Model { get }
    var exchangeTimerModel: ExchangeTimerView.Model { get }
    
    func convert()
    
}

class ExchangeConfirmationPresenter: ExchangeConfirmationPresenterInput {
    
    //MARK: - Properties
    private var parameters: ExchangeConfirmationParameters
    private var secondsLeft = Int(Constants.animationDuration)
    private(set) var exchangeResultModel: ExchangeResultView.Model
    private(set) var exchangeTimerModel: ExchangeTimerView.Model
    
    private let router: ExchangeConfirmationRouterInput
    private let interactor: ExchangeConfirmationInteractorInput
    
    private lazy var timer = Timer(timeInterval: 1, repeats: true) { [weak self] _ in
        self?.handleTimer()
    }
    
    //MARK: - Functions
    init(
        parameters: ExchangeConfirmationParameters,
        router: ExchangeConfirmationRouterInput,
        interactor: ExchangeConfirmationInteractorInput
    ) {
        self.router = router
        self.interactor = interactor
        self.parameters = parameters
        self.exchangeResultModel = ExchangeResultView.Model(
            sourceCurrency: "\(parameters.amount.truncating(2)) \(parameters.sourceCurrency.code ?? "")",
            targetCurrency: "\(parameters.conversionResult.truncating(2)) \(parameters.targetCurrency.code ?? "")"
        )
        self.exchangeTimerModel = ExchangeTimerView.Model(
            animationDuration: Constants.animationDuration
        )
        
        configure()
    }
    
    func convert() {
        timer.invalidate()
        
        let parameters = ExchangeSuccessParameters(
            targetCurrency: parameters.targetCurrency.code ?? "",
            conversionRate: parameters.conversionRate,
            conversionResult: parameters.conversionResult
        )
        
        router.showSuccessScreen(parameters: parameters)
    }
    
    //MARK: - Private Functions
    private func configure() {
        RunLoop.main.add(timer, forMode: .common)
    }
    
    private func handleTimer() {
        secondsLeft -= 1
        exchangeTimerModel.countdown.value = secondsLeft
        
        if secondsLeft == 0 {
            timer.invalidate()
            router.showTimeExpiredAlert()
        }
    }
    
}

//MARK: - Extensions
extension ExchangeConfirmationPresenter {
    
    private enum Constants {
        
        static let animationDuration: TimeInterval = 30
        
    }
    
}
