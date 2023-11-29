//
//  NullEncoder.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

#if canImport(Foundation)

import Foundation

public protocol AnyNullEncoder {
    associatedtype T: Encodable

    static func encode(value: T, to encoder: Encoder) throws
}

public struct NullStaticEncoder<T: Encodable>: StaticEncoder, AnyNullEncoder where T: ExpressibleByNilLiteral {
    public static func encode(value: T, to encoder: Encoder) throws {
        if case Optional<Any>.none = value as Any {
            var container = encoder.singleValueContainer()

            try container.encodeNil()
        } else {
            try value.encode(to: encoder)
        }
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: OptionalEncodingContainer & StaticEncodingWrapper, T.CustomEncoder: AnyNullEncoder {
        try T.CustomEncoder.encode(value: value.wrappedValue, to: self.superEncoder(forKey: key))
    }

    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: AnyImmutableWrapper, T.T: OptionalEncodingContainer & StaticEncodingWrapper, T.T.CustomEncoder: AnyNullEncoder {
        try T.T.CustomEncoder.encode(value: value.wrappedValue.wrappedValue, to: self.superEncoder(forKey: key))
    }
}

#endif
