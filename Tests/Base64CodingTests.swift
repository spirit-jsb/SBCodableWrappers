//
//  Base64CodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class Base64CodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testBase64DecoderUsingJSON() {
        XCTAssertNoThrow(try Base64CodingTests.jsonDecoder.decode(Base64Model.self, from: base64JSON.data(using: .utf8)!))

        let base64Model = try? Base64CodingTests.jsonDecoder.decode(Base64Model.self, from: base64JSON.data(using: .utf8)!)
        XCTAssertNotNil(base64Model)
        XCTAssertEqual(base64Model, base64ExpectedModel)
    }

    func testBase64EncoderUsingJSON() {
        XCTAssertNoThrow(try Base64CodingTests.jsonEncoder.encode(base64ExpectedModel))

        let base64JSON = (try? Base64CodingTests.jsonEncoder.encode(base64ExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(base64JSON)
        XCTAssertEqual(base64JSON, base64ExpectedJSON)
    }

    func testBase64DecoderUsingXML() {
        XCTAssertNoThrow(try Base64CodingTests.plistDecoder.decode(Base64Model.self, from: base64XML.data(using: .utf8)!))

        let base64Model = try? Base64CodingTests.plistDecoder.decode(Base64Model.self, from: base64XML.data(using: .utf8)!)
        XCTAssertNotNil(base64Model)
        XCTAssertEqual(base64Model, base64ExpectedModel)
    }

    func testBase64EncoderUsingXML() {
        XCTAssertNoThrow(try Base64CodingTests.plistEncoder.encode(base64ExpectedModel))

        let base64XML = (try? Base64CodingTests.plistEncoder.encode(base64ExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(base64XML)
        XCTAssertEqual(base64XML, base64ExpectedXML)
    }
}

private struct Base64Model: Codable, Equatable {
    @Base64Coding
    var dataValue: Data
}

private let base64ExpectedModel = Base64Model(dataValue: "Hello World!".data(using: .utf8)!)

private let base64JSON = """
    {
        "dataValue": "SGVsbG8gV29ybGQh"
    }
    """

private let base64ExpectedJSON = "{\"dataValue\":\"SGVsbG8gV29ybGQh\"}"

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

private let base64ExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dataValue</key>\n\t<string>SGVsbG8gV29ybGQh</string>\n</dict>\n</plist>\n"
