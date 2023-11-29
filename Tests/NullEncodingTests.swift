//
//  NullEncodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class NullEncodingTests: XCTestCase, EncodingTestSpec {
    func testNullEncodingUsingJSON() {
        XCTAssertNoThrow(try NullEncodingTests.jsonEncoder.encode(nullExpectedModel))

        let nullJSON = (try? NullEncodingTests.jsonEncoder.encode(nullExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nullJSON)
        XCTAssertEqual(nullJSON, nullExpectedJSON)

        XCTAssertNoThrow(try NullEncodingTests.jsonEncoder.encode(noneNullExpectedModel))

        let noneNullJSON = (try? NullEncodingTests.jsonEncoder.encode(noneNullExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneNullJSON)
        XCTAssertEqual(noneNullJSON, noneNullExpectedJSON)
    }

    func testNullEncodingUsingXML() {
        XCTAssertNoThrow(try NullEncodingTests.plistEncoder.encode(nullExpectedModel))

        let nullXML = (try? NullEncodingTests.plistEncoder.encode(nullExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(nullXML)
        XCTAssertEqual(nullXML, nullExpectedXML)

        XCTAssertNoThrow(try NullEncodingTests.plistEncoder.encode(noneNullExpectedModel))

        let noneNullXML = (try? NullEncodingTests.plistEncoder.encode(noneNullExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneNullXML)
        XCTAssertEqual(noneNullXML, noneNullExpectedXML)
    }
}

private struct NullModel: Codable, Equatable {
    @NullEncoding
    var stringValue: String?
}

private let nullExpectedModel = NullModel(stringValue: nil)
private let noneNullExpectedModel = NullModel(stringValue: "Hello World!")

private let nullExpectedJSON = "{\"stringValue\":null}"

private let nullExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>stringValue</key>\n\t<string>$null</string>\n</dict>\n</plist>\n"

private let noneNullExpectedJSON = "{\"stringValue\":\"Hello World!\"}"

private let noneNullExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>stringValue</key>\n\t<string>Hello World!</string>\n</dict>\n</plist>\n"
