//
//  LossyCollectionDecodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class LossyCollectionDecodingTests: XCTestCase, DecodingTestSpec {
    func testLossyCollectionDecoderUsingJSON() {
        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: noneLossyCollectionJSON.data(using: .utf8)!))

        let noneLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: noneLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(noneLossyCollectionModel)
        XCTAssertEqual(noneLossyCollectionModel, noneLossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionJSON.data(using: .utf8)!))

        let emptyLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyLossyCollectionModel)
        XCTAssertEqual(emptyLossyCollectionModel, lossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionJSON.data(using: .utf8)!))

        let allNullLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(allNullLossyCollectionModel)
        XCTAssertEqual(allNullLossyCollectionModel, lossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionJSON.data(using: .utf8)!))

        let partialNullLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(partialNullLossyCollectionModel)
        XCTAssertEqual(partialNullLossyCollectionModel, noneLossyCollectionExpectedModel)
    }

    func testLossyCollectionDecoderUsingXML() {
        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: noneLossyCollectionXML.data(using: .utf8)!))

        let noneLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: noneLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(noneLossyCollectionModel)
        XCTAssertEqual(noneLossyCollectionModel, noneLossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionXML.data(using: .utf8)!))

        let emptyLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(emptyLossyCollectionModel)
        XCTAssertEqual(emptyLossyCollectionModel, lossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionXML.data(using: .utf8)!))

        let allNullLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(allNullLossyCollectionModel)
        XCTAssertEqual(allNullLossyCollectionModel, lossyCollectionExpectedModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionXML.data(using: .utf8)!))

        let partialNullLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(partialNullLossyCollectionModel)
        XCTAssertEqual(partialNullLossyCollectionModel, noneLossyCollectionExpectedModel)
    }
}

private struct LossyCollectionModel: Codable, Equatable {
    @LossyArrayDecoding
    var arrayValue: [String]

    @LossyDictionaryDecoding
    var dictionaryValue: [String: String]

    @LossySetDecoding
    var setValue: Set<String>
}

private let lossyCollectionExpectedModel = LossyCollectionModel(arrayValue: [], dictionaryValue: [:], setValue: [])
private let noneLossyCollectionExpectedModel = LossyCollectionModel(arrayValue: ["1", "2"], dictionaryValue: ["1": "1", "2": "2"], setValue: ["1", "2"])

private let noneLossyCollectionJSON = """
    {
        "arrayValue": [
            "1",
            "2"
        ],
        "dictionaryValue": {
            "1": "1",
            "2": "2"
        },
        "setValue": [
            "1",
            "2"
        ]
    }
    """

private let noneLossyCollectionXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>arrayValue</key>
            <array>
                <string>1</string>
                <string>2</string>
            </array>
            <key>dictionaryValue</key>
            <dict>
                <key>1</key>
                <string>1</string>
                <key>2</key>
                <string>2</string>
            </dict>
            <key>setValue</key>
            <array>
                <string>1</string>
                <string>2</string>
            </array>
        </dict>
    </plist>
    """

private let emptyLossyCollectionJSON = """
    {
        "arrayValue": [],
        "dictionaryValue": {},
        "setValue": []
    }
    """

private let emptyLossyCollectionXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>arrayValue</key>
            <array>
            </array>
            <key>dictionaryValue</key>
            <dict>
            </dict>
            <key>setValue</key>
            <array>
            </array>
        </dict>
    </plist>
    """

private let allNullLossyCollectionJSON = """
    {
        "arrayValue": [
            null,
            null
        ],
        "dictionaryValue": {
            "1": null,
            "2": null
        },
        "setValue": [
            null,
            null
        ]
    }
    """

private let allNullLossyCollectionXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>arrayValue</key>
            <array>
                <string>$null</string>
                <string>$null</string>
            </array>
            <key>dictionaryValue</key>
            <dict>
                <key>1</key>
                <string>$null</string>
                <key>2</key>
                <string>$null</string>
            </dict>
            <key>setValue</key>
            <array>
                <string>$null</string>
                <string>$null</string>
            </array>
        </dict>
    </plist>
    """

private let partialNullLossyCollectionJSON = """
    {
        "arrayValue": [
            "1",
            null,
            "2",
        ],
        "dictionaryValue": {
            "1": "1",
            "2": "2",
            "3": null
        },
        "setValue": [
            "1",
            null,
            "2"
        ]
    }
    """

private let partialNullLossyCollectionXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>arrayValue</key>
            <array>
                <string>1</string>
                <string>$null</string>
                <string>2</string>
            </array>
            <key>dictionaryValue</key>
            <dict>
                <key>1</key>
                <string>1</string>
                <key>2</key>
                <string>2</string>
                <key>3</key>
                <string>$null</string>
            </dict>
            <key>setValue</key>
            <array>
                <string>1</string>
                <string>$null</string>
                <string>2</string>
            </array>
        </dict>
    </plist>
    """
