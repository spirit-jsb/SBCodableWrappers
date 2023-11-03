//
//  DataConding.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/3.
//

#if canImport(Foundation)

import Foundation

public struct Base64DataStaticCoder: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Data {
        let stringValue = try String(from: decoder)

        if let base64Data = Data(base64Encoded: stringValue) {
            return base64Data
        } else {
            throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
    }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

#endif
