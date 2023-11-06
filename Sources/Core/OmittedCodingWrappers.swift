//
//  OmittedCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public protocol OmittedDecodingWrapper: Decodable {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedValue)
}

public protocol OmittedEncodingWrapper: Encodable {}

public typealias OmittedCodingWrapper = OmittedDecodingWrapper & OmittedEncodingWrapper

@propertyWrapper
public struct OmittedDecoding<WrappedValue: Decodable>: OmittedDecodingWrapper {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedEncoding<WrappedValue: Encodable>: OmittedEncodingWrapper {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedCoding<WrappedValue: Codable>: OmittedCodingWrapper {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
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

extension OmittedDecoding: Encodable, TransientEncodingWrapper where WrappedValue: Encodable {}

extension OmittedEncoding: Decodable, TransientDecodingWrapper where WrappedValue: Decodable {}

extension OmittedDecoding: Equatable where WrappedValue: Equatable {}

extension OmittedEncoding: Equatable where WrappedValue: Equatable {}

extension OmittedCoding: Equatable where WrappedValue: Equatable {}

extension OmittedDecoding: Hashable where WrappedValue: Hashable {}

extension OmittedEncoding: Hashable where WrappedValue: Hashable {}

extension OmittedCoding: Hashable where WrappedValue: Hashable {}

#endif
