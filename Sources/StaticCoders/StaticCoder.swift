//
//  StaticCoder.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol StaticDecoder {
    associatedtype DecodedValue: Decodable

    static func decode(from decoder: Decoder) throws -> DecodedValue
}

public protocol StaticEncoder {
    associatedtype EncodedValue: Encodable

    static func encode(value: EncodedValue, to encoder: Encoder) throws
}

public protocol StaticCoder: StaticDecoder & StaticEncoder where DecodedValue == EncodedValue {
    typealias CodedValue = DecodedValue
}

#endif
