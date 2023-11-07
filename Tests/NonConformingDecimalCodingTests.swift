//
//  NonConformingDecimalCodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/7.
//

@testable import SBCodableWrappers
import XCTest

final class NonConformingDecimalCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testNonConformingFloatDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatJSON.data(using: .utf8)!))

        let nonConformingFloatModel = try? NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatJSON.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingFloatModel)
        XCTAssertEqual(nonConformingFloatModel?.positive, nonConformingFloatExpectModel.positive)
        XCTAssertEqual(nonConformingFloatModel?.negative, nonConformingFloatExpectModel.negative)
        XCTAssertEqual(nonConformingFloatModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingFloatModel?.regular, nonConformingFloatExpectModel.regular)
    }

    func testNonConformingFloatEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingFloatExpectModel))

        let nonConformingFloatExpectData = try? NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingFloatExpectModel)
        let nonConformingFloatExpectString = nonConformingFloatExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingFloatExpectData)
        XCTAssertNotNil(nonConformingFloatExpectString)
    }

    func testNonConformingFloatDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatXML.data(using: .utf8)!))

        let nonConformingFloatModel = try? NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatXML.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingFloatModel)
        XCTAssertEqual(nonConformingFloatModel?.positive, nonConformingFloatExpectModel.positive)
        XCTAssertEqual(nonConformingFloatModel?.negative, nonConformingFloatExpectModel.negative)
        XCTAssertEqual(nonConformingFloatModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingFloatModel?.regular, nonConformingFloatExpectModel.regular)
    }

    func testNonConformingFloatEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingFloatExpectModel))

        let nonConformingFloatExpectData = try? NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingFloatExpectModel)
        let nonConformingFloatExpectString = nonConformingFloatExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingFloatExpectData)
        XCTAssertNotNil(nonConformingFloatExpectString)
    }

    func testNonConformingDoubleDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleJSON.data(using: .utf8)!))

        let nonConformingDoubleModel = try? NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleJSON.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingDoubleModel)
        XCTAssertEqual(nonConformingDoubleModel?.positive, nonConformingDoubleExpectModel.positive)
        XCTAssertEqual(nonConformingDoubleModel?.negative, nonConformingDoubleExpectModel.negative)
        XCTAssertEqual(nonConformingDoubleModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingDoubleModel?.regular, nonConformingDoubleExpectModel.regular)
    }

    func testNonConformingDoubleEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingDoubleExpectModel))

        let nonConformingDoubleExpectData = try? NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingDoubleExpectModel)
        let nonConformingDoubleExpectString = nonConformingDoubleExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingDoubleExpectData)
        XCTAssertNotNil(nonConformingDoubleExpectString)
    }

    func testNonConformingDoubleDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleXML.data(using: .utf8)!))

        let nonConformingDoubleModel = try? NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleXML.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingDoubleModel)
        XCTAssertEqual(nonConformingDoubleModel?.positive, nonConformingDoubleExpectModel.positive)
        XCTAssertEqual(nonConformingDoubleModel?.negative, nonConformingDoubleExpectModel.negative)
        XCTAssertEqual(nonConformingDoubleModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingDoubleModel?.regular, nonConformingDoubleExpectModel.regular)
    }

    func testNonConformingDoubleEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingDoubleExpectModel))

        let nonConformingDoubleExpectData = try? NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingDoubleExpectModel)
        let nonConformingDoubleExpectString = nonConformingDoubleExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingDoubleExpectData)
        XCTAssertNotNil(nonConformingDoubleExpectString)
    }
}

private struct NonConformingTestValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "0"
}

private struct NonConformingFloatModel: Codable, Equatable {
    @NonConformingFloatCoding<NonConformingTestValueProvider>
    var positive: Float
    @NonConformingFloatCoding<NonConformingTestValueProvider>
    var negative: Float
    @NonConformingFloatCoding<NonConformingTestValueProvider>
    var nan: Float
    @NonConformingFloatCoding<NonConformingTestValueProvider>
    var regular: Float
}

private let nonConformingFloatExpectModel = NonConformingFloatModel(positive: .infinity, negative: -.infinity, nan: .nan, regular: 5.0)

private let nonConformingFloatJSON = """
    {
        "positive": "100",
        "negative": "-100",
        "nan": "0",
        "regular": 5.0
    }
    """

private let nonConformingFloatXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
            <dict>
                    <key>positive</key>
                    <string>100</string>
                    <key>negative</key>
                    <string>-100</string>
                    <key>nan</key>
                    <string>0</string>
                    <key>regular</key>
                    <real>5.0</real>
            </dict>
    </plist>
    """

private struct NonConformingDoubleModel: Codable, Equatable {
    @NonConformingDoubleCoding<NonConformingTestValueProvider>
    var positive: Double
    @NonConformingDoubleCoding<NonConformingTestValueProvider>
    var negative: Double
    @NonConformingDoubleCoding<NonConformingTestValueProvider>
    var nan: Double
    @NonConformingDoubleCoding<NonConformingTestValueProvider>
    var regular: Double
}

private let nonConformingDoubleExpectModel = NonConformingDoubleModel(positive: .infinity, negative: -.infinity, nan: .nan, regular: 5.0)

private let nonConformingDoubleJSON = """
    {
        "positive": "100",
        "negative": "-100",
        "nan": "0",
        "regular": 5.0
    }
    """

private let nonConformingDoubleXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
            <dict>
                    <key>positive</key>
                    <string>100</string>
                    <key>negative</key>
                    <string>-100</string>
                    <key>nan</key>
                    <string>0</string>
                    <key>regular</key>
                    <real>5.0</real>
            </dict>
    </plist>
    """
