//
//  CacheDiskManager.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

enum CacheDiskManager {
    
    private static var fileURL: URL? {
        let folderURLs = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        ).first
        
        return folderURLs?.appendingPathComponent(Constants.Cache.name + ".cache")
    }
    
    static func saveToDisk<Key: Codable, Value: Codable>(cache: Cache<Key, Value>) throws {
        guard let fileURL else { return }
        
        let data = try JSONEncoder().encode(cache)
        try data.write(to: fileURL)
    }
    
    static func getCache<Key: Codable, Value: Codable>() -> Cache<Key, Value>? {
        guard
            let fileURL,
            let data = try? Data(contentsOf: fileURL)
        else {
            return nil
        }
        
        return try? JSONDecoder().decode(Cache.self, from: data)
    }
    
}
