//
//  NonConformingBoolCodingTests.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/7.
//

@testable import SBCodableWrappers
import XCTest

final class NonConformingBoolCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testBoolAsIntegerDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 1).data(using: .utf8)!))

        let trueAsIntegerModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 1).data(using: .utf8)!)
        XCTAssertNotNil(trueAsIntegerModel)
        XCTAssertEqual(trueAsIntegerModel, trueAsIntegerExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 0).data(using: .utf8)!))

        let falseAsIntegerModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 0).data(using: .utf8)!)
        XCTAssertNotNil(falseAsIntegerModel)
        XCTAssertEqual(falseAsIntegerModel, falseAsIntegerExpectedModel)
    }

    func testBoolAsIntegerEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(trueAsIntegerExpectedModel))

        let trueAsIntegerJSON = (try? NonConformingBoolCodingTests.jsonEncoder.encode(trueAsIntegerExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsIntegerJSON)
        XCTAssertEqual(trueAsIntegerJSON, boolAsIntegerExpectedJSON(intValue: 1))

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(falseAsIntegerExpectedModel))

        let falseAsIntegerJSON = (try? NonConformingBoolCodingTests.jsonEncoder.encode(falseAsIntegerExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsIntegerJSON)
        XCTAssertEqual(falseAsIntegerJSON, boolAsIntegerExpectedJSON(intValue: 0))
    }

    func testBoolAsIntegerDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 1).data(using: .utf8)!))

        let trueAsIntegerModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 1).data(using: .utf8)!)
        XCTAssertNotNil(trueAsIntegerModel)
        XCTAssertEqual(trueAsIntegerModel, trueAsIntegerExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 0).data(using: .utf8)!))

        let falseAsIntegerModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 0).data(using: .utf8)!)
        XCTAssertNotNil(falseAsIntegerModel)
        XCTAssertEqual(falseAsIntegerModel, falseAsIntegerExpectedModel)
    }

    func testBoolAsIntegerEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(trueAsIntegerExpectedModel))

        let trueAsIntegerXML = (try? NonConformingBoolCodingTests.plistEncoder.encode(trueAsIntegerExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsIntegerXML)
        XCTAssertEqual(trueAsIntegerXML, boolAsIntegerExpectedXML(intValue: 1))

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(falseAsIntegerExpectedModel))

        let falseAsIntegerXML = (try? NonConformingBoolCodingTests.plistEncoder.encode(falseAsIntegerExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsIntegerXML)
        XCTAssertEqual(falseAsIntegerXML, boolAsIntegerExpectedXML(intValue: 0))
    }

    func testBoolAsStringDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "true").data(using: .utf8)!))

        let trueAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "true").data(using: .utf8)!)
        XCTAssertNotNil(trueAsStringModel)
        XCTAssertEqual(trueAsStringModel, trueAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "TRUE").data(using: .utf8)!))

        let TRUEAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "TRUE").data(using: .utf8)!)
        XCTAssertNotNil(TRUEAsStringModel)
        XCTAssertEqual(TRUEAsStringModel, trueAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "false").data(using: .utf8)!))

        let falseAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "false").data(using: .utf8)!)
        XCTAssertNotNil(falseAsStringModel)
        XCTAssertEqual(falseAsStringModel, falseAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "FALSE").data(using: .utf8)!))

        let FALSEAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "FALSE").data(using: .utf8)!)
        XCTAssertNotNil(FALSEAsStringModel)
        XCTAssertEqual(FALSEAsStringModel, falseAsStringExpectedModel)
    }

    func testBoolAsStringEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(trueAsStringExpectedModel))

        let trueAsStringJSON = (try? NonConformingBoolCodingTests.jsonEncoder.encode(trueAsStringExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsStringJSON)
        XCTAssertEqual(trueAsStringJSON, boolAsStringExpectedJSON(stringValue: "true"))

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(falseAsStringExpectedModel))

        let falseAsStringJSON = (try? NonConformingBoolCodingTests.jsonEncoder.encode(falseAsStringExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsStringJSON)
        XCTAssertEqual(falseAsStringJSON, boolAsStringExpectedJSON(stringValue: "false"))
    }

    func testBoolAsStringDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "true").data(using: .utf8)!))

        let trueAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "true").data(using: .utf8)!)
        XCTAssertNotNil(trueAsStringModel)
        XCTAssertEqual(trueAsStringModel, trueAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "TRUE").data(using: .utf8)!))

        let TRUEAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "TRUE").data(using: .utf8)!)
        XCTAssertNotNil(TRUEAsStringModel)
        XCTAssertEqual(TRUEAsStringModel, trueAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "false").data(using: .utf8)!))

        let falseAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "false").data(using: .utf8)!)
        XCTAssertNotNil(falseAsStringModel)
        XCTAssertEqual(falseAsStringModel, falseAsStringExpectedModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "FALSE").data(using: .utf8)!))

        let FALSEAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "FALSE").data(using: .utf8)!)
        XCTAssertNotNil(FALSEAsStringModel)
        XCTAssertEqual(FALSEAsStringModel, falseAsStringExpectedModel)
    }

    func testBoolAsStringEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(trueAsStringExpectedModel))

        let trueAsStringXML = (try? NonConformingBoolCodingTests.plistEncoder.encode(trueAsStringExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsStringXML)
        XCTAssertEqual(trueAsStringXML, boolAsStringExpectedXML(stringValue: "true"))

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(falseAsStringExpectedModel))

        let falseAsStringXML = (try? NonConformingBoolCodingTests.plistEncoder.encode(falseAsStringExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsStringXML)
        XCTAssertEqual(falseAsStringXML, boolAsStringExpectedXML(stringValue: "false"))
    }
}

private struct BoolAsIntegerModel: Codable, Equatable {
    @BoolAsIntCoding
    var boolValue: Bool
}

private let trueAsIntegerExpectedModel = BoolAsIntegerModel(boolValue: true)
private let falseAsIntegerExpectedModel = BoolAsIntegerModel(boolValue: false)

private func boolAsIntegerJSON(intValue: Int) -> String { """
    {
        "boolValue": \(intValue)
    }
    """
}

private func boolAsIntegerExpectedJSON(intValue: Int) -> String { "{\"boolValue\":\(intValue)}" }

private func boolAsIntegerXML(intValue: Int) -> String { """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>boolValue</key>
            <integer>\(intValue)</integer>
        </dict>
    </plist>
    """
}

private func boolAsIntegerExpectedXML(intValue: Int) -> String { "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>boolValue</key>\n\t<integer>\(intValue)</integer>\n</dict>\n</plist>\n" }

private struct BoolAsStringModel: Codable, Equatable {
    @BoolAsStringCoding
    var boolValue: Bool
}

private let trueAsStringExpectedModel = BoolAsStringModel(boolValue: true)
private let falseAsStringExpectedModel = BoolAsStringModel(boolValue: false)

private func boolAsStringJSON(stringValue: String) -> String { """
    {
        "boolValue": "\(stringValue)"
    }
    """
}

private func boolAsStringExpectedJSON(stringValue: String) -> String { "{\"boolValue\":\"\(stringValue)\"}" }

private func boolAsStringXML(stringValue: String) -> String { """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>boolValue</key>
            <string>\(stringValue)</string>
        </dict>
    </plist>
    """
}

private func boolAsStringExpectedXML(stringValue: String) -> String { "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>boolValue</key>\n\t<string>\(stringValue)</string>\n</dict>\n</plist>\n" }
