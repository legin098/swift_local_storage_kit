//
//  StorageFactory.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 16/04/25.
//

import Foundation

public enum StorageFactory {
    public static func makeStorage(config: StorageConfig) -> LocalStorage {
        if config.useInMemoryStorage {
            return InMemoryStorage()
        }
        
        return UserDefaultsStorage(suiteName: config.suiteName)
    }
}
