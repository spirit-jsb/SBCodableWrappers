//
//  StaticCoder.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public protocol StaticDecoder {
    associatedtype DecodeValue: Decodable

    static func decode(from decoder: Decoder) throws -> DecodeValue
}

public protocol StaticEncoder {
    associatedtype EncodeValue: Encodable

    static func encode(value: EncodeValue, to encoder: Encoder) throws
}

public protocol StaticCoder: StaticDecoder & StaticEncoder where DecodeValue == EncodeValue {
    typealias CodeValue = DecodeValue
}

#endif
