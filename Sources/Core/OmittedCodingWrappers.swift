//
//  OmittedCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public protocol OmittedDecodingWrapper: Decodable {
    associatedtype WrappedDecodeValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedDecodeValue)
}

public protocol OmittedEncodingWrapper: Encodable {}

public typealias OmittedCodingWrapper = OmittedDecodingWrapper & OmittedEncodingWrapper

@propertyWrapper
public struct OmittedDecoding<T: Decodable>: OmittedDecodingWrapper {
    public var wrappedValue: T?

    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedEncoding<T: Encodable>: OmittedEncodingWrapper {
    public var wrappedValue: T?

    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedCoding<T: Codable>: OmittedCodingWrapper {
    public var wrappedValue: T?

    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: OmittedDecodingWrapper {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: OmittedEncodingWrapper {}
}

public extension OmittedDecodingWrapper {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: nil)
    }
}

public extension OmittedEncodingWrapper {
    func encode(to encoder: Encoder) throws {}
}

extension OmittedDecoding: Encodable, TransientEncodingWrapper where T: Encodable {}
extension OmittedEncoding: Decodable, TransientDecodingWrapper where T: Decodable {}

extension OmittedDecoding: Equatable where T: Equatable {}
extension OmittedEncoding: Equatable where T: Equatable {}
extension OmittedCoding: Equatable where T: Equatable {}

extension OmittedDecoding: Hashable where T: Hashable {}
extension OmittedEncoding: Hashable where T: Hashable {}
extension OmittedCoding: Hashable where T: Hashable {}

#endif
