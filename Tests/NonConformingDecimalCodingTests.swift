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
        XCTAssertEqual(nonConformingFloatModel?.positive, nonConformingFloatExpectedModel.positive)
        XCTAssertEqual(nonConformingFloatModel?.negative, nonConformingFloatExpectedModel.negative)
        XCTAssertEqual(nonConformingFloatModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingFloatModel?.regular, nonConformingFloatExpectedModel.regular)
    }

    func testNonConformingFloatEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingFloatExpectedModel))

        let nonConformingFloatJSON = (try? NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingFloatExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingFloatJSON)
        XCTAssertEqual(nonConformingFloatJSON, nonConformingFloatExpectedJSON)
    }

    func testNonConformingFloatDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatXML.data(using: .utf8)!))

        let nonConformingFloatModel = try? NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingFloatModel.self, from: nonConformingFloatXML.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingFloatModel)
        XCTAssertEqual(nonConformingFloatModel?.positive, nonConformingFloatExpectedModel.positive)
        XCTAssertEqual(nonConformingFloatModel?.negative, nonConformingFloatExpectedModel.negative)
        XCTAssertEqual(nonConformingFloatModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingFloatModel?.regular, nonConformingFloatExpectedModel.regular)
    }

    func testNonConformingFloatEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingFloatExpectedModel))

        let nonConformingFloatXML = (try? NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingFloatExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingFloatXML)
        XCTAssertEqual(nonConformingFloatXML, nonConformingFloatExpectedXML)
    }

    func testNonConformingDoubleDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleJSON.data(using: .utf8)!))

        let nonConformingDoubleModel = try? NonConformingDecimalCodingTests.jsonDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleJSON.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingDoubleModel)
        XCTAssertEqual(nonConformingDoubleModel?.positive, nonConformingDoubleExpectedModel.positive)
        XCTAssertEqual(nonConformingDoubleModel?.negative, nonConformingDoubleExpectedModel.negative)
        XCTAssertEqual(nonConformingDoubleModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingDoubleModel?.regular, nonConformingDoubleExpectedModel.regular)
    }

    func testNonConformingDoubleEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingDoubleExpectedModel))

        let nonConformingDoubleJSON = (try? NonConformingDecimalCodingTests.jsonEncoder.encode(nonConformingDoubleExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingDoubleJSON)
        XCTAssertEqual(nonConformingDoubleJSON, nonConformingDoubleExpectedJSON)
    }

    func testNonConformingDoubleDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleXML.data(using: .utf8)!))

        let nonConformingDoubleModel = try? NonConformingDecimalCodingTests.plistDecoder.decode(NonConformingDoubleModel.self, from: nonConformingDoubleXML.data(using: .utf8)!)
        XCTAssertNotNil(nonConformingDoubleModel)
        XCTAssertEqual(nonConformingDoubleModel?.positive, nonConformingDoubleExpectedModel.positive)
        XCTAssertEqual(nonConformingDoubleModel?.negative, nonConformingDoubleExpectedModel.negative)
        XCTAssertEqual(nonConformingDoubleModel?.nan.isNaN, true)
        XCTAssertEqual(nonConformingDoubleModel?.regular, nonConformingDoubleExpectedModel.regular)
    }

    func testNonConformingDoubleEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingDoubleExpectedModel))

        let nonConformingDoubleXML = (try? NonConformingDecimalCodingTests.plistEncoder.encode(nonConformingDoubleExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nonConformingDoubleXML)
        XCTAssertEqual(nonConformingDoubleXML, nonConformingDoubleExpectedXML)
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

private let nonConformingFloatExpectedModel = NonConformingFloatModel(positive: .infinity, negative: -.infinity, nan: .nan, regular: 5.0)

private let nonConformingFloatJSON = """
    {
        "positive": "100",
        "negative": "-100",
        "nan": "0",
        "regular": 5.0
    }
    """

private let nonConformingFloatExpectedJSON = "{\"nan\":\"0\",\"negative\":\"-100\",\"positive\":\"100\",\"regular\":5}"

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

private let nonConformingFloatExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>nan</key>\n\t<string>0</string>\n\t<key>negative</key>\n\t<string>-100</string>\n\t<key>positive</key>\n\t<string>100</string>\n\t<key>regular</key>\n\t<real>5</real>\n</dict>\n</plist>\n"

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

private let nonConformingDoubleExpectedModel = NonConformingDoubleModel(positive: .infinity, negative: -.infinity, nan: .nan, regular: 5.0)

private let nonConformingDoubleJSON = """
    {
        "positive": "100",
        "negative": "-100",
        "nan": "0",
        "regular": 5.0
    }
    """

private let nonConformingDoubleExpectedJSON = "{\"nan\":\"0\",\"negative\":\"-100\",\"positive\":\"100\",\"regular\":5}"

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

private let nonConformingDoubleExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>nan</key>\n\t<string>0</string>\n\t<key>negative</key>\n\t<string>-100</string>\n\t<key>positive</key>\n\t<string>100</string>\n\t<key>regular</key>\n\t<real>5</real>\n</dict>\n</plist>\n"
