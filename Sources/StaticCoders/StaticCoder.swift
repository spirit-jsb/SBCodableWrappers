//
//  StaticCoder.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
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
