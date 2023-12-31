//
//  TransientCodingWrappers.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

#if canImport(Foundation)

import Foundation

public protocol TransientDecodingWrapper: Decodable {
    associatedtype WrappedDecodeValue: Decodable

    init(wrappedValue: WrappedDecodeValue)
}

public protocol TransientEncodingWrapper: Encodable {
    associatedtype WrappedEncodeValue: Encodable

    var wrappedValue: WrappedEncodeValue { get }
}

public protocol TransientCodingWrapper: TransientDecodingWrapper & TransientEncodingWrapper where WrappedDecodeValue == WrappedEncodeValue {}

@propertyWrapper
public struct TransientDecoding<T: Decodable>: TransientDecodingWrapper {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct TransientEncoding<T: Encodable>: TransientEncodingWrapper {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct TransientCoding<T: Codable>: TransientCodingWrapper {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

public extension TransientDecodingWrapper {
    init(from decoder: Decoder) throws {
        try self.init(wrappedValue: WrappedDecodeValue(from: decoder))
    }
}

public extension TransientEncodingWrapper {
    func encode(to encoder: Encoder) throws {
        try self.wrappedValue.encode(to: encoder)
    }
}

extension TransientDecoding: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.wrappedValue.encode(to: encoder)
    }
}

extension TransientEncoding: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        self.wrappedValue = try T(from: decoder)
    }
}

extension TransientDecoding: Equatable where T: Equatable {}
extension TransientEncoding: Equatable where T: Equatable {}
extension TransientCoding: Equatable where T: Equatable {}

extension TransientDecoding: OptionalDecodingContainer where T: ExpressibleByNilLiteral {}
extension TransientEncoding: OptionalEncodingContainer where T: ExpressibleByNilLiteral {}
extension TransientCoding: OptionalCodingContainer where T: ExpressibleByNilLiteral {}

#endif
