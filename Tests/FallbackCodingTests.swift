//
//  FallbackCodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class FallbackCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testFallbackDecoderUsingJSON() {
        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyFallbackModel = try? FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyFallbackModel)
        XCTAssertEqual(emptyFallbackModel, fallbackExpectedModel)

        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: noneFallbackJSON.data(using: .utf8)!))

        let noneFallbackModel = try? FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: noneFallbackJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneFallbackModel)
        XCTAssertEqual(noneFallbackModel, noneFallbackExpectedModel)

        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyTestableFallbackModel = try? FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyTestableFallbackModel)
        XCTAssertEqual(emptyTestableFallbackModel, testableFallbackExpectedModel)

        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: testableNoneFallbackJSON.data(using: .utf8)!))

        let testableNoneFallbackModel = try? FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: testableNoneFallbackJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableNoneFallbackModel)
        XCTAssertEqual(testableNoneFallbackModel, testableNoneFallbackExpectedModel)
    }

    func testFallbackEncoderUsingJSON() {
        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(fallbackEmptyModel))

        let fallbackJSON = (try? FallbackCodingTests.jsonEncoder.encode(fallbackEmptyModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(fallbackJSON)
        XCTAssertEqual(fallbackJSON, fallbackExpectedJSON)

        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(noneFallbackExpectedModel))

        let noneFallbackJSON = (try? FallbackCodingTests.jsonEncoder.encode(noneFallbackExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneFallbackJSON)
        XCTAssertEqual(noneFallbackJSON, noneFallbackExpectedJSON)

        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(testableFallbackEmptyModel))

        let testableFallbackJSON = (try? FallbackCodingTests.jsonEncoder.encode(testableFallbackEmptyModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableFallbackJSON)
        XCTAssertEqual(testableFallbackJSON, testableFallbackExpectedJSON)

        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(testableNoneFallbackExpectedModel))

        let testableNoneFallbackJSON = (try? FallbackCodingTests.jsonEncoder.encode(testableNoneFallbackExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableNoneFallbackJSON)
        XCTAssertEqual(testableNoneFallbackJSON, testableNoneFallbackExpectedJSON)
    }
}

private struct FallbackModel: Codable, Equatable {
    @FallbackCoding<DefaultBool>
    var boolValue: Bool?

    @FallbackCoding<DefaultInt>
    var intValue: Int?

    @FallbackCoding<DefaultDouble>
    var doubleValue: Double?

    @FallbackCoding<DefaultFloat>
    var floatValue: Float?

    @FallbackCoding<DefaultString>
    var stringValue: String?

    @FallbackCoding<DefaultArray>
    var arrayValue: [Int]?

    @FallbackCoding<DefaultDictionary>
    var dictionaryValue: [String: Int]?

    @FallbackCoding<DefaultSet>
    var setValue: Set<String>?
}

private let fallbackEmptyModel = FallbackModel(boolValue: nil, intValue: nil, doubleValue: nil, floatValue: nil, stringValue: nil, arrayValue: nil, dictionaryValue: nil, setValue: nil)
private let fallbackExpectedModel = FallbackModel(boolValue: false, intValue: 0, doubleValue: 0.0, floatValue: 0.0, stringValue: "", arrayValue: [], dictionaryValue: [:], setValue: [])
private let noneFallbackExpectedModel = FallbackModel(boolValue: true, intValue: 1, doubleValue: 1.0, floatValue: 1.0, stringValue: "1", arrayValue: [1], dictionaryValue: ["1": 1], setValue: ["1"])

private let fallbackExpectedJSON = "{\"arrayValue\":[],\"boolValue\":false,\"dictionaryValue\":{},\"doubleValue\":0,\"floatValue\":0,\"intValue\":0,\"setValue\":[],\"stringValue\":\"\"}"

private let noneFallbackJSON = """
    {
        "boolValue": true,
        "intValue": 1,
        "doubleValue": 1.0,
        "floatValue": 1.0,
        "stringValue": "1",
        "arrayValue": [
            1
        ],
        "dictionaryValue": {
            "1": 1
        },
        "setValue": [
            "1"
        ]
    }
    """

private let noneFallbackExpectedJSON = "{\"arrayValue\":[1],\"boolValue\":true,\"dictionaryValue\":{\"1\":1},\"doubleValue\":1,\"floatValue\":1,\"intValue\":1,\"setValue\":[\"1\"],\"stringValue\":\"1\"}"

private struct TestableFallbackValueProvider: FallbackValueProvider {
    static var defaultValue: String {
        "Hello World!"
    }
}

private struct TestableFallbackModel: Codable, Equatable {
    @FallbackCoding<TestableFallbackValueProvider>
    var stringValue: String?
}

private let testableFallbackEmptyModel = TestableFallbackModel(stringValue: nil)
private let testableFallbackExpectedModel = TestableFallbackModel(stringValue: "Hello World!")
private let testableNoneFallbackExpectedModel = TestableFallbackModel(stringValue: "1")

private let testableFallbackExpectedJSON = "{\"stringValue\":\"Hello World!\"}"

private let testableNoneFallbackJSON = """
    {
        "stringValue": "1"
    }
    """

private let testableNoneFallbackExpectedJSON = "{\"stringValue\":\"1\"}"
