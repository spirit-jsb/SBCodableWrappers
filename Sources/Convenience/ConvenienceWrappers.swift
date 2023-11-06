//
//  ConvenienceWrappers.swift
//  SBCodableWrappers
//
//  Created by JONO-Jsb on 2023/11/6.
//

#if canImport(Foundation)

import Foundation

public typealias NonConformingBoolDecoding<ValueProvider: NonConformingBoolValueProvider> = StaticDecoding<NonConformingBoolStaticCoder<ValueProvider>>
public typealias NonConformingBoolEncoding<ValueProvider: NonConformingBoolValueProvider> = StaticEncoding<NonConformingBoolStaticCoder<ValueProvider>>
public typealias NonConformingBoolCoding<ValueProvider: NonConformingBoolValueProvider> = StaticCoding<NonConformingBoolStaticCoder<ValueProvider>>

public typealias BoolAsIntDecoding = StaticDecoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>
public typealias BoolAsIntEncoding = StaticEncoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>
public typealias BoolAsIntCoding = StaticCoding<NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<Int>>>

public typealias BoolAsStringDecoding = StaticDecoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>
public typealias BoolAsStringEncoding = StaticEncoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>
public typealias BoolAsStringCoding = StaticCoding<NonConformingBoolStaticCoder<BoolAsStringValueProvider>>

public typealias Base64Decoding = StaticDecoding<Base64DataStaticCoder>
public typealias Base64Encoding = StaticEncoding<Base64DataStaticCoder>
public typealias Base64Coding = StaticCoding<Base64DataStaticCoder>

public typealias DateFormatterDecoding<CustomDecoder: DateFormatterStaticDecoder> = StaticDecoding<CustomDecoder>
public typealias DateFormatterEncoding<CustomEncoder: DateFormatterStaticEncoder> = StaticEncoding<CustomEncoder>
public typealias DateFormatterCoding<CustomCoder: DateFormatterStaticCoder> = StaticCoding<CustomCoder>

public typealias ISO8601DateFormatterDecoding<CustomDecoder: ISO8601DateFormatterStaticDecoder> = StaticDecoding<CustomDecoder>
public typealias ISO8601DateFormatterEncoding<CustomEncoder: ISO8601DateFormatterStaticEncoder> = StaticEncoding<CustomEncoder>
public typealias ISO8601DateFormatterCoding<CustomCoder: ISO8601DateFormatterStaticCoder> = StaticCoding<CustomCoder>

public typealias SecondsSince1970DateDecoding = StaticDecoding<SecondsSince1970DateStaticCoder>
public typealias SecondsSince1970DateEncoding = StaticEncoding<SecondsSince1970DateStaticCoder>
public typealias SecondsSince1970DateCoding = StaticCoding<SecondsSince1970DateStaticCoder>

public typealias MillisecondsSince1970DateDecoding = StaticDecoding<MillisecondsSince1970DateStaticCoder>
public typealias MillisecondsSince1970DateEncoding = StaticEncoding<MillisecondsSince1970DateStaticCoder>
public typealias MillisecondsSince1970DateCoding = StaticCoding<MillisecondsSince1970DateStaticCoder>

public typealias ISO8601DateDecoding = StaticDecoding<ISO8601DateStaticCoder>
public typealias ISO8601DateEncoding = StaticEncoding<ISO8601DateStaticCoder>
public typealias ISO8601DateCoding = StaticCoding<ISO8601DateStaticCoder>

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
