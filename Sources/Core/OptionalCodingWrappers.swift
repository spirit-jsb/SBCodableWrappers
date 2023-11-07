//
//  OptionalCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol OptionalDecodingContainer {
    associatedtype WrappedDecodeValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedDecodeValue)
}

public protocol OptionalEncodingContainer {
    associatedtype WrappedEncodeValue: ExpressibleByNilLiteral

    var wrappedValue: WrappedEncodeValue { get }
}

public typealias OptionalCodingContainer = OptionalDecodingContainer & OptionalEncodingContainer

public protocol OptionalDecodingWrapper: Decodable, OptionalDecodingContainer where WrappedDecodeValue == CustomDecodingWrapper.CustomDecoder.DecodeValue? {
    associatedtype CustomDecodingWrapper: StaticDecodingWrapper
}

public protocol OptionalEncodingWrapper: Encodable, OptionalEncodingContainer where WrappedEncodeValue == CustomEncodingWrapper.CustomEncoder.EncodeValue? {
    associatedtype CustomEncodingWrapper: StaticEncodingWrapper
}

public typealias OptionalCodingWrapper = OptionalDecodingWrapper & OptionalEncodingWrapper

@propertyWrapper
public struct OptionalDecoding<CustomDecodingWrapper: StaticDecodingWrapper>: OptionalDecodingWrapper {
    public var wrappedValue: CustomDecodingWrapper.CustomDecoder.DecodeValue?

    public init(wrappedValue: CustomDecodingWrapper.CustomDecoder.DecodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalEncoding<CustomEncodingWrapper: StaticEncodingWrapper>: OptionalEncodingWrapper {
    public var wrappedValue: CustomEncodingWrapper.CustomEncoder.EncodeValue?

    public init(wrappedValue: CustomEncodingWrapper.CustomEncoder.EncodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalCoding<CustomCodingWrapper: StaticCodingWrapper>: OptionalCodingWrapper {
    public typealias CustomDecodingWrapper = CustomCodingWrapper
    public typealias CustomEncodingWrapper = CustomCodingWrapper

    public var wrappedValue: CustomCodingWrapper.CustomEncoder.EncodeValue?

    public init(wrappedValue: CustomCodingWrapper.CustomDecoder.DecodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable, T: OptionalDecodingContainer {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: OptionalEncodingContainer {
        if case Optional<Any>.none = value.wrappedValue as Any {
            return
        } else {
            try self.encodeIfPresent(value, forKey: key)
        }
    }
}

public extension OptionalDecodingWrapper {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? CustomDecodingWrapper.CustomDecoder.decode(from: decoder))
    }
}

public extension OptionalEncodingWrapper {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = self.wrappedValue {
            try CustomEncodingWrapper.CustomEncoder.encode(value: wrappedValue, to: encoder)
        }
    }
}

extension OptionalDecoding: Encodable, TransientEncodingWrapper where CustomDecodingWrapper.CustomDecoder.DecodeValue: Encodable {}

extension OptionalEncoding: Decodable, TransientDecodingWrapper where CustomEncodingWrapper.CustomEncoder.EncodeValue: Decodable {}

extension OptionalDecoding: Equatable where CustomDecodingWrapper.CustomDecoder.DecodeValue: Equatable {}

extension OptionalEncoding: Equatable where CustomEncodingWrapper.CustomEncoder.EncodeValue: Equatable {}

extension OptionalCoding: Equatable where CustomCodingWrapper.CustomEncoder.EncodeValue: Equatable {}

extension OptionalDecoding: Hashable where CustomDecodingWrapper.CustomDecoder.DecodeValue: Hashable {}

extension OptionalEncoding: Hashable where CustomEncodingWrapper.CustomEncoder.EncodeValue: Hashable {}

extension OptionalCoding: Hashable where CustomCodingWrapper.CustomEncoder.EncodeValue: Hashable {}

#endif
