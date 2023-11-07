//
//  DateCodingTests.swift
//  SBCodableWrappersTests
//
//  Created by Max on 2023/11/8.
//

@testable import SBCodableWrappers
import XCTest

final class DateCodingTests: XCTestCase, DecodingTestSpec, EncodingTestSpec {
    func testSecondsSince1970DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateJSON.data(using: .utf8)!))

        let secondsSince1970DateModel = try? DateCodingTests.jsonDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(secondsSince1970DateModel)
        XCTAssertEqual(secondsSince1970DateModel, secondsSince1970DateExpectModel)
    }

    func testSecondsSince1970DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(secondsSince1970DateExpectModel))

        let secondsSince1970DateExpectData = try? DateCodingTests.jsonEncoder.encode(secondsSince1970DateExpectModel)
        let secondsSince1970DateExpectString = secondsSince1970DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(secondsSince1970DateExpectData)
        XCTAssertNotNil(secondsSince1970DateExpectString)
    }

    func testSecondsSince1970DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateXML.data(using: .utf8)!))

        let secondsSince1970DateModel = try? DateCodingTests.plistDecoder.decode(SecondsSince1970DateModel.self, from: secondsSince1970DateXML.data(using: .utf8)!)
        XCTAssertNotNil(secondsSince1970DateModel)
        XCTAssertEqual(secondsSince1970DateModel, secondsSince1970DateExpectModel)
    }

    func testSecondsSince1970DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(secondsSince1970DateExpectModel))

        let secondsSince1970DateExpectData = try? DateCodingTests.plistEncoder.encode(secondsSince1970DateExpectModel)
        let secondsSince1970DateExpectString = secondsSince1970DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(secondsSince1970DateExpectData)
        XCTAssertNotNil(secondsSince1970DateExpectString)
    }
    
    func testMillisecondsSince1970DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateJSON.data(using: .utf8)!))

        let millisecondsSince1970DateModel = try? DateCodingTests.jsonDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(millisecondsSince1970DateModel)
        XCTAssertEqual(millisecondsSince1970DateModel, millisecondsSince1970DateExpectModel)
    }

    func testMillisecondsSince1970DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(millisecondsSince1970DateExpectModel))

        let millisecondsSince1970DateExpectData = try? DateCodingTests.jsonEncoder.encode(millisecondsSince1970DateExpectModel)
        let millisecondsSince1970DateExpectString = millisecondsSince1970DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(millisecondsSince1970DateExpectData)
        XCTAssertNotNil(millisecondsSince1970DateExpectString)
    }

    func testMillisecondsSince1970DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateXML.data(using: .utf8)!))

        let millisecondsSince1970DateModel = try? DateCodingTests.plistDecoder.decode(MillisecondsSince1970DateModel.self, from: millisecondsSince1970DateXML.data(using: .utf8)!)
        XCTAssertNotNil(millisecondsSince1970DateModel)
        XCTAssertEqual(millisecondsSince1970DateModel, millisecondsSince1970DateExpectModel)
    }

    func testMillisecondsSince1970DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(millisecondsSince1970DateExpectModel))

        let millisecondsSince1970DateExpectData = try? DateCodingTests.plistEncoder.encode(millisecondsSince1970DateExpectModel)
        let millisecondsSince1970DateExpectString = millisecondsSince1970DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(millisecondsSince1970DateExpectData)
        XCTAssertNotNil(millisecondsSince1970DateExpectString)
    }
    
    func testISO8601DateDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(ISO8601DateModel.self, from: iso8601DateJSON.data(using: .utf8)!))

        let iso8601DateModel = try? DateCodingTests.jsonDecoder.decode(ISO8601DateModel.self, from: iso8601DateJSON.data(using: .utf8)!)
        XCTAssertNotNil(iso8601DateModel)
        XCTAssertEqual(iso8601DateModel, iso8601DateExpectModel)
    }

    func testISO8601DateEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(iso8601DateExpectModel))

        let iso8601DateExpectData = try? DateCodingTests.jsonEncoder.encode(iso8601DateExpectModel)
        let iso8601DateExpectString = iso8601DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(iso8601DateExpectData)
        XCTAssertNotNil(iso8601DateExpectString)
    }

    func testISO8601DateDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(ISO8601DateModel.self, from: iso8601DateXML.data(using: .utf8)!))

        let iso8601DateModel = try? DateCodingTests.plistDecoder.decode(ISO8601DateModel.self, from: iso8601DateXML.data(using: .utf8)!)
        XCTAssertNotNil(iso8601DateModel)
        XCTAssertEqual(iso8601DateModel, iso8601DateExpectModel)
    }

    func testISO8601DateEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(iso8601DateExpectModel))

        let iso8601DateExpectData = try? DateCodingTests.plistEncoder.encode(iso8601DateExpectModel)
        let iso8601DateExpectString = iso8601DateExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(iso8601DateExpectData)
        XCTAssertNotNil(iso8601DateExpectString)
    }
    
    func testTestableDateFormatterDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterJSON.data(using: .utf8)!))

        let testableDateFormatterModel = try? DateCodingTests.jsonDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableDateFormatterModel)
        XCTAssertEqual(testableDateFormatterModel, testableDateFormatterExpectModel)
    }

    func testTestableDateFormatterEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(testableDateFormatterExpectModel))

        let testableDateFormatterExpectData = try? DateCodingTests.jsonEncoder.encode(testableDateFormatterExpectModel)
        let testableDateFormatterExpectString = testableDateFormatterExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableDateFormatterExpectData)
        XCTAssertNotNil(testableDateFormatterExpectString)
    }

    func testTestableDateFormatterDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterXML.data(using: .utf8)!))

        let testableDateFormatterModel = try? DateCodingTests.plistDecoder.decode(TestableDateFormatterModel.self, from: testableDateFormatterXML.data(using: .utf8)!)
        XCTAssertNotNil(testableDateFormatterModel)
        XCTAssertEqual(testableDateFormatterModel, testableDateFormatterExpectModel)
    }

    func testTestableDateFormatterEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(testableDateFormatterExpectModel))

        let testableDateFormatterExpectData = try? DateCodingTests.plistEncoder.encode(testableDateFormatterExpectModel)
        let testableDateFormatterExpectString = testableDateFormatterExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableDateFormatterExpectData)
        XCTAssertNotNil(testableDateFormatterExpectString)
    }
    
    func testTestableISO8601DateFormatterDecoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterJSON.data(using: .utf8)!))

        let testableISO8601DateFormatterModel = try? DateCodingTests.jsonDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterJSON.data(using: .utf8)!)
        XCTAssertNotNil(testableISO8601DateFormatterModel)
        XCTAssertEqual(testableISO8601DateFormatterModel, testableISO8601DateFormatterExpectModel)
    }

    func testTestableISO8601DateFormatterEncoderUsingJSON() {
        XCTAssertNoThrow(try DateCodingTests.jsonEncoder.encode(testableISO8601DateFormatterExpectModel))

        let testableISO8601DateFormatterExpectData = try? DateCodingTests.jsonEncoder.encode(testableISO8601DateFormatterExpectModel)
        let testableISO8601DateFormatterExpectString = testableISO8601DateFormatterExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableISO8601DateFormatterExpectData)
        XCTAssertNotNil(testableISO8601DateFormatterExpectString)
    }

    func testTestableISO8601DateFormatterDecoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterXML.data(using: .utf8)!))

        let testableISO8601DateFormatterModel = try? DateCodingTests.plistDecoder.decode(TestableISO8601DateFormatterModel.self, from: testableISO8601DateFormatterXML.data(using: .utf8)!)
        XCTAssertNotNil(testableISO8601DateFormatterModel)
        XCTAssertEqual(testableISO8601DateFormatterModel, testableISO8601DateFormatterExpectModel)
    }

    func testTestableISO8601DateFormatterEncoderUsingXML() {
        XCTAssertNoThrow(try DateCodingTests.plistEncoder.encode(testableISO8601DateFormatterExpectModel))

        let testableISO8601DateFormatterExpectData = try? DateCodingTests.plistEncoder.encode(testableISO8601DateFormatterExpectModel)
        let testableISO8601DateFormatterExpectString = testableISO8601DateFormatterExpectData.map { String(data: $0, encoding: .utf8)! }
        XCTAssertNotNil(testableISO8601DateFormatterExpectData)
        XCTAssertNotNil(testableISO8601DateFormatterExpectString)
    }
}

private struct SecondsSince1970DateModel: Codable, Equatable {
    @SecondsSince1970DateCoding
    var dateValue: Date
}

private let secondsSince1970DateExpectModel = SecondsSince1970DateModel(dateValue: Date(timeIntervalSince1970: 1699394889.0))

private let secondsSince1970DateJSON = """
{
    "dateValue": 1699394889.0
}
"""

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

private struct MillisecondsSince1970DateModel: Codable, Equatable {
    @MillisecondsSince1970DateCoding
    var dateValue: Date
}

private let millisecondsSince1970DateExpectModel = MillisecondsSince1970DateModel(dateValue: Date(timeIntervalSince1970: 1699394889.0))

private let millisecondsSince1970DateJSON = """
{
    "dateValue": 1699394889000.0
}
"""

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

private struct ISO8601DateModel: Codable, Equatable {
    @ISO8601DateCoding
    var dateValue: Date
}

private let iso8601DateExpectModel = ISO8601DateModel(dateValue: ISO8601DateFormatter().date(from: "2023-11-08T06:08:09Z")!)

private let iso8601DateJSON = """
{
    "dateValue": "2023-11-08T06:08:09Z"
}
"""

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

private let testableDateFormatterExpectModel = TestableDateFormatterModel(dateValue: TestableDateFormatterStaticCoder.dateFormatter.date(from: "11:08:23 06:08:09")!)

private let testableDateFormatterJSON = """
{
    "dateValue" : "11:08:23 06:08:09"
}
"""

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

private let testableISO8601DateFormatterExpectModel = TestableISO8601DateFormatterModel(dateValue: TestableISO8601DateFormatterStaticCoder.iso8601DateFormatter.date(from: "2023-11-08T06:08:09Z")!)

private let testableISO8601DateFormatterJSON = """
{
    "dateValue": "2023-11-08T06:08:09Z"
}
"""

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
