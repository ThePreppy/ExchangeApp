//
//  Cache.swift
//  ExchangeApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

final class Cache<Key: Hashable, Value> {
    
    private let wrapped = NSCache<WrappedKey, Entry>()
    private let keyTracker = KeyTracker()
    var entryLifetime: TimeInterval
    
    init(
        entryLifetime: TimeInterval = Time(hours: 1).timeInterval,
        maximumEntryCount: Int = 30
    ) {
        self.entryLifetime = entryLifetime
        wrapped.countLimit = maximumEntryCount
        wrapped.delegate = keyTracker
    }
    
    func removeValue(forKey key: Key) {
        wrapped.removeObject(forKey: WrappedKey(key))
    }
    
    subscript(key: Key) -> Value? {
        get { return entry(forKey: key)?.value }
        set {
            guard let value = newValue else {
                removeValue(forKey: key)
                return
            }
            
            insert(value, forKey: key)
        }
    }
    
}

private extension Cache {
    
    final class WrappedKey: NSObject {
        let key: Key
        
        init(_ key: Key) {
            self.key = key
        }
        
        override var hash: Int { return key.hashValue }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value = object as? WrappedKey else {
                return false
            }
            
            return value.key == key
        }
    }
    
}

private extension Cache {
    
    final class Entry {
        let key: Key
        let value: Value
        let expirationDate: Date
        
        init(key: Key, value: Value, expirationDate: Date) {
            self.key = key
            self.value = value
            self.expirationDate = expirationDate
        }
    }
    
}

private extension Cache {
    
    class KeyTracker: NSObject, NSCacheDelegate {
        var keys = Set<Key>()
        
        func cache(
            _ cache: NSCache<AnyObject, AnyObject>,
            willEvictObject object: Any
        ) {
            guard let entry = object as? Entry else {
                return
            }
            
            keys.remove(entry.key)
        }
    }
    
}

private extension Cache {
    
    func insert(_ value: Value, forKey key: Key, expirationDate: Date? = nil) {
        let date = expirationDate ?? Date().addingTimeInterval(entryLifetime)
        let entry = Entry(key: key, value: value, expirationDate: date)
        
        keyTracker.keys.insert(key)
        wrapped.setObject(entry, forKey: WrappedKey(key))
    }
    
    func entry(forKey key: Key) -> Entry? {
        guard let entry = wrapped.object(forKey: WrappedKey(key)) else {
            return nil
        }
        
        guard Date() < entry.expirationDate else {
            removeValue(forKey: key)
            return nil
        }
        
        return entry
    }
    
}

extension Cache.Entry: Codable where Key: Codable, Value: Codable {}

extension Cache: Codable where Key: Codable, Value: Codable {
    
    struct CacheModel: Codable {
        let lifetime: TimeInterval
        fileprivate let entries: [Entry]
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let model = try container.decode(CacheModel.self)
        
        self.init(entryLifetime: model.lifetime)
        
        model.entries.forEach {
            insert($0.value, forKey: $0.key, expirationDate: $0.expirationDate)
        }
    }

    func encode(to encoder: Encoder) throws {
        let cacheModel = CacheModel(
            lifetime: entryLifetime,
            entries: keyTracker.keys.compactMap {
                entry(forKey: $0)
            }
        )
        
        var container = encoder.singleValueContainer()
        try container.encode(cacheModel)
    }
    
}

extension Cache where Key: Codable, Value: Codable {}
