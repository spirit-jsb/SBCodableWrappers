//
//  DateCodingTests.swift
//
//  Created by Max on 2023/11/9
//
//  Copyright © 2023 Max. All rights reserved.
//

@testable import SBCodableWrappers
import XCTest

final class DateCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testSecondsSince1970DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateJSON.data(using: .utf8)!))

        let secondsSince1970DateModel = try? DateCodingTests.jsonDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(secondsSince1970DateModel)
        XCTAssertEqual(secondsSince1970DateModel, secondsSince1970DateExpectedModel)
    }

    func testSecondsSince1970DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(secondsSince1970DateExpectedModel))

        let secondsSince1970DateJSON = (try? DateCodingTests.jsonEncoder.encode(secondsSince1970DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(secondsSince1970DateJSON)
        XCTAssertEqual(secondsSince1970DateJSON, secondsSince1970DateExpectedJSON)
    }

    func testSecondsSince1970DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateXML.data(using: .utf8)!))

        let secondsSince1970DateModel = try? DateCodingTests.plistDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateXML.data(using: .utf8)!)
        XCTAssertNotNil(secondsSince1970DateModel)
        XCTAssertEqual(secondsSince1970DateModel, secondsSince1970DateExpectedModel)
    }

    func testSecondsSince1970DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(secondsSince1970DateExpectedModel))

        let secondsSince1970DateXML = (try? DateCodingTests.plistEncoder.encode(secondsSince1970DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(secondsSince1970DateXML)
        XCTAssertEqual(secondsSince1970DateXML, secondsSince1970DateExpectedXML)
    }

    func testMillisecondsSince1970DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateJSON.data(using: .utf8)!))

        let millisecondsSince1970DateModel = try? DateCodingTests.jsonDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(millisecondsSince1970DateModel)
        XCTAssertEqual(millisecondsSince1970DateModel, millisecondsSince1970DateExpectedModel)
    }

    func testMillisecondsSince1970DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(millisecondsSince1970DateExpectedModel))

        let millisecondsSince1970DateJSON = (try? DateCodingTests.jsonEncoder.encode(millisecondsSince1970DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(millisecondsSince1970DateJSON)
        XCTAssertEqual(millisecondsSince1970DateJSON, millisecondsSince1970DateExpectedJSON)
    }

    func testMillisecondsSince1970DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateXML.data(using: .utf8)!))

        let millisecondsSince1970DateModel = try? DateCodingTests.plistDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateXML.data(using: .utf8)!)
        XCTAssertNotNil(millisecondsSince1970DateModel)
        XCTAssertEqual(millisecondsSince1970DateModel, millisecondsSince1970DateExpectedModel)
    }

    func testMillisecondsSince1970DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(millisecondsSince1970DateExpectedModel))

        let millisecondsSince1970DateXML = (try? DateCodingTests.plistEncoder.encode(millisecondsSince1970DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(millisecondsSince1970DateXML)
        XCTAssertEqual(millisecondsSince1970DateXML, millisecondsSince1970DateExpectedXML)
    }

    func testISO8601DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(ISO8601DateModel.self, from: iso8601DateJSON.data(using: .utf8)!))

        let iso8601DateModel = try? DateCodingTests.jsonDecoder.decode(ISO8601DateModel.self, from: iso8601DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(iso8601DateModel)
        XCTAssertEqual(iso8601DateModel, iso8601DateExpectedModel)
    }

    func testISO8601DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(iso8601DateExpectedModel))

        let iso8601DateJSON = (try? DateCodingTests.jsonEncoder.encode(iso8601DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(iso8601DateJSON)
        XCTAssertEqual(iso8601DateJSON, iso8601DateExpectedJSON)
    }

    func testISO8601DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(ISO8601DateModel.self, from: iso8601DateXML.data(using: .utf8)!))

        let iso8601DateModel = try? DateCodingTests.plistDecoder.decode(ISO8601DateModel.self, from: iso8601DateXML.data(using: .utf8)!)
        XCTAssertNotNil(iso8601DateModel)
        XCTAssertEqual(iso8601DateModel, iso8601DateExpectedModel)
    }

    func testISO8601DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(iso8601DateExpectedModel))

        let iso8601DateXML = (try? DateCodingTests.plistEncoder.encode(iso8601DateExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(iso8601DateXML)
        XCTAssertEqual(iso8601DateXML, iso8601DateExpectedXML)
    }

    func testTestableDateFormatterDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterJSON.data(using: .utf8)!))

        let testableDateFormatterModel = try? DateCodingTests.jsonDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableDateFormatterModel)
        XCTAssertEqual(testableDateFormatterModel, testableDateFormatterExpectedModel)
    }

    func testTestableDateFormatterEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(testableDateFormatterExpectedModel))

        let testableDateFormatterJSON = (try? DateCodingTests.jsonEncoder.encode(testableDateFormatterExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableDateFormatterJSON)
        XCTAssertEqual(testableDateFormatterJSON, testableDateFormatterExpectedJSON)
    }

    func testTestableDateFormatterDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterXML.data(using: .utf8)!))

        let testableDateFormatterModel = try? DateCodingTests.plistDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterXML.data(using: .utf8)!)
        XCTAssertNotNil(testableDateFormatterModel)
        XCTAssertEqual(testableDateFormatterModel, testableDateFormatterExpectedModel)
    }

    func testTestableDateFormatterEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(testableDateFormatterExpectedModel))

        let testableDateFormatterXML = (try? DateCodingTests.plistEncoder.encode(testableDateFormatterExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableDateFormatterXML)
        XCTAssertEqual(testableDateFormatterXML, testableDateFormatterExpectedXML)
    }

    func testTestableISO8601DateFormatterDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterJSON.data(using: .utf8)!))

        let testableISO8601DateFormatterModel = try? DateCodingTests.jsonDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableISO8601DateFormatterModel)
        XCTAssertEqual(testableISO8601DateFormatterModel, testableISO8601DateFormatterExpectedModel)
    }

    func testTestableISO8601DateFormatterEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(testableISO8601DateFormatterExpectedModel))

        let testableISO8601DateFormatterJSON = (try? DateCodingTests.jsonEncoder.encode(testableISO8601DateFormatterExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableISO8601DateFormatterJSON)
        XCTAssertEqual(testableISO8601DateFormatterJSON, testableISO8601DateFormatterExpectedJSON)
    }

    func testTestableISO8601DateFormatterDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterXML.data(using: .utf8)!))

        let testableISO8601DateFormatterModel = try? DateCodingTests.plistDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterXML.data(using: .utf8)!)
        XCTAssertNotNil(testableISO8601DateFormatterModel)
        XCTAssertEqual(testableISO8601DateFormatterModel, testableISO8601DateFormatterExpectedModel)
    }

    func testTestableISO8601DateFormatterEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(testableISO8601DateFormatterExpectedModel))

        let testableISO8601DateFormatterXML = (try? DateCodingTests.plistEncoder.encode(testableISO8601DateFormatterExpectedModel)).map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableISO8601DateFormatterXML)
        XCTAssertEqual(testableISO8601DateFormatterXML, testableISO8601DateFormatterExpectedXML)
    }
}

private struct SecondsSince1970DateModel: Codable, Equatable {
    @SecondsSince1970DateCoding
    var dateValue: Date
}

private let secondsSince1970DateExpectedModel = SecondsSince1970DateModel(dateValue: Date(timeIntervalSince1970: 1_699_394_889.0))

private let secondsSince1970DateJSON = """
    {
        "dateValue": 1699394889.0
    }
    """

private let secondsSince1970DateExpectedJSON = "{\"dateValue\":1699394889}"

private let secondsSince1970DateXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <real>1699394889.0</real>
        </dict>
    </plist>
    """

private let secondsSince1970DateExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<real>1699394889</real>\n</dict>\n</plist>\n"

private struct MillisecondsSince1970DateModel: Codable, Equatable {
    @MillisecondsSince1970DateCoding
    var dateValue: Date
}

private let millisecondsSince1970DateExpectedModel = MillisecondsSince1970DateModel(dateValue: Date(timeIntervalSince1970: 1_699_394_889.0))

private let millisecondsSince1970DateJSON = """
    {
        "dateValue": 1699394889000.0
    }
    """

private let millisecondsSince1970DateExpectedJSON = "{\"dateValue\":1699394889000}"

private let millisecondsSince1970DateXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <real>1699394889000.0</real>
        </dict>
    </plist>
    """

private let millisecondsSince1970DateExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<real>1699394889000</real>\n</dict>\n</plist>\n"

private struct ISO8601DateModel: Codable, Equatable {
    @ISO8601DateCoding
    var dateValue: Date
}

private let iso8601DateExpectedModel = ISO8601DateModel(dateValue: ISO8601DateFormatter().date(from: "2023-11-08T06:08:09Z")!)

private let iso8601DateJSON = """
    {
        "dateValue": "2023-11-08T06:08:09Z"
    }
    """

private let iso8601DateExpectedJSON = "{\"dateValue\":\"2023-11-08T06:08:09Z\"}"

private let iso8601DateXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <string>2023-11-08T06:08:09Z</string>
        </dict>
    </plist>
    """

private let iso8601DateExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<string>2023-11-08T06:08:09Z</string>\n</dict>\n</plist>\n"

private struct TestableDateFormatterStaticCoder: DateFormatterStaticCoder {
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM:dd:yy HH:mm:ss"

        return dateFormatter
    }()
}

private struct TestableDateFormatterModel: Codable, Equatable {
    @DateFormatterCoding<TestableDateFormatterStaticCoder>
    var dateValue: Date
}

private let testableDateFormatterExpectedModel = TestableDateFormatterModel(dateValue: TestableDateFormatterStaticCoder.dateFormatter.date(from: "11:08:23 06:08:09")!)

private let testableDateFormatterJSON = """
    {
        "dateValue" : "11:08:23 06:08:09"
    }
    """

private let testableDateFormatterExpectedJSON = "{\"dateValue\":\"11:08:23 06:08:09\"}"

private let testableDateFormatterXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <string>11:08:23 06:08:09</string>
        </dict>
    </plist>
    """

private let testableDateFormatterExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<string>11:08:23 06:08:09</string>\n</dict>\n</plist>\n"

private struct TestableISO8601DateFormatterStaticCoder: ISO8601DateFormatterStaticCoder {
    static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate]

        return formatter
    }()
}

private struct TestableISO8601DateFormatterModel: Codable, Equatable {
    @ISO8601DateFormatterCoding<TestableISO8601DateFormatterStaticCoder>
    var dateValue: Date
}

private let testableISO8601DateFormatterExpectedModel = TestableISO8601DateFormatterModel(dateValue: TestableISO8601DateFormatterStaticCoder.iso8601DateFormatter.date(from: "2023-11-08T06:08:09Z")!)

private let testableISO8601DateFormatterJSON = """
    {
        "dateValue": "2023-11-08T06:08:09Z"
    }
    """

private let testableISO8601DateFormatterExpectedJSON = "{\"dateValue\":\"2023-11-08T06:08:09Z\"}"

private let testableISO8601DateFormatterXML = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
            <key>dateValue</key>
            <string>2023-11-08T06:08:09Z</string>
        </dict>
    </plist>
    """

private let testableISO8601DateFormatterExpectedXML = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>dateValue</key>\n\t<string>2023-11-08T06:08:09Z</string>\n</dict>\n</plist>\n"
