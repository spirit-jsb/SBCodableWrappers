//
//  FilterNilDecoding.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public struct ArrayFilterNilStaticDecoder<T: Decodable>: StaticDecoder {
    public static func decode(from decoder: Decoder) throws -> [T] {
        var container = try decoder.unkeyedContainer()

        return try container.filterNils()
    }
}

public struct DictionaryFilterNilStaticDecoder<T: Decodable, Key: Decodable>: StaticDecoder where Key: Hashable {
    public static func decode(from decoder: Decoder) throws -> [Key: T] {
        try [Key: T?](from: decoder).compactMapValues { $0 }
    }
}

public struct SetFilterNilStaticDecoder<T: Decodable>: StaticDecoder where T: Hashable {
    public static func decode(from decoder: Decoder) throws -> Set<T> {
        var container = try decoder.unkeyedContainer()

        return try Set(container.filterNils())
    }
}

extension UnkeyedDecodingContainer {
    mutating func filterNils<T: Decodable>() throws -> [T] {
        var elements: [T] = []

        while !self.isAtEnd {
            if let element = try decodeIfPresent(T?.self) as? T {
                elements.append(element)
            }
        }

        return elements
    }
}

#endif
