//
//  ImmutableWrappers.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

#if canImport(Foundation)

import Foundation

public protocol AnyImmutableWrapper {
    associatedtype T

    var wrappedValue: T { get }

    init(wrappedValue: T)
}

@propertyWrapper
public struct Immutable<T>: AnyImmutableWrapper {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable, T: AnyImmutableWrapper, T.T: OptionalDecodingWrapper {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: T.T(wrappedValue: nil))
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable, T: AnyImmutableWrapper, T.T: FallbackDecodingWrapper {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: T.T(wrappedValue: T.T.ValueProvider.defaultValue))
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: AnyImmutableWrapper, T.T: OptionalEncodingWrapper {
        if case Optional<Any>.none = value.wrappedValue.wrappedValue as Any {
            return
        } else {
            try self.encodeIfPresent(value, forKey: key)
        }
    }
}

extension Immutable: Decodable, TransientDecodingWrapper where T: Decodable {}
extension Immutable: Encodable, TransientEncodingWrapper where T: Encodable {}
extension Immutable: TransientCodingWrapper where T: Codable {}

extension Immutable: OptionalDecodingContainer where T: Decodable & ExpressibleByNilLiteral {}
extension Immutable: OptionalEncodingContainer where T: Encodable & ExpressibleByNilLiteral {}

extension Immutable: Equatable where T: Equatable {}

extension Immutable: Hashable where T: Hashable {}

#endif
