//
//  DateCoding.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol DateFormatterStaticDecoder: StaticDecoder {
    static var dateFormatter: DateFormatter { get }
}

public protocol DateFormatterStaticEncoder: StaticEncoder {
    static var dateFormatter: DateFormatter { get }
}

public typealias DateFormatterStaticCoder = StaticCoder & DateFormatterStaticDecoder & DateFormatterStaticEncoder

public protocol ISO8601DateFormatterStaticDecoder: StaticDecoder {
    static var iso8601DateFormatter: ISO8601DateFormatter { get }
}

public protocol ISO8601DateFormatterStaticEncoder: StaticEncoder {
    static var iso8601DateFormatter: ISO8601DateFormatter { get }
}

public typealias ISO8601DateFormatterStaticCoder = StaticCoder & ISO8601DateFormatterStaticDecoder & ISO8601DateFormatterStaticEncoder

public struct SecondsSince1970DateStaticCoder: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Date {
        let timeIntervalValue = try TimeInterval(from: decoder)

        return Date(timeIntervalSince1970: timeIntervalValue)
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try value.timeIntervalSince1970.encode(to: encoder)
    }
}

public struct MillisecondsSince1970DateStaticCoder: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Date {
        let timeIntervalValue = try TimeInterval(from: decoder)

        return Date(timeIntervalSince1970: timeIntervalValue / 1000)
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try (value.timeIntervalSince1970 * 1000).encode(to: encoder)
    }
}

public struct ISO8601DateStaticCoder: ISO8601DateFormatterStaticCoder {
    public static var iso8601DateFormatter: ISO8601DateFormatter = {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = .withInternetDateTime

        return dateFormatter
    }()
}

public extension DateFormatterStaticDecoder {
    static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        if let date = self.dateFormatter.date(from: stringValue) {
            return date
        } else {
            throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Date.self) but could not convert \(stringValue) to Date"))
        }
    }
}

public extension DateFormatterStaticEncoder {
    static func encode(value: Date, to encoder: Encoder) throws {
        try self.dateFormatter.string(from: value).encode(to: encoder)
    }
}

public extension ISO8601DateFormatterStaticDecoder {
    static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        if let date = self.iso8601DateFormatter.date(from: stringValue) {
            return date
        } else {
            throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Date.self) but could not convert \(stringValue) to Date"))
        }
    }
}

public extension ISO8601DateFormatterStaticEncoder {
    static func encode(value: Date, to encoder: Encoder) throws {
        try self.iso8601DateFormatter.string(from: value).encode(to: encoder)
    }
}

#endif
