//
//  StaticCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol StaticDecodingWrapper: Decodable {
    associatedtype CustomDecoder: StaticDecoder

    init(wrappedValue: CustomDecoder.DecodedValue)
}

public protocol StaticEncodingWrapper: Encodable {
    associatedtype CustomEncoder: StaticEncoder

    var wrappedValue: CustomEncoder.EncodedValue { get }
}

public protocol StaticCodingWrapper: StaticDecodingWrapper & StaticEncodingWrapper where CustomDecoder.DecodedValue == CustomEncoder.EncodedValue {
    associatedtype CustomCoder: StaticCoder
}

@propertyWrapper
public struct StaticDecoding<CustomDecoder: StaticDecoder>: StaticDecodingWrapper {
    public var wrappedValue: CustomDecoder.DecodedValue

    public init(wrappedValue: CustomDecoder.DecodedValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticEncoding<CustomEncoder: StaticEncoder>: StaticEncodingWrapper {
    public var wrappedValue: CustomEncoder.EncodedValue

    public init(wrappedValue: CustomEncoder.EncodedValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticCoding<CustomCoder: StaticCoder>: StaticCodingWrapper {
    public typealias CustomDecoder = CustomCoder
    public typealias CustomEncoder = CustomCoder

    public var wrappedValue: CustomCoder.CodedValue

    public init(wrappedValue: CustomCoder.CodedValue) {
        self.wrappedValue = wrappedValue
    }
}

public extension StaticDecodingWrapper {
    init(from decoder: Decoder) throws {
        try self.init(wrappedValue: CustomDecoder.decode(from: decoder))
    }
}

public extension StaticEncodingWrapper {
    func encode(to encoder: Encoder) throws {
        try CustomEncoder.encode(value: self.wrappedValue, to: encoder)
    }
}

extension StaticDecoding: Encodable, TransientEncodingWrapper where CustomDecoder.DecodedValue: Encodable {}

extension StaticEncoding: Decodable, TransientDecodingWrapper where CustomEncoder.EncodedValue: Decodable {}

extension StaticDecoding: Equatable where CustomDecoder.DecodedValue: Equatable {}

extension StaticEncoding: Equatable where CustomEncoder.EncodedValue: Equatable {}

extension StaticCoding: Equatable where CustomCoder.CodedValue: Equatable {}

extension StaticDecoding: Hashable where CustomDecoder.DecodedValue: Hashable {}

extension StaticEncoding: Hashable where CustomEncoder.EncodedValue: Hashable {}

extension StaticCoding: Hashable where CustomCoder.CodedValue: Hashable {}

#endif
