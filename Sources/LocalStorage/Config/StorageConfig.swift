//
//  StorageConfig.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 18/04/25.
//

public struct StorageConfig: Sendable {
    public let useInMemoryStorage: Bool
    public let suiteName: String?

    public init(useInMemoryStorage: Bool = false, suiteName: String? = nil) {
        self.useInMemoryStorage = useInMemoryStorage
        self.suiteName = suiteName
    }
}
