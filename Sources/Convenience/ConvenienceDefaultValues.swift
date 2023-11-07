//
//  ConvenienceDefaultValues.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/7.
//

#if canImport(Foundation)

import Foundation

public struct DefaultBool: FallbackValueProvider {
    public static var defaultValue: Bool {
        false
    }
}

public struct DefaultInt: FallbackValueProvider {
    public static var defaultValue: Int {
        0
    }
}

public struct DefaultDouble: FallbackValueProvider {
    public static var defaultValue: Double {
        0.0
    }
}

public struct DefaultFloat: FallbackValueProvider {
    public static var defaultValue: Float {
        0.0
    }
}

public struct DefaultString: FallbackValueProvider {
    public static var defaultValue: String {
        ""
    }
}

public struct DefaultArray<T>: FallbackValueProvider {
    public static var defaultValue: [T] {
        []
    }
}

public struct DefaultDictionary<T, Key: Hashable>: FallbackValueProvider {
    public static var defaultValue: [Key: T] {
        [:]
    }
}

public struct DefaultSet<T: Hashable>: FallbackValueProvider {
    public static var defaultValue: Set<T> {
        []
    }
}

#endif
