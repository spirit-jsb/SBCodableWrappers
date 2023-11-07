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

    init(wrappedValue: CustomDecoder.DecodeValue)
}

public protocol StaticEncodingWrapper: Encodable {
    associatedtype CustomEncoder: StaticEncoder

    var wrappedValue: CustomEncoder.EncodeValue { get }
}

public protocol StaticCodingWrapper: StaticDecodingWrapper & StaticEncodingWrapper where CustomDecoder.DecodeValue == CustomEncoder.EncodeValue {
    associatedtype CustomCoder: StaticCoder
}

@propertyWrapper
public struct StaticDecoding<CustomDecoder: StaticDecoder>: StaticDecodingWrapper {
    public var wrappedValue: CustomDecoder.DecodeValue

    public init(wrappedValue: CustomDecoder.DecodeValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticEncoding<CustomEncoder: StaticEncoder>: StaticEncodingWrapper {
    public var wrappedValue: CustomEncoder.EncodeValue

    public init(wrappedValue: CustomEncoder.EncodeValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticCoding<CustomCoder: StaticCoder>: StaticCodingWrapper {
    public typealias CustomDecoder = CustomCoder
    public typealias CustomEncoder = CustomCoder

    public var wrappedValue: CustomCoder.CodeValue

    public init(wrappedValue: CustomCoder.CodeValue) {
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

extension StaticDecoding: Encodable, TransientEncodingWrapper where CustomDecoder.DecodeValue: Encodable {}
extension StaticEncoding: Decodable, TransientDecodingWrapper where CustomEncoder.EncodeValue: Decodable {}

extension StaticDecoding: Equatable where CustomDecoder.DecodeValue: Equatable {}
extension StaticEncoding: Equatable where CustomEncoder.EncodeValue: Equatable {}
extension StaticCoding: Equatable where CustomCoder.CodeValue: Equatable {}

extension StaticDecoding: Hashable where CustomDecoder.DecodeValue: Hashable {}
extension StaticEncoding: Hashable where CustomEncoder.EncodeValue: Hashable {}
extension StaticCoding: Hashable where CustomCoder.CodeValue: Hashable {}

extension StaticDecoding: OptionalDecodingContainer where CustomDecoder.DecodeValue: ExpressibleByNilLiteral {}
extension StaticEncoding: OptionalEncodingContainer where CustomEncoder.EncodeValue: ExpressibleByNilLiteral {}
extension StaticCoding: OptionalCodingContainer where CustomCoder.CodeValue: ExpressibleByNilLiteral {}

#endif
