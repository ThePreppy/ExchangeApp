//
//  Localizable.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum Localizable: String {
    
    //MARK: - Common
    case common_done = "common.done"
    case common_ok = "common.ok"
    case common_warning = "common.warning"
    case common_something_went_wrong = "common.something.went.wrong"
    
    //MARK: - Exchange
    case exchange_navigation_title = "exchange.navigation.title"
    case exchange_calculate = "exchange.calculate"
    case exchange_amount = "exchange.amount"
    case exchange_incorrect_amount_error = "exchange.incorrect.amount.error"
    
    //MARK: - Exchange Confirmation
    case exchange_confirmation_navigation_title = "exchange.confirmation.navigation.title"
    case exchange_confirmation_convert = "exchange.confirmation.convert"
    case exchange_confirmation_precedes = "exchange.confirmation.precedes"
    case exchange_confirmation_sec_left = "exchange.confirmation.sec.left"
    case exchange_confirmation_time_expired = "exchange.confirmation.time.expired"
    
    //MARK: - Exchange Success
    case exchange_success_navigation_title = "exchange.success.navigation.title"
    case exchange_success_title_message = "exchange.success.title.message"
    case exchange_success_subtitle_message = "exchange.success.subtitle.message"
    
    //MARK: - Select currency
    case select_currency_select = "select_currency.select"
    
    func localize() -> String {
        NSLocalizedString(rawValue, comment: "")
    }
    
    func localized(arguments: CVarArg...) -> String {
        .localizedStringWithFormat(localize(), arguments)
    }
    
}
