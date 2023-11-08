//
//  CodingTestSpec.swift
//  SBCodableWrappersTests
//
//  Created by JONO-Jsb on 2023/11/7.
//

import Foundation

protocol CodingTestSpec {}

protocol DecodingTestSpec: CodingTestSpec {
    static var jsonDecoder: JSONDecoder { get }
    static var plistDecoder: PropertyListDecoder { get }
}

protocol EncodingTestSpec: CodingTestSpec {
    static var jsonEncoder: JSONEncoder { get }
    static var plistEncoder: PropertyListEncoder { get }
}

extension CodingTestSpec {
    static var emptyJSON: String {
        "{\n\n}"
    }

    static var emptyXML: String { """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
                <dict/>
        </plist>
        """
    }
}

extension DecodingTestSpec {
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        return decoder
    }

    static var plistDecoder: PropertyListDecoder {
        let decoder = PropertyListDecoder()

        return decoder
    }
}

extension EncodingTestSpec {
    static var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]

        return encoder
    }

    static var plistEncoder: PropertyListEncoder {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        return encoder
    }
}
