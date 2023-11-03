//
//  StaticCoding.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol StaticEncoder {
    associatedtype EncodedValue: Encodable

    static func encode(value: EncodedValue, to encoder: Encoder) throws
}

public protocol StaticDecoder {
    associatedtype DecodedValue: Decodable

    static func decode(from decoder: Decoder) throws -> DecodedValue
}

public protocol StaticCoder: StaticEncoder & StaticDecoder where EncodedValue == DecodedValue {
    typealias CodedValue = DecodedValue
}

#endif
