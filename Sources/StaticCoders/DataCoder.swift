//
//  DataCoder.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

#if canImport(Foundation)

import Foundation

public struct Base64DataStaticCoder: StaticCoder {
    public static func decode(from decoder: Decoder) throws -> Data {
        let stringValue = try String(from: decoder)

        if let data = Data(base64Encoded: stringValue) {
            return data
        } else {
            throw DecodingError.valueNotFound(self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
    }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

#endif
