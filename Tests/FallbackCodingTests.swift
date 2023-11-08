//
//  FallbackCodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/8.
//

@testable import SBCodableWrappers
import XCTest

final class FallbackCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testFallbackDecoderUsingJSON() {
        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!))

        let fallbackModel = try? FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(fallbackModel)
        XCTAssertEqual(fallbackModel, fallbackExpectModel)

        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: unfallbackJSON.data(using: .utf8)!))

        let unfallbackModel = try? FallbackCodingTests.jsonDecoder.decode(FallbackModel.self, from: unfallbackJSON.data(using: .utf8)!)
        XCTAssertNotNil(unfallbackModel)
        XCTAssertEqual(unfallbackModel, unfallbackExpectModel)
        
        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!))

        let testableFallbackModel = try? FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableFallbackModel)
        XCTAssertEqual(testableFallbackModel, testableFallbackExpectModel)

        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: testableUnfallbackJSON.data(using: .utf8)!))

        let testableUnfallbackModel = try? FallbackCodingTests.jsonDecoder.decode(TestableFallbackModel.self, from: testableUnfallbackJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableUnfallbackModel)
        XCTAssertEqual(testableUnfallbackModel, testableUnfallbackExpectModel)
    }

    func testFallbackEncoderUsingJSON() {
        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(fallbackEmptyModel))

        let fallbackExpectData = try? FallbackCodingTests.jsonEncoder.encode(fallbackEmptyModel)
        let fallbackExpectString = fallbackExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(fallbackExpectData)
        XCTAssertNotNil(fallbackExpectString)

        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(unfallbackExpectModel))

        let unfallbackExpectData = try? FallbackCodingTests.jsonEncoder.encode(unfallbackExpectModel)
        let unfallbackExpectString = unfallbackExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(unfallbackExpectData)
        XCTAssertNotNil(unfallbackExpectString)
        
        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(testableFallbackEmptyModel))

        let testableFallbackExpectData = try? FallbackCodingTests.jsonEncoder.encode(testableFallbackEmptyModel)
        let testableFallbackExpectString = testableFallbackExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableFallbackExpectData)
        XCTAssertNotNil(testableFallbackExpectString)

        XCTAssertNoThrow(try FallbackCodingTests.jsonEncoder.encode(testableUnfallbackExpectModel))

        let testableUnfallbackExpectData = try? FallbackCodingTests.jsonEncoder.encode(testableUnfallbackExpectModel)
        let testableUnfallbackExpectString = testableUnfallbackExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableUnfallbackExpectData)
        XCTAssertNotNil(testableUnfallbackExpectString)
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

private let fallbackExpectModel = FallbackModel(boolValue: false, intValue: 0, doubleValue: 0.0, floatValue: 0.0, stringValue: "", arrayValue: [], dictionaryValue: [:], setValue: [])
private let fallbackEmptyModel = FallbackModel(boolValue: nil, intValue: nil, doubleValue: nil, floatValue: nil, stringValue: nil, arrayValue: nil, dictionaryValue: nil, setValue: nil)
private let unfallbackExpectModel = FallbackModel(boolValue: true, intValue: 1, doubleValue: 1.0, floatValue: 1.0, stringValue: "1", arrayValue: [1], dictionaryValue: ["1": 1], setValue: ["1"])

private let unfallbackJSON = """
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

private struct TestableFallbackValueProvider: FallbackValueProvider {
    static var defaultValue: String {
        "Hello World!"
    }
}

private struct TestableFallbackModel: Codable, Equatable {
    @FallbackCoding<TestableFallbackValueProvider>
    var stringValue: String?
}

private let testableFallbackExpectModel = TestableFallbackModel(stringValue: "Hello World!")
private let testableFallbackEmptyModel = TestableFallbackModel(stringValue: nil)
private let testableUnfallbackExpectModel = TestableFallbackModel(stringValue: "1")

private let testableUnfallbackJSON = """
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
