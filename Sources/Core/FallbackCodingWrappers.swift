//
//  FallbackCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public protocol FallbackValueProvider {
    associatedtype Value

    static var defaultValue: Value { get }
}

public protocol FallbackDecodingWrapper: Decodable {
    associatedtype ValueProvider: FallbackValueProvider where ValueProvider.Value: Decodable

    init(wrappedValue: ValueProvider.Value)
}

public protocol FallbackEncodingWrapper: Encodable {
    associatedtype ValueProvider: FallbackValueProvider where ValueProvider.Value: Encodable

    var wrappedValue: ValueProvider.Value? { get }
}

public typealias FallbackCodingWrapper = FallbackDecodingWrapper & FallbackEncodingWrapper

@propertyWrapper
public struct FallbackDecoding<ValueProvider: FallbackValueProvider>: FallbackDecodingWrapper where ValueProvider.Value: Decodable {
    public var wrappedValue: ValueProvider.Value

    public init(wrappedValue: ValueProvider.Value) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct FallbackEncoding<ValueProvider: FallbackValueProvider>: FallbackEncodingWrapper where ValueProvider.Value: Encodable {
    public var wrappedValue: ValueProvider.Value?

    public init(wrappedValue: ValueProvider.Value?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct FallbackCoding<ValueProvider: FallbackValueProvider>: FallbackCodingWrapper, Codable where ValueProvider.Value: Codable {
    public var wrappedValue: ValueProvider.Value?

    public init(wrappedValue: ValueProvider.Value?) {
        self.wrappedValue = wrappedValue
    }

    public init(wrappedValue: ValueProvider.Value) {
        self.wrappedValue = wrappedValue
    }
}

public extension FallbackDecodingWrapper {
    init(from decoder: Decoder) throws {
        let foundedValue = try? ValueProvider.Value(from: decoder)

        self.init(wrappedValue: foundedValue ?? ValueProvider.defaultValue)
    }
}

public extension FallbackEncodingWrapper {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = self.wrappedValue {
            try wrappedValue.encode(to: encoder)
        } else {
            try ValueProvider.defaultValue.encode(to: encoder)
        }
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: FallbackDecodingWrapper {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: T.ValueProvider.defaultValue)
    }
}

extension FallbackDecoding: Encodable, TransientEncodingWrapper where ValueProvider.Value: Encodable {}

extension FallbackEncoding: Decodable, TransientDecodingWrapper where ValueProvider.Value: Decodable {}

extension FallbackDecoding: Equatable where ValueProvider.Value: Equatable {}

extension FallbackEncoding: Equatable where ValueProvider.Value: Equatable {}

extension FallbackCoding: Equatable where ValueProvider.Value: Equatable {}

extension FallbackDecoding: Hashable where ValueProvider.Value: Hashable {}

extension FallbackEncoding: Hashable where ValueProvider.Value: Hashable {}

extension FallbackCoding: Hashable where ValueProvider.Value: Hashable {}

#endif
