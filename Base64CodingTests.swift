//
//  Base64CodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/7.
//

@testable import SBCodableWrappers
import XCTest

final class Base64CodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testBase64DecoderUsingJSON() {
        XCTAssertNoThrow(try Base64CodingTests.jsonDecoder.decode(Base64Model.self, from: base64JSON.data(using: .utf8)!))

        let base64Model = try? Base64CodingTests.jsonDecoder.decode(Base64Model.self, from: base64JSON.data(using: .utf8)!)
        XCTAssertNotNil(base64Model)
        XCTAssertEqual(base64Model, base64ExpectModel)
    }

    func testBase64EncoderUsingJSON() {
        XCTAssertNoThrow(try Base64CodingTests.jsonEncoder.encode(base64ExpectModel))

        let base64ExpectData = try? Base64CodingTests.jsonEncoder.encode(base64ExpectModel)
        let base64ExpectString = base64ExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(base64ExpectData)
        XCTAssertNotNil(base64ExpectString)
    }

    func testBase64DecoderUsingXML() {
        XCTAssertNoThrow(try Base64CodingTests.plistDecoder.decode(Base64Model.self, from: base64XML.data(using: .utf8)!))

        let base64Model = try? Base64CodingTests.plistDecoder.decode(Base64Model.self, from: base64XML.data(using: .utf8)!)
        XCTAssertNotNil(base64Model)
        XCTAssertEqual(base64Model, base64ExpectModel)
    }

    func testBase64EncoderUsingXML() {
        XCTAssertNoThrow(try Base64CodingTests.plistEncoder.encode(base64ExpectModel))

        let base64ExpectData = try? Base64CodingTests.plistEncoder.encode(base64ExpectModel)
        let base64ExpectString = base64ExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(base64ExpectData)
        XCTAssertNotNil(base64ExpectString)
    }
}

private struct Base64Model: Codable, Equatable {
    @Base64Coding
    var dataValue: Data
}

private let base64ExpectModel = Base64Model(dataValue: "Hello World!".data(using: .utf8)!)

private let base64JSON = """
    {
        "dataValue": "SGVsbG8gV29ybGQh"
    }
    """

private let base64XML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
            <dict>
                    <key>dataValue</key>
                    <string>SGVsbG8gV29ybGQh</string>
            </dict>
    </plist>
    """
