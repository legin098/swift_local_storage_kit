//
//  UserDefaultsStorage.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 16/04/25.
//

import Foundation

public final class UserDefaultsStorage: LocalStorage {
    private let defaults: UserDefaults
    
    public init(suiteName: String? = nil) {
        self.defaults = suiteName.flatMap { UserDefaults(suiteName: $0) } ?? .standard
    }
    
    // MARK: - Basic
    
    public func save<T: Codable>(_ value: T, forKey key: StorageKey) {
        guard let data = try? JSONEncoder().encode(value) else {
            return
        }
        
        defaults.set(data, forKey: key.rawValue)
    }
    
    public func get<T: Codable>(_ type: T.Type, forKey key: StorageKey) -> T? {
        guard let data = defaults.data(forKey: key.rawValue) else {
            return nil
        }
        
        return try? JSONDecoder().decode(type, from: data)
    }
    
    public func remove(forKey key: StorageKey) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
    public func contains(_ key: StorageKey) -> Bool {
        defaults.object(forKey: key.rawValue) != nil
    }
    
    // MARK: - Expirable
    
    public func saveExpirable<T: Codable & Sendable>(_ value: T, forKey key: StorageKey, expiresAt: Date) {
        let wrapped = ExpirableValue(value: value, expiresAt: expiresAt)
        save(wrapped, forKey: key)
    }
    
    public func getValidExpirable<T: Codable & Sendable>(_ type: T.Type, forKey key: StorageKey) -> T? {
        guard let wrapper = get(ExpirableValue<T>.self, forKey: key) else {
            return nil
        }
        
        return wrapper.isExpired ? nil : wrapper.value
    }
    
    public func isExpired(forKey key: StorageKey) -> Bool {
        guard let anyData = defaults.data(forKey: key.rawValue),
              let base = try? JSONDecoder().decode(ExpirableBase.self, from: anyData)
        else {
            return false
        }
        
        return Date() > base.expiresAt
    }
}
