//
//  OptionalCodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/8.
//

@testable import SBCodableWrappers
import XCTest

final class OptionalCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testOptionalDecoderUsingJSON() {
        XCTAssertNoThrow(try OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: optionalJSON.data(using: .utf8)!))

        let optionalModel = try? OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: optionalJSON.data(using: .utf8)!)
        XCTAssertNotNil(optionalModel)
        XCTAssertEqual(optionalModel, optionalExpectModel)

        XCTAssertNoThrow(try OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyOptionalModel = try? OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyOptionalModel)
        XCTAssertEqual(emptyOptionalModel, optionalExpectModel)

        XCTAssertNoThrow(try OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: noneOptionalJSON.data(using: .utf8)!))

        let noneOptionalModel = try? OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: noneOptionalJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneOptionalModel)
        XCTAssertEqual(noneOptionalModel, noneOptionalExpectModel)
    }

    func testOptionalEncoderUsingJSON() {
        XCTAssertNoThrow(try OptionalCodingTests.jsonEncoder.encode(optionalExpectModel))

        let optionalExpectData = try? OptionalCodingTests.jsonEncoder.encode(optionalExpectModel)
        let optionalExpectString = optionalExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(optionalExpectData)
        XCTAssertNotNil(optionalExpectString)

        XCTAssertNoThrow(try OptionalCodingTests.jsonEncoder.encode(noneOptionalExpectModel))

        let noneOptionalExpectData = try? OptionalCodingTests.jsonEncoder.encode(noneOptionalExpectModel)
        let noneOptionalExpectString = noneOptionalExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOptionalExpectData)
        XCTAssertNotNil(noneOptionalExpectString)
    }

    func testOptionalDecoderUsingXML() {
        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: optionalXML.data(using: .utf8)!))

        let optionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: optionalXML.data(using: .utf8)!)
        XCTAssertNotNil(optionalModel)
        XCTAssertEqual(optionalModel, optionalExpectModel)

        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyOptionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyOptionalModel)
        XCTAssertEqual(emptyOptionalModel, optionalExpectModel)

        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: noneOptionalXML.data(using: .utf8)!))

        let noneOptionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: noneOptionalXML.data(using: .utf8)!)
        XCTAssertNotNil(noneOptionalModel)
        XCTAssertEqual(noneOptionalModel, noneOptionalExpectModel)
    }

    func testOptionalEncoderUsingXML() {
        XCTAssertNoThrow(try OptionalCodingTests.plistEncoder.encode(optionalExpectModel))

        let optionalExpectData = try? OptionalCodingTests.plistEncoder.encode(optionalExpectModel)
        let optionalExpectString = optionalExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(optionalExpectData)
        XCTAssertNotNil(optionalExpectString)

        XCTAssertNoThrow(try OptionalCodingTests.plistEncoder.encode(noneOptionalExpectModel))

        let noneOptionalExpectData = try? OptionalCodingTests.plistEncoder.encode(noneOptionalExpectModel)
        let noneOptionalExpectString = noneOptionalExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOptionalExpectData)
        XCTAssertNotNil(noneOptionalExpectString)
    }
}

private struct OptionalModel: Codable, Equatable {
    @OptionalCoding<ISO8601DateCoding>
    var dateValue: Date?
}

private let optionalExpectModel = OptionalModel(dateValue: nil)
private let noneOptionalExpectModel = OptionalModel(dateValue: ISO8601DateFormatter().date(from: "2023-11-08T06:08:09Z"))

private let optionalJSON = """
    {
        "dateValue": null
    }
    """

private let optionalXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <string>$null</string>
        </dict>
    </plist>
    """

private let noneOptionalJSON = """
    {
        "dateValue": "2023-11-08T06:08:09Z"
    }
    """

private let noneOptionalXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <string>2023-11-08T06:08:09Z</string>
        </dict>
    </plist>
    """
