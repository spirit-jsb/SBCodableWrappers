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
        XCTAssertNoThrow(try FallbackCodingTests.jsonDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyOptionalModel = try? FallbackCodingTests.jsonDecoder.decode(OptionalModel.self, from: FallbackCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyOptionalModel)
        XCTAssertEqual(emptyOptionalModel, optionalExpectedModel)

        XCTAssertNoThrow(try OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: optionalJSON.data(using: .utf8)!))

        let optionalModel = try? OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: optionalJSON.data(using: .utf8)!)
        XCTAssertNotNil(optionalModel)
        XCTAssertEqual(optionalModel, optionalExpectedModel)

        XCTAssertNoThrow(try OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: noneOptionalJSON.data(using: .utf8)!))

        let noneOptionalModel = try? OptionalCodingTests.jsonDecoder.decode(OptionalModel.self, from: noneOptionalJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneOptionalModel)
        XCTAssertEqual(noneOptionalModel, noneOptionalExpectedModel)
    }

    func testOptionalEncoderUsingJSON() {
        XCTAssertNoThrow(try OptionalCodingTests.jsonEncoder.encode(optionalExpectedModel))

        let optionalJSON = (try? OptionalCodingTests.jsonEncoder.encode(optionalExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(optionalJSON)
        XCTAssertEqual(optionalJSON, optionalExpectedJSON)

        XCTAssertNoThrow(try OptionalCodingTests.jsonEncoder.encode(noneOptionalExpectedModel))

        let noneOptionalJSON = (try? OptionalCodingTests.jsonEncoder.encode(noneOptionalExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOptionalJSON)
        XCTAssertEqual(noneOptionalJSON, noneOptionalExpectedJSON)
    }

    func testOptionalDecoderUsingXML() {
        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyXML.data(using: .utf8)!))

        let emptyOptionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: OptionalCodingTests.emptyXML.data(using: .utf8)!)
        XCTAssertNotNil(emptyOptionalModel)
        XCTAssertEqual(emptyOptionalModel, optionalExpectedModel)

        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: optionalXML.data(using: .utf8)!))

        let optionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: optionalXML.data(using: .utf8)!)
        XCTAssertNotNil(optionalModel)
        XCTAssertEqual(optionalModel, optionalExpectedModel)

        XCTAssertNoThrow(try OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: noneOptionalXML.data(using: .utf8)!))

        let noneOptionalModel = try? OptionalCodingTests.plistDecoder.decode(OptionalModel.self, from: noneOptionalXML.data(using: .utf8)!)
        XCTAssertNotNil(noneOptionalModel)
        XCTAssertEqual(noneOptionalModel, noneOptionalExpectedModel)
    }

    func testOptionalEncoderUsingXML() {
        XCTAssertNoThrow(try OptionalCodingTests.plistEncoder.encode(optionalExpectedModel))

        let optionalXML = (try? OptionalCodingTests.plistEncoder.encode(optionalExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(optionalXML)
        XCTAssertEqual(optionalXML, optionalExpectedXML)

        XCTAssertNoThrow(try OptionalCodingTests.plistEncoder.encode(noneOptionalExpectedModel))

        let noneOptionalXML = (try? OptionalCodingTests.plistEncoder.encode(noneOptionalExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOptionalXML)
        XCTAssertEqual(noneOptionalXML, noneOptionalExpectedXML)
    }
}

private struct OptionalModel: Codable, Equatable {
    @OptionalCoding<ISO8601DateCoding>
    var dateValue: Date?
}

private let optionalExpectedModel = OptionalModel(dateValue: nil)
private let noneOptionalExpectedModel = OptionalModel(dateValue: ISO8601DateFormatter().date(from: "2023-11-08T06:08:09Z"))

private let optionalJSON = """
    {
        "dateValue": null
    }
    """

private let optionalExpectedJSON = "{}"

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

private let optionalExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict/>\n</plist>\n"

private let noneOptionalJSON = """
    {
        "dateValue": "2023-11-08T06:08:09Z"
    }
    """

private let noneOptionalExpectedJSON = "{\"dateValue\":\"2023-11-08T06:08:09Z\"}"

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

private let noneOptionalExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<string>2023-11-08T06:08:09Z</string>\n</dict>\n</plist>\n"
