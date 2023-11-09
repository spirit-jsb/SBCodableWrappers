//
//  FloatingPointCoder.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol NonConformingDecimalValueProvider {
    static var positiveInfinity: String { get }
    static var negativeInfinity: String { get }
    static var nan: String { get }
}

public struct NonConformingFloatStaticCoder<ValueProvider: NonConformingDecimalValueProvider>: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Float {
        guard let stringValue = try? String(from: decoder) else {
            return try Float(from: decoder)
        }

        switch stringValue {
            case ValueProvider.positiveInfinity:
                return Float.infinity
            case ValueProvider.negativeInfinity:
                return -Float.infinity
            case ValueProvider.nan:
                return Float.nan
            default:
                if let float = Float(stringValue) {
                    return float
                } else {
                    throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Float.self) but could not convert \(stringValue) to Float"))
                }
        }
    }

    public static func encode(value: Float, to encoder: Encoder) throws {
        if value.isNaN {
            try ValueProvider.nan.encode(to: encoder)
        } else if value == Float.infinity {
            try ValueProvider.positiveInfinity.encode(to: encoder)
        } else if value == -Float.infinity {
            try ValueProvider.negativeInfinity.encode(to: encoder)
        } else {
            try value.encode(to: encoder)
        }
    }
}

public struct NonConformingDoubleStaticCoder<ValueProvider: NonConformingDecimalValueProvider>: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Double {
        guard let stringValue = try? String(from: decoder) else {
            return try Double(from: decoder)
        }

        switch stringValue {
            case ValueProvider.positiveInfinity:
                return Double.infinity
            case ValueProvider.negativeInfinity:
                return -Double.infinity
            case ValueProvider.nan:
                return Double.nan
            default:
                if let double = Double(stringValue) {
                    return double
                } else {
                    throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Double.self) but could not convert \(stringValue) to Double"))
                }
        }
    }

    public static func encode(value: Double, to encoder: Encoder) throws {
        if value.isNaN {
            try ValueProvider.nan.encode(to: encoder)
        } else if value == Double.infinity {
            try ValueProvider.positiveInfinity.encode(to: encoder)
        } else if value == -Double.infinity {
            try ValueProvider.negativeInfinity.encode(to: encoder)
        } else {
            try value.encode(to: encoder)
        }
    }
}

#endif
