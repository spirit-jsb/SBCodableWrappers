//
//  OmittedCodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class OmittedCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testOmittedDecoderUsingJSON() {
        XCTAssertNoThrow(try OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: OmittedCodingTests.emptyJSON.data(using: .utf8)!))

        let emptyOmittedModel = try? OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: OmittedCodingTests.emptyJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyOmittedModel)
        XCTAssertEqual(emptyOmittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: omittedJSON.data(using: .utf8)!))

        let omittedModel = try? OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: omittedJSON.data(using: .utf8)!)
        XCTAssertNotNil(omittedModel)
        XCTAssertEqual(omittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: noneOmittedJSON.data(using: .utf8)!))

        let noneOmittedModel = try? OmittedCodingTests.jsonDecoder.decode(OmittedModel.self, from: noneOmittedJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneOmittedModel)
        XCTAssertEqual(noneOmittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.jsonDecoder.decode(OmittedEncodingModel.self, from: omittedJSON.data(using: .utf8)!))

        let omittedEncodingModel = try? OmittedCodingTests.jsonDecoder.decode(OmittedEncodingModel.self, from: omittedJSON.data(using: .utf8)!)
        XCTAssertNotNil(omittedEncodingModel)
        XCTAssertEqual(omittedEncodingModel, omittedEncodingExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.jsonDecoder.decode(OmittedEncodingModel.self, from: noneOmittedJSON.data(using: .utf8)!))

        let noneOmittedEncodingModel = try? OmittedCodingTests.jsonDecoder.decode(OmittedEncodingModel.self, from: noneOmittedJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneOmittedEncodingModel)
        XCTAssertEqual(noneOmittedEncodingModel, noneOmittedEncodingExpectedModel)
    }

    func testOmittedDecoderUsingXML() {
        XCTAssertNoThrow(try OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: OmittedCodingTests.emptyXML.data(using: .utf8)!))

        let emptyOmittedModel = try? OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: OmittedCodingTests.emptyXML.data(using: .utf8)!)
        XCTAssertNotNil(emptyOmittedModel)
        XCTAssertEqual(emptyOmittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: omittedXML.data(using: .utf8)!))

        let omittedModel = try? OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: omittedXML.data(using: .utf8)!)
        XCTAssertNotNil(omittedModel)
        XCTAssertEqual(omittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: noneOmittedXML.data(using: .utf8)!))

        let noneOmittedModel = try? OmittedCodingTests.plistDecoder.decode(OmittedModel.self, from: noneOmittedXML.data(using: .utf8)!)
        XCTAssertNotNil(noneOmittedModel)
        XCTAssertEqual(noneOmittedModel, omittedExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.plistDecoder.decode(OmittedEncodingModel.self, from: omittedXML.data(using: .utf8)!))

        let omittedEncodingModel = try? OmittedCodingTests.plistDecoder.decode(OmittedEncodingModel.self, from: omittedXML.data(using: .utf8)!)
        XCTAssertNotNil(omittedEncodingModel)
        XCTAssertEqual(omittedEncodingModel, omittedEncodingExpectedModel)

        XCTAssertNoThrow(try OmittedCodingTests.plistDecoder.decode(OmittedEncodingModel.self, from: noneOmittedXML.data(using: .utf8)!))

        let noneOmittedEncodingModel = try? OmittedCodingTests.plistDecoder.decode(OmittedEncodingModel.self, from: noneOmittedXML.data(using: .utf8)!)
        XCTAssertNotNil(noneOmittedEncodingModel)
        XCTAssertEqual(noneOmittedEncodingModel, noneOmittedEncodingExpectedModel)
    }

    func testOmittedEncoderUsingJSON() {
        XCTAssertNoThrow(try OmittedCodingTests.jsonEncoder.encode(omittedExpectedModel))

        let omittedJSON = (try? OmittedCodingTests.jsonEncoder.encode(omittedExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(omittedJSON)
        XCTAssertEqual(omittedJSON, omittedExpectedJSON)

        XCTAssertNoThrow(try OmittedCodingTests.jsonEncoder.encode(noneOmittedExpectedModel))

        let noneOmittedJSON = (try? OmittedCodingTests.jsonEncoder.encode(noneOmittedExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOmittedJSON)
        XCTAssertEqual(noneOmittedJSON, noneOmittedExpectedJSON)

        XCTAssertNoThrow(try OmittedCodingTests.jsonEncoder.encode(omittedDecodingExpectedModel))

        let omittedDecodingJSON = (try? OmittedCodingTests.jsonEncoder.encode(omittedDecodingExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(omittedDecodingJSON)
        XCTAssertEqual(omittedDecodingJSON, omittedDecodingExpectedJSON)

        XCTAssertNoThrow(try OmittedCodingTests.jsonEncoder.encode(noneOmittedDecodingExpectedModel))

        let noneOmittedDecodingJSON = (try? OmittedCodingTests.jsonEncoder.encode(noneOmittedDecodingExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOmittedDecodingJSON)
        XCTAssertEqual(noneOmittedDecodingJSON, noneOmittedDecodingExpectedJSON)
    }

    func testOmittedEncoderUsingXML() {
        XCTAssertNoThrow(try OmittedCodingTests.plistEncoder.encode(omittedExpectedModel))

        let omittedXML = (try? OmittedCodingTests.plistEncoder.encode(omittedExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(omittedXML)
        XCTAssertEqual(omittedXML, omittedExpectedXML)

        XCTAssertNoThrow(try OmittedCodingTests.plistEncoder.encode(noneOmittedExpectedModel))

        let noneOmittedXML = (try? OmittedCodingTests.plistEncoder.encode(noneOmittedExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOmittedXML)
        XCTAssertEqual(noneOmittedXML, noneOmittedExpectedXML)

        XCTAssertNoThrow(try OmittedCodingTests.plistEncoder.encode(omittedDecodingExpectedModel))

        let omittedDecodingXML = (try? OmittedCodingTests.plistEncoder.encode(omittedDecodingExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(omittedDecodingXML)
        XCTAssertEqual(omittedDecodingXML, omittedDecodingExpectedXML)

        XCTAssertNoThrow(try OmittedCodingTests.plistEncoder.encode(noneOmittedDecodingExpectedModel))

        let noneOmittedDecodingXML = (try? OmittedCodingTests.plistEncoder.encode(noneOmittedDecodingExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(noneOmittedDecodingXML)
        XCTAssertEqual(noneOmittedDecodingXML, noneOmittedDecodingExpectedXML)
    }
}

private struct OmittedModel: Codable, Equatable {
    @OmittedCoding
    var stringValue: String? = "Hello World!"
}

private struct OmittedDecodingModel: Codable, Equatable {
    @OmittedDecoding
    var stringValue: String? = "Hello World!"
}

private struct OmittedEncodingModel: Codable, Equatable {
    @OmittedEncoding
    var stringValue: String? = "Hello World!"
}

private let omittedExpectedModel = OmittedModel(stringValue: nil)
private let noneOmittedExpectedModel = OmittedModel(stringValue: "Hi")

private let omittedDecodingExpectedModel = OmittedDecodingModel(stringValue: nil)
private let noneOmittedDecodingExpectedModel = OmittedDecodingModel(stringValue: "Hi")

private let omittedEncodingExpectedModel = OmittedEncodingModel(stringValue: nil)
private let noneOmittedEncodingExpectedModel = OmittedEncodingModel(stringValue: "Hi")

private let omittedJSON = """
    {
        "stringValue": null
    }
    """

private let omittedExpectedJSON = "{}"
private let omittedDecodingExpectedJSON = "{\"stringValue\":null}"

private let omittedXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>stringValue</key>
            <string>$null</string>
        </dict>
    </plist>
    """

private let omittedExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict/>\n</plist>\n"
private let omittedDecodingExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>stringValue</key>\n\t<string>$null</string>\n</dict>\n</plist>\n"

private let noneOmittedJSON = """
    {
        "stringValue": "Hi"
    }
    """

private let noneOmittedExpectedJSON = "{}"
private let noneOmittedDecodingExpectedJSON = "{\"stringValue\":\"Hi\"}"

private let noneOmittedXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>stringValue</key>
            <string>Hi</string>
        </dict>
    </plist>
    """

private let noneOmittedExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict/>\n</plist>\n"
private let noneOmittedDecodingExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>stringValue</key>\n\t<string>Hi</string>\n</dict>\n</plist>\n"
