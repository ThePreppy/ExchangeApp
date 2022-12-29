//
//  CurrencyCache.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

class CurrencyCache: CurrencyCacheProtocol {
    
    var cache: Cache<String, Double>
    
    init() {
        let lifetime = Time(minutes: 1).timeInterval
        
        if let diskCache: Cache<String, Double> = CacheDiskManager.getCache() {
            cache = diskCache
            cache.entryLifetime = lifetime
        } else {
            cache = .init(
                entryLifetime: lifetime,
                maximumEntryCount: 30
            )
        }
    }
    
    func insert(
        sourceCurrency: String,
        targetCurrency: String,
        conversionRate: Double
    ) {
        let key = getKey(from: sourceCurrency, targetCurrency: targetCurrency)
        cache[key] = conversionRate
        
        try? CacheDiskManager.saveToDisk(cache: cache)
    }
    
    func value(
        sourceCurrency: String,
        targetCurrency: String
    ) -> Double? {
        let key = getKey(from: sourceCurrency, targetCurrency: targetCurrency)
        let value = cache[key]
        
        try? CacheDiskManager.saveToDisk(cache: cache)
        return value
    }
    
    private func getKey(
        from sourceCurrency: String,
        targetCurrency: String
    ) -> String {
        "\(sourceCurrency)-\(targetCurrency)"
    }
    
}
