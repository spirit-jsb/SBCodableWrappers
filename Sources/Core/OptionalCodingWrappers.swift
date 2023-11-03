//
//  OptionalCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol OptionalWrappedDecoding {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedValue)
}

public protocol OptionalWrappedEncoding {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    var wrappedValue: WrappedValue { get }
}

public typealias OptionalWrappedCoding = OptionalWrappedDecoding & OptionalWrappedEncoding

public protocol OptionalDecoding: Decodable, OptionalWrappedDecoding where WrappedValue == DecodingWrapper.CustomDecoder.DecodedValue? {
    associatedtype DecodingWrapper: StaticDecoding
}

public protocol OptionalEncoding: Encodable, OptionalWrappedEncoding where WrappedValue == EncodingWrapper.CustomEncoder.EncodedValue? {
    associatedtype EncodingWrapper: StaticEncoding
}

public typealias OptionalCoding = OptionalDecoding & OptionalEncoding

@propertyWrapper
public struct OptionalDecodingWrapper<CustomDecoding: StaticDecoding>: OptionalDecoding {
    public typealias DecodingWrapper = CustomDecoding

    public var wrappedValue: CustomDecoding.CustomDecoder.DecodedValue?

    public init(wrappedValue: CustomDecoding.CustomDecoder.DecodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalEncodingWrapper<CustomEncoding: StaticEncoding>: OptionalEncoding {
    public typealias EncodingWrapper = CustomEncoding

    public var wrappedValue: CustomEncoding.CustomEncoder.EncodedValue?

    public init(wrappedValue: CustomEncoding.CustomEncoder.EncodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OptionalCodingWrapper<CustomCoding: StaticCoding>: OptionalCoding {
    public typealias DecodingWrapper = CustomCoding
    public typealias EncodingWrapper = CustomCoding

    public var wrappedValue: CustomCoding.CustomEncoder.EncodedValue?

    public init(wrappedValue: CustomCoding.CustomDecoder.DecodedValue?) {
        self.wrappedValue = wrappedValue
    }
}

public extension OptionalDecoding {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? DecodingWrapper.CustomDecoder.decode(from: decoder))
    }
}

public extension OptionalEncoding {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = self.wrappedValue {
            try EncodingWrapper.CustomEncoder.encode(value: wrappedValue, to: encoder)
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

extension OptionalCodingWrapper: Hashable where CustomCoding.CustomDecoder.DecodedValue: Hashable {}

#endif
