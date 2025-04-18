//
//  ExpirableValue.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 16/04/25.
//

import Foundation

/// Wrapper to store a value with an expiration date.
public struct ExpirableValue<T: Codable & Sendable>: Codable, Sendable {
    public let value: T
    public let expiresAt: Date

    public init(value: T, expiresAt: Date) {
        self.value = value
        self.expiresAt = expiresAt
    }

    public var isExpired: Bool {
        Date() > expiresAt
    }
}

/// Lightweight decoding-only base to check for expiration metadata.
struct ExpirableBase: Decodable {
    let expiresAt: Date
}
