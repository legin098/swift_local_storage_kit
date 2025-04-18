//
//  StorageKey.swift
//  LocalStorage
//
//  Created by Jesus Cruz Suárez on 16/04/25.
//

import Foundation

public struct StorageKey: RawRepresentable, Hashable, Sendable {
    public let rawValue: String

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
