//
//  OmittedCodingWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public protocol OmittedDecoding: Decodable {
    associatedtype WrappedValue: ExpressibleByNilLiteral

    init(wrappedValue: WrappedValue)
}

public protocol OmittedEncoding: Encodable {}

public typealias OmittedCoding = OmittedDecoding & OmittedEncoding

@propertyWrapper
public struct OmittedDecodingWrapper<WrappedValue: Decodable>: OmittedDecoding {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedEncodingWrapper<WrappedValue: Encodable>: OmittedEncoding {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct OmittedCodingWrapper<WrappedValue: Codable>: OmittedCoding {
    public var wrappedValue: WrappedValue?

    public init(wrappedValue: WrappedValue?) {
        self.wrappedValue = wrappedValue
    }
}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: OmittedDecoding {
        return try self.decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

public extension KeyedEncodingContainer {
    mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: OmittedEncoding {}
}

public extension OmittedDecoding {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: nil)
    }
}

public extension OmittedEncoding {
    func encode(to encoder: Encoder) throws {}
}

extension OmittedDecodingWrapper: Encodable, TransientEncoding where WrappedValue: Encodable {}

extension OmittedEncodingWrapper: Decodable, TransientDecoding where WrappedValue: Decodable {}

extension OmittedDecodingWrapper: Equatable where WrappedValue: Equatable {}

extension OmittedEncodingWrapper: Equatable where WrappedValue: Equatable {}

extension OmittedCodingWrapper: Equatable where WrappedValue: Equatable {}

extension OmittedDecodingWrapper: Hashable where WrappedValue: Hashable {}

extension OmittedEncodingWrapper: Hashable where WrappedValue: Hashable {}

extension OmittedCodingWrapper: Hashable where WrappedValue: Hashable {}

#endif
