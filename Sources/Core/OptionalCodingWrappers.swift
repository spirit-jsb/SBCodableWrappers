//
//  OptionalCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol DecodingOptionalWrapper {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedValue)
}

public protocol EncodingOptionalWrapper {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    var wrappedValue: WrappedValue { get }
}

public protocol OptionalDecodingWrapper: Decodable, DecodingOptionalWrapper where WrappedValue == CustomDecoding.CustomDecoder.DecodeValue? {
    associatedtype CustomDecoding: StaticDecodingWrapper
}

public protocol OptionalEncodingWrapper: Encodable, EncodingOptionalWrapper where WrappedValue == CustomEncoding.CustomEncoder.EncodeValue? {
    associatedtype CustomEncoding: StaticEncodingWrapper
}

public typealias OptionalCodingWrapper = OptionalDecodingWrapper & OptionalEncodingWrapper

@propertyWrapper
public struct OptionalDecoding<CustomDecoding: StaticDecodingWrapper>: OptionalDecodingWrapper {
    public var wrappedValue: CustomDecoding.CustomDecoder.DecodeValue?

    public init(wrappedValue: CustomDecoding.CustomDecoder.DecodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalEncoding<CustomEncoding: StaticEncodingWrapper>: OptionalEncodingWrapper {
    public var wrappedValue: CustomEncoding.CustomEncoder.EncodeValue?

    public init(wrappedValue: CustomEncoding.CustomEncoder.EncodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalCoding<CustomCoding: StaticCodingWrapper>: OptionalCodingWrapper {
    public typealias CustomDecoding = CustomCoding
    public typealias CustomEncoding = CustomCoding

    public var wrappedValue: CustomCoding.CustomEncoder.EncodeValue?

    public init(wrappedValue: CustomCoding.CustomDecoder.DecodeValue?) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable, T: DecodingOptionalWrapper {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: EncodingOptionalWrapper {
        if case Optional<Any>.none = value.wrappedValue as Any {
            return
        }

        try self.encodeIfPresent(value, forKey: key)
    }
}

public extension OptionalDecodingWrapper {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? CustomDecoding.CustomDecoder.decode(from: decoder))
    }
}

public extension OptionalEncodingWrapper {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = self.wrappedValue {
            try CustomEncoding.CustomEncoder.encode(value: wrappedValue, to: encoder)
        }
    }
}

extension OptionalDecoding: Encodable, TransientEncodingWrapper where CustomDecoding.CustomDecoder.DecodeValue: Encodable {}

extension OptionalEncoding: Decodable, TransientDecodingWrapper where CustomEncoding.CustomEncoder.EncodeValue: Decodable {}

extension OptionalDecoding: Equatable where CustomDecoding.CustomDecoder.DecodeValue: Equatable {}

extension OptionalEncoding: Equatable where CustomEncoding.CustomEncoder.EncodeValue: Equatable {}

extension OptionalCoding: Equatable where CustomCoding.CustomEncoder.EncodeValue: Equatable {}

extension OptionalDecoding: Hashable where CustomDecoding.CustomDecoder.DecodeValue: Hashable {}

extension OptionalEncoding: Hashable where CustomEncoding.CustomEncoder.EncodeValue: Hashable {}

extension OptionalCoding: Hashable where CustomCoding.CustomEncoder.EncodeValue: Hashable {}

#endif
