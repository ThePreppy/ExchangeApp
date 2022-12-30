//
//  ExchangeAppTests.swift
//  ExchangeAppTests
//
//  Created by Alexander on 28.12.2022.
//

import XCTest
@testable import ExchangeApp

final class ExchangeAppTests: XCTestCase {

    var cache: CurrencyCache!
    var serviceLocator: ServiceLocating!
    
    override func setUpWithError() throws {
        cache = CurrencyCache()
        serviceLocator = ServiceLocator()
    }

    override func tearDownWithError() throws {
        cache = nil
        serviceLocator = nil
    }

    func testCacheStoring() throws {
        struct TestModel {
            let source = "USD"
            let target = "EUR"
            let rate = 0.77
        }
        
        let model = TestModel()
        
        cache.insert(
            sourceCurrency: model.source,
            targetCurrency: model.target,
            conversionRate: model.rate
        )
        
        let rate = cache.value(
            sourceCurrency: model.source,
            targetCurrency: model.target
        )
        
        XCTAssertEqual(model.rate, rate)
    }
    
    func testServiceLocatorStoring() throws {
        let currencyCache = CurrencyCache()
        serviceLocator.add(service: currencyCache)
        
        let fetchedCache: CurrencyCache? = serviceLocator.getService()
        XCTAssertNotNil(fetchedCache)
    }

}
