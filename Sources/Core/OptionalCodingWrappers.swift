//
//  OptionalCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol DecodingOptionalWrapping {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedValue)
}

public protocol EncodingOptionalWrapping {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    var wrappedValue: WrappedValue { get }
}

public typealias OptionalWrappedCoding = DecodingOptionalWrapping & EncodingOptionalWrapping

public protocol OptionalDecoding: Decodable, DecodingOptionalWrapping where WrappedValue == CustomDecoding.CustomDecoder.DecodedValue? {
    associatedtype CustomDecoding: StaticDecoding
}

public protocol OptionalEncoding: Encodable, EncodingOptionalWrapping where WrappedValue == CustomEncoding.CustomEncoder.EncodedValue? {
    associatedtype CustomEncoding: StaticEncoding
}

public typealias OptionalCoding = OptionalDecoding & OptionalEncoding

@propertyWrapper
public struct OptionalDecodingWrapper<CustomDecoding: StaticDecoding>: OptionalDecoding {
    public var wrappedValue: CustomDecoding.CustomDecoder.DecodedValue?

    public init(wrappedValue: CustomDecoding.CustomDecoder.DecodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalEncodingWrapper<CustomEncoding: StaticEncoding>: OptionalEncoding {
    public var wrappedValue: CustomEncoding.CustomEncoder.EncodedValue?

    public init(wrappedValue: CustomEncoding.CustomEncoder.EncodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalCodingWrapper<CustomCoding: StaticCoding>: OptionalCoding {
    public typealias CustomDecoding = CustomCoding
    public typealias CustomEncoding = CustomCoding

    public var wrappedValue: CustomCoding.CustomEncoder.EncodedValue?

    public init(wrappedValue: CustomCoding.CustomDecoder.DecodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: Decodable, T: DecodingOptionalWrapping {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: EncodingOptionalWrapping {
        if case Optional<Any>.none = value.wrappedValue as Any {
            return
        }

        try self.encodeIfPresent(value, forKey: key)
    }
}

public extension OptionalDecoding {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? CustomDecoding.CustomDecoder.decode(from: decoder))
    }
}

public extension OptionalEncoding {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = self.wrappedValue {
            try CustomEncoding.CustomEncoder.encode(value: wrappedValue, to: encoder)
        }
    }
}

extension OptionalDecodingWrapper: Encodable, TransientEncoding where CustomDecoding.CustomDecoder.DecodedValue: Encodable {}

extension OptionalEncodingWrapper: Decodable, TransientDecoding where CustomEncoding.CustomEncoder.EncodedValue: Decodable {}

extension OptionalDecodingWrapper: Equatable where CustomDecoding.CustomDecoder.DecodedValue: Equatable {}

extension OptionalEncodingWrapper: Equatable where CustomEncoding.CustomEncoder.EncodedValue: Equatable {}

extension OptionalCodingWrapper: Equatable where CustomCoding.CustomEncoder.EncodedValue: Equatable {}

extension OptionalDecodingWrapper: Hashable where CustomDecoding.CustomDecoder.DecodedValue: Hashable {}

extension OptionalEncodingWrapper: Hashable where CustomEncoding.CustomEncoder.EncodedValue: Hashable {}

extension OptionalCodingWrapper: Hashable where CustomCoding.CustomEncoder.EncodedValue: Hashable {}

#endif
