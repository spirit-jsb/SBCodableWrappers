//
//  BoolCoder.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol NonConformingBoolValueProvider {
    associatedtype Value: Codable

    static func bool(from value: Value) -> Bool?
    static func value(from bool: Bool) -> Value
}

public struct BoolAsIntegerValueProvider<Value>: NonConformingBoolValueProvider where Value: FixedWidthInteger & Codable {
    public static func bool(from value: Value) -> Bool? {
        return value > 0 ? true : false
    }

    public static func value(from bool: Bool) -> Value {
        return bool ? 1 : 0
    }
}

public struct BoolAsStringValueProvider: NonConformingBoolValueProvider {
    public typealias Value = String

    public static func bool(from value: String) -> Bool? {
        switch value.lowercased() {
            case "true":
                return true
            case "false":
                return false
            default:
                return nil
        }
    }

    public static func value(from bool: Bool) -> String {
        bool ? "true" : "false"
    }
}

public struct NonConformingBoolStaticCoder<ValueProvider: NonConformingBoolValueProvider>: StaticCoder where ValueProvider.Value: Codable {
    public static func decode(from decoder: Decoder) throws -> Bool {
        let value = try ValueProvider.Value(from: decoder)

        if let bool = ValueProvider.bool(from: value) {
            return bool
        } else {
            throw DecodingError.typeMismatch(Bool.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "failed to convert \(ValueProvider.Value.self) to Bool"))
        }
    }

    public static func encode(value: Bool, to encoder: Encoder) throws {
        try ValueProvider.value(from: value).encode(to: encoder)
    }
}

#endif
