//
//  LossyCollectionDecodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/8.
//

@testable import SBCodableWrappers
import XCTest

final class LossyCollectionDecodingTests: XCTestCase, DecodingTestSpec {
    func testLossyCollectionDecoderUsingJSON() {
        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: unlossyCollectionJSON.data(using: .utf8)!))

        let unlossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: unlossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(unlossyCollectionModel)
        XCTAssertEqual(unlossyCollectionModel, unlossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionJSON.data(using: .utf8)!))

        let emptyLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(emptyLossyCollectionModel)
        XCTAssertEqual(emptyLossyCollectionModel, lossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionJSON.data(using: .utf8)!))

        let allNullLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(allNullLossyCollectionModel)
        XCTAssertEqual(allNullLossyCollectionModel, lossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionJSON.data(using: .utf8)!))

        let partialNullLossyCollectionModel = try? LossyCollectionDecodingTests.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionJSON.data(using: .utf8)!)
        XCTAssertNotNil(partialNullLossyCollectionModel)
        XCTAssertEqual(partialNullLossyCollectionModel, unlossyCollectionExpectModel)
    }

    func testLossyCollectionDecoderUsingXML() {
        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: unlossyCollectionXML.data(using: .utf8)!))

        let unlossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: unlossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(unlossyCollectionModel)
        XCTAssertEqual(unlossyCollectionModel, unlossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionXML.data(using: .utf8)!))

        let emptyLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: emptyLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(emptyLossyCollectionModel)
        XCTAssertEqual(emptyLossyCollectionModel, lossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionXML.data(using: .utf8)!))

        let allNullLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: allNullLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(allNullLossyCollectionModel)
        XCTAssertEqual(allNullLossyCollectionModel, lossyCollectionExpectModel)

        XCTAssertNoThrow(try LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionXML.data(using: .utf8)!))

        let partialNullLossyCollectionModel = try? LossyCollectionDecodingTests.plistDecoder.decode(LossyCollectionModel.self, from: partialNullLossyCollectionXML.data(using: .utf8)!)
        XCTAssertNotNil(partialNullLossyCollectionModel)
        XCTAssertEqual(partialNullLossyCollectionModel, unlossyCollectionExpectModel)
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

private let lossyCollectionExpectModel = LossyCollectionModel(arrayValue: [], dictionaryValue: [:], setValue: [])
private let unlossyCollectionExpectModel = LossyCollectionModel(arrayValue: ["1", "2"], dictionaryValue: ["1": "1", "2": "2"], setValue: ["1", "2"])

private let unlossyCollectionJSON = """
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

private let unlossyCollectionXML = """
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
