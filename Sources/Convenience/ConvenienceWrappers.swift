//
//  ConvenienceWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public typealias BoolAsIntDecoding = StaticDecoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>
public typealias BoolAsIntEncoding = StaticEncoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>
public typealias BoolAsIntCoding = StaticCoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>

public typealias BoolAsStringDecoding = StaticDecoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>
public typealias BoolAsStringEncoding = StaticEncoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>
public typealias BoolAsStringCoding = StaticCoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>

public typealias Base64Decoding = StaticDecoding<Base64DataStaticCoder>
public typealias Base64Encoding = StaticEncoding<Base64DataStaticCoder>
public typealias Base64Coding = StaticCoding<Base64DataStaticCoder>

public typealias SecondsSince1970DateDecoding = StaticDecoding<SecondsSince1970DateStaticCoder>
public typealias SecondsSince1970DateEncoding = StaticEncoding<SecondsSince1970DateStaticCoder>
public typealias SecondsSince1970DateCoding = StaticCoding<SecondsSince1970DateStaticCoder>

public typealias MillisecondsSince1970DateDecoding = StaticDecoding<MillisecondsSince1970DateStaticCoder>
public typealias MillisecondsSince1970DateEncoding = StaticEncoding<MillisecondsSince1970DateStaticCoder>
public typealias MillisecondsSince1970DateCoding = StaticCoding<MillisecondsSince1970DateStaticCoder>

public typealias ISO8601DateDecoding = StaticDecoding<ISO8601DateStaticCoder>
public typealias ISO8601DateEncoding = StaticEncoding<ISO8601DateStaticCoder>
public typealias ISO8601DateCoding = StaticCoding<ISO8601DateStaticCoder>

public typealias NonConformingBoolDecoding<ValueProvider: NonConformingBoolValueProvider> = StaticDecoding<NonConformingBoolStaticCoder<ValueProvider>>
public typealias NonConformingBoolEncoding<ValueProvider: NonConformingBoolValueProvider> = StaticEncoding<NonConformingBoolStaticCoder<ValueProvider>>
public typealias NonConformingBoolCoding<ValueProvider: NonConformingBoolValueProvider> = StaticCoding<NonConformingBoolStaticCoder<ValueProvider>>

public typealias DateFormatterDecoding<DateFormatterDecoder: DateFormatterStaticDecoder> = StaticDecoding<DateFormatterDecoder>
public typealias DateFormatterEncoding<DateFormatterEncoder: DateFormatterStaticEncoder> = StaticEncoding<DateFormatterEncoder>
public typealias DateFormatterCoding<DateFormatterCoder: DateFormatterStaticCoder> = StaticCoding<DateFormatterCoder>

public typealias ISO8601DateFormatterDecoding<ISO8601DateFormatterDecoder: ISO8601DateFormatterStaticDecoder> = StaticDecoding<ISO8601DateFormatterDecoder>
public typealias ISO8601DateFormatterEncoding<ISO8601DateFormatterEncoder: ISO8601DateFormatterStaticEncoder> = StaticEncoding<ISO8601DateFormatterEncoder>
public typealias ISO8601DateFormatterCoding<ISO8601DateFormatterCoder: ISO8601DateFormatterStaticCoder> = StaticCoding<ISO8601DateFormatterCoder>

public typealias LossyArrayDecoding<T: Decodable> = StaticDecoding<ArrayFilterNilStaticDecoder<T>>
public typealias LossyDictionaryDecoding<T: Decodable, Key: Decodable & Hashable> = StaticDecoding<DictionaryFilterNilStaticDecoder<T, Key>>
public typealias LossySetDecoding<T: Decodable & Hashable> = StaticDecoding<SetFilterNilStaticDecoder<T>>

public typealias NonConformingFloatDecoding<ValueProvider: NonConformingDecimalValueProvider> = StaticDecoding<NonConformingFloatStaticCoder<ValueProvider>>
public typealias NonConformingFloatEncoding<ValueProvider: NonConformingDecimalValueProvider> = StaticEncoding<NonConformingFloatStaticCoder<ValueProvider>>
public typealias NonConformingFloatCoding<ValueProvider: NonConformingDecimalValueProvider> = StaticCoding<NonConformingFloatStaticCoder<ValueProvider>>

public typealias NonConformingDoubleDecoding<ValueProvider: NonConformingDecimalValueProvider> = StaticDecoding<NonConformingDoubleStaticCoder<ValueProvider>>
public typealias NonConformingDoubleEncoding<ValueProvider: NonConformingDecimalValueProvider> = StaticEncoding<NonConformingDoubleStaticCoder<ValueProvider>>
public typealias NonConformingDoubleCoding<ValueProvider: NonConformingDecimalValueProvider> = StaticCoding<NonConformingDoubleStaticCoder<ValueProvider>>

#endif
