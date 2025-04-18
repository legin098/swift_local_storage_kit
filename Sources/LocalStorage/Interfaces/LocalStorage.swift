//
//  LocalStorage.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 16/04/25.
//

import Foundation

public protocol LocalStorage {
    /// Save a value for a given key.
    func save<T: Codable>(_ value: T, forKey key: StorageKey)

    /// Retrieve a value for a given key.
    func get<T: Codable>(_ type: T.Type, forKey key: StorageKey) -> T?

    /// Remove the value for a given key.
    func remove(forKey key: StorageKey)

    /// Check if a value exists for a given key.
    func contains(_ key: StorageKey) -> Bool

    // MARK: - Expirable Value Support

    /// Save a value with expiration date.
    func saveExpirable<T: Codable>(_ value: T, forKey key: StorageKey, expiresAt: Date)

    /// Retrieve a value if it has not expired.
    func getValidExpirable<T: Codable>(_ type: T.Type, forKey key: StorageKey) -> T?

    /// Check if an expirable value has expired.
    func isExpired(forKey key: StorageKey) -> Bool
}
