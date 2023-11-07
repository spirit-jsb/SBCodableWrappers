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
        XCTAssertEqual(trueAsIntegerModel, trueAsIntegerExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 0).data(using: .utf8)!))

        let falseAsIntegerModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerJSON(intValue: 0).data(using: .utf8)!)
        XCTAssertNotNil(falseAsIntegerModel)
        XCTAssertEqual(falseAsIntegerModel, falseAsIntegerExpectModel)
    }

    func testBoolAsIntegerEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(trueAsIntegerExpectModel))

        let trueAsIntegerExpectData = try? NonConformingBoolCodingTests.jsonEncoder.encode(trueAsIntegerExpectModel)
        let trueAsIntegerExpectString = trueAsIntegerExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsIntegerExpectData)
        XCTAssertNotNil(trueAsIntegerExpectString)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(falseAsIntegerExpectModel))

        let falseAsIntegerExpectData = try? NonConformingBoolCodingTests.jsonEncoder.encode(falseAsIntegerExpectModel)
        let falseAsIntegerExpectString = falseAsIntegerExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsIntegerExpectData)
        XCTAssertNotNil(falseAsIntegerExpectString)
    }

    func testBoolAsIntegerDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 1).data(using: .utf8)!))

        let trueAsIntegerModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 1).data(using: .utf8)!)
        XCTAssertNotNil(trueAsIntegerModel)
        XCTAssertEqual(trueAsIntegerModel, trueAsIntegerExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 0).data(using: .utf8)!))

        let falseAsIntegerModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsIntegerModel.self, from: boolAsIntegerXML(intValue: 0).data(using: .utf8)!)
        XCTAssertNotNil(falseAsIntegerModel)
        XCTAssertEqual(falseAsIntegerModel, falseAsIntegerExpectModel)
    }

    func testBoolAsIntegerEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(trueAsIntegerExpectModel))

        let trueAsIntegerExpectData = try? NonConformingBoolCodingTests.plistEncoder.encode(trueAsIntegerExpectModel)
        let trueAsIntegerExpectString = trueAsIntegerExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsIntegerExpectData)
        XCTAssertNotNil(trueAsIntegerExpectString)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(falseAsIntegerExpectModel))

        let falseAsIntegerExpectData = try? NonConformingBoolCodingTests.plistEncoder.encode(falseAsIntegerExpectModel)
        let falseAsIntegerExpectString = falseAsIntegerExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsIntegerExpectData)
        XCTAssertNotNil(falseAsIntegerExpectString)
    }

    func testBoolAsStringDecoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "true").data(using: .utf8)!))

        let trueAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "true").data(using: .utf8)!)
        XCTAssertNotNil(trueAsStringModel)
        XCTAssertEqual(trueAsStringModel, trueAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "TRUE").data(using: .utf8)!))

        let TRUEAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "TRUE").data(using: .utf8)!)
        XCTAssertNotNil(TRUEAsStringModel)
        XCTAssertEqual(TRUEAsStringModel, trueAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "false").data(using: .utf8)!))

        let falseAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "false").data(using: .utf8)!)
        XCTAssertNotNil(falseAsStringModel)
        XCTAssertEqual(falseAsStringModel, falseAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "FALSE").data(using: .utf8)!))

        let FALSEAsStringModel = try? NonConformingBoolCodingTests.jsonDecoder.decode(BoolAsStringModel.self, from: boolAsStringJSON(stringValue: "FALSE").data(using: .utf8)!)
        XCTAssertNotNil(FALSEAsStringModel)
        XCTAssertEqual(FALSEAsStringModel, falseAsStringExpectModel)
    }

    func testBoolAsStringEncoderUsingJSON() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(trueAsStringExpectModel))

        let trueAsStringExpectData = try? NonConformingBoolCodingTests.jsonEncoder.encode(trueAsStringExpectModel)
        let trueAsStringExpectString = trueAsStringExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsStringExpectData)
        XCTAssertNotNil(trueAsStringExpectString)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.jsonEncoder.encode(falseAsStringExpectModel))

        let falseAsStringExpectData = try? NonConformingBoolCodingTests.jsonEncoder.encode(falseAsStringExpectModel)
        let falseAsStringExpectString = falseAsStringExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsStringExpectData)
        XCTAssertNotNil(falseAsStringExpectString)
    }

    func testBoolAsStringDecoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "true").data(using: .utf8)!))

        let trueAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "true").data(using: .utf8)!)
        XCTAssertNotNil(trueAsStringModel)
        XCTAssertEqual(trueAsStringModel, trueAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "TRUE").data(using: .utf8)!))

        let TRUEAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "TRUE").data(using: .utf8)!)
        XCTAssertNotNil(TRUEAsStringModel)
        XCTAssertEqual(TRUEAsStringModel, trueAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "false").data(using: .utf8)!))

        let falseAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "false").data(using: .utf8)!)
        XCTAssertNotNil(falseAsStringModel)
        XCTAssertEqual(falseAsStringModel, falseAsStringExpectModel)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "FALSE").data(using: .utf8)!))

        let FALSEAsStringModel = try? NonConformingBoolCodingTests.plistDecoder.decode(BoolAsStringModel.self, from: boolAsStringXML(stringValue: "FALSE").data(using: .utf8)!)
        XCTAssertNotNil(FALSEAsStringModel)
        XCTAssertEqual(FALSEAsStringModel, falseAsStringExpectModel)
    }

    func testBoolAsStringEncoderUsingXML() {
        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(trueAsStringExpectModel))

        let trueAsStringExpectData = try? NonConformingBoolCodingTests.plistEncoder.encode(trueAsStringExpectModel)
        let trueAsStringExpectString = trueAsStringExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(trueAsStringExpectData)
        XCTAssertNotNil(trueAsStringExpectString)

        XCTAssertNoThrow(try NonConformingBoolCodingTests.plistEncoder.encode(falseAsStringExpectModel))

        let falseAsStringExpectData = try? NonConformingBoolCodingTests.plistEncoder.encode(falseAsStringExpectModel)
        let falseAsStringExpectString = falseAsStringExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(falseAsStringExpectData)
        XCTAssertNotNil(falseAsStringExpectString)
    }
}

private struct BoolAsIntegerModel: Codable, Equatable {
    @BoolAsIntCoding
    var boolValue: Bool
}

private let trueAsIntegerExpectModel = BoolAsIntegerModel(boolValue: true)
private let falseAsIntegerExpectModel = BoolAsIntegerModel(boolValue: false)

private func boolAsIntegerJSON(intValue: Int) -> String { """
    {
        "boolValue": \(intValue)
    }
    """
}

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

private struct BoolAsStringModel: Codable, Equatable {
    @BoolAsStringCoding
    var boolValue: Bool
}

private let trueAsStringExpectModel = BoolAsStringModel(boolValue: true)
private let falseAsStringExpectModel = BoolAsStringModel(boolValue: false)

private func boolAsStringJSON(stringValue: String) -> String { """
    {
        "boolValue": "\(stringValue)"
    }
    """
}

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
