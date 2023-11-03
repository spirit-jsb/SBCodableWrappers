//
//  TransientCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol TransientEncoding: Encodable {
    associatedtype EncodedValue: Encodable

    var wrappedValue: EncodedValue { get }
}

public protocol TransientDecoding: Decodable {
    associatedtype DecodedValue: Decodable

    init(wrappedValue: DecodedValue)
}

public protocol TransientCoding: TransientEncoding & TransientDecoding where EncodedValue == DecodedValue {}

@propertyWrapper
public struct TransientEncodingWrapper<T: Codable>: TransientEncoding {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct TransientDecodingWrapper<T: Codable>: TransientDecoding {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct TransientCodingWrapper<T: Codable>: TransientCoding {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

public extension TransientEncoding {
    func encode(to encoder: Encoder) throws {
        try self.wrappedValue.encode(to: encoder)
    }
}

public extension TransientDecoding {
    init(from decoder: Decoder) throws {
        try self.init(wrappedValue: DecodedValue(from: decoder))
    }
}

extension TransientEncodingWrapper: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        self.wrappedValue = try T(from: decoder)
    }
}

extension TransientDecodingWrapper: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        try self.wrappedValue.encode(to: encoder)
    }
}

extension TransientEncodingWrapper: Equatable where T: Equatable {}

extension TransientDecodingWrapper: Equatable where T: Equatable {}

extension TransientCodingWrapper: Equatable where T: Equatable {}

#endif
