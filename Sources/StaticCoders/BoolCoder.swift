//
//  BoolCoder.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol NonConformingBoolValueProvider {
    associatedtype EncodedValue: Codable, Equatable

    static func convertToBool(from value: EncodedValue) -> Bool?
    static func convertToValue(from bool: Bool) -> EncodedValue
}

public struct BoolAsIntegerValueProvider<EncodedValue>: NonConformingBoolValueProvider where EncodedValue: FixedWidthInteger & Codable {
    public static func convertToBool(from value: EncodedValue) -> Bool? {
        return value > 0 ? true : false
    }

    public static func convertToValue(from bool: Bool) -> EncodedValue {
        return bool ? 1 : 0
    }
}

public struct BoolAsStringValueProvider: NonConformingBoolValueProvider {
    public typealias EncodedValue = String

    public static func convertToBool(from value: String) -> Bool? {
        switch value.lowercased() {
            case "true":
                return true
            case "false":
                return false
            default:
                return nil
        }
    }

    public static func convertToValue(from bool: Bool) -> String {
        bool ? "true" : "false"
    }
}

public struct NonConformingBoolStaticCoder<ValueProvider: NonConformingBoolValueProvider>: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Bool {
        let encodedValue = try ValueProvider.EncodedValue(from: decoder)

        if let bool = ValueProvider.convertToBool(from: encodedValue) {
            return bool
        } else {
            throw DecodingError.typeMismatch(Bool.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "failed to convert \(ValueProvider.EncodedValue.self) to Bool"))
        }
    }

    public static func encode(value: Bool, to encoder: Encoder) throws {
        try ValueProvider.convertToValue(from: value).encode(to: encoder)
    }
}

#endif
