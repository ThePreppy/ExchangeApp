//
//  ExchangePresenter.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

protocol ExchangePresenterInput: AnyObject, ErrorRepresentable, Loadable {
    
    var exhangeViewModel: ExchangeView.Model? { get }
    
    func proceedConvertion(with amount: String?)
    
}

class ExchangePresenter: ExchangePresenterInput {
    
    //MARK: - Properties
    private let currencies: [CurrencyModel]
    private let sourceCurrency = Observable<CurrencyModel>(.eur)
    private let targetCurrency = Observable<CurrencyModel>(.usd)
    
    private var currencyAmount: Int = 0
    private(set) var exhangeViewModel: ExchangeView.Model?
    
    private let router: ExchangeRouterInput
    private let interactor: ExchangeInteractorInput
    
    weak var loader: LoaderRepresentable?
    
    //MARK: - Functions
    init(
        router: ExchangeRouterInput,
        interactor: ExchangeInteractorInput,
        currenciesProvider: CurrenciesProviderProtocol
    ) {
        self.router = router
        self.interactor = interactor
        self.currencies = currenciesProvider.getCurrencies()
        
        configure()
    }
    
    func proceedConvertion(with amount: String?) {
        guard let amount, let amountValue = Int(amount), amountValue > 0 else {
            router.handle(error: ExchangeError.incorrectAmount)
            return
        }
        
        currencyAmount = amountValue
        proceedConvertionRequest()
    }
    
    func handle(error: Error?) {
        router.handle(error: error)
    }
    
    //MARK: - Private Functions
    private func configure() {
        exhangeViewModel = ExchangeView.Model(
            sourceCurrency: sourceCurrency.value.code ?? "",
            targetCurrency: targetCurrency.value.code ?? "",
            shouldSelectSource: { [weak self] in
                guard let self = self else { return }
                
                self.router.presentPicker(items: self.currencies) {
                    self.sourceCurrency.value = $0
                }
            },
            shouldSelectTarget: { [weak self] in
                guard let self = self else { return }
                
                self.router.presentPicker(items: self.currencies) {
                    self.targetCurrency.value = $0
                }
            }
        )
        
        sourceCurrency.subscribe { [weak self] in
            self?.exhangeViewModel?.sourceCurrency.value = $0.code ?? ""
        }
        
        targetCurrency.subscribe { [weak self] in
            self?.exhangeViewModel?.targetCurrency.value = $0.code ?? ""
        }
    }
    
    //MARK: - Request
    private func proceedConvertionRequest() {
        loader?.startLoading()
        
        interactor.fetchCurrencyRate(
            sourceCode: sourceCurrency.value.code ?? "",
            targetCode: targetCurrency.value.code ?? "",
            amount: currencyAmount
        ) { [weak self] in
            self?.loader?.stopLoading()
            
            switch $0 {
            case .success(let model):
                self?.handle(currencyConversion: model)
                
            case .failure(let error):
                self?.handle(error: error)
                
            }
            
        }
    }
    
    //MARK: - Response
    private func handle(currencyConversion: CurrencyConversionModel?) {
        guard let currencyConversion else {
            handle(error: EAError.somethingWentWrong)
            return
        }
        
        let parameters = ExchangeConfirmationParameters(
            amount: currencyAmount,
            sourceCurrency: sourceCurrency.value,
            targetCurrency: targetCurrency.value,
            conversionRate: currencyConversion.rate,
            conversionResult: currencyConversion.result
        )
        router.pushExchangeConfirmation(parameters: parameters)
    }
    
}
