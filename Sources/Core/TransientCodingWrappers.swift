//
//  TransientCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol TransientDecodingWrapper: Decodable {
    associatedtype DecodedValue: Decodable

    init(wrappedValue: DecodedValue)
}

public protocol TransientEncodingWrapper: Encodable {
    associatedtype EncodedValue: Encodable

    var wrappedValue: EncodedValue { get }
}

public protocol TransientCodingWrapper: TransientDecodingWrapper & TransientEncodingWrapper where DecodedValue == EncodedValue {}

@propertyWrapper
public struct TransientDecoding<T: Codable>: TransientDecodingWrapper {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct TransientEncoding<T: Codable>: TransientEncodingWrapper {
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
        try self.init(wrappedValue: DecodedValue(from: decoder))
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

#endif
