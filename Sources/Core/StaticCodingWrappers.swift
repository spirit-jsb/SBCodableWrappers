//
//  StaticCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol StaticDecoding: Decodable {
    associatedtype CustomDecoder: StaticDecoder

    init(wrappedValue: CustomDecoder.DecodedValue)
}

public protocol StaticEncoding: Encodable {
    associatedtype CustomEncoder: StaticEncoder

    var wrappedValue: CustomEncoder.EncodedValue { get }
}

public protocol StaticCoding: StaticDecoding & StaticEncoding where CustomDecoder.DecodedValue == CustomEncoder.EncodedValue {
    associatedtype CustomCoder: StaticCoder
}

@propertyWrapper
public struct StaticDecodingWrapper<CustomDecoder: StaticDecoder>: StaticDecoding {
    public var wrappedValue: CustomDecoder.DecodedValue

    public init(wrappedValue: CustomDecoder.DecodedValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticEncodingWrapper<CustomEncoder: StaticEncoder>: StaticEncoding {
    public var wrappedValue: CustomEncoder.EncodedValue

    public init(wrappedValue: CustomEncoder.EncodedValue) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct StaticCodingWrapper<CustomCoder: StaticCoder>: StaticCoding {
    public typealias CustomDecoder = CustomCoder
    public typealias CustomEncoder = CustomCoder

    public var wrappedValue: CustomCoder.CodedValue

    public init(wrappedValue: CustomCoder.CodedValue) {
        self.wrappedValue = wrappedValue
    }
}

public extension StaticDecoding {
    init(from decoder: Decoder) throws {
        try self.init(wrappedValue: CustomDecoder.decode(from: decoder))
    }
}

public extension StaticEncoding {
    func encode(to encoder: Encoder) throws {
        try CustomEncoder.encode(value: self.wrappedValue, to: encoder)
    }
}

extension StaticDecodingWrapper: Encodable, TransientEncoding where CustomDecoder.DecodedValue: Encodable {}

extension StaticEncodingWrapper: Decodable, TransientDecoding where CustomEncoder.EncodedValue: Decodable {}

extension StaticDecodingWrapper: Equatable where CustomDecoder.DecodedValue: Equatable {}

extension StaticEncodingWrapper: Equatable where CustomEncoder.EncodedValue: Equatable {}

extension StaticCodingWrapper: Equatable where CustomCoder.CodedValue: Equatable {}

extension StaticDecodingWrapper: Hashable where CustomDecoder.DecodedValue: Hashable {}

extension StaticEncodingWrapper: Hashable where CustomEncoder.EncodedValue: Hashable {}

extension StaticCodingWrapper: Hashable where CustomCoder.CodedValue: Hashable {}

#endif
