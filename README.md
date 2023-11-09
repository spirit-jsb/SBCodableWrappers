# SBCodableWrappers

<p align="center">
    <a href="https://cocoapods.org/pods/SBCodableWrappers"><img src="https://img.shields.io/badge/Cocoapods-supported-brightgreen"></a> 
    <a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-supported-brightgreen"></a> 
    <a href="https://github.com/spirit-jsb/SBCodableWrappers"><img src="https://img.shields.io/github/v/release/spirit-jsb/SBCodableWrappers?display_name=tag"/></a>
    <a href="https://github.com/spirit-jsb/SBCodableWrappers"><img src="https://img.shields.io/cocoapods/p/ios"/></a>
    <a href="https://github.com/spirit-jsb/SBCodableWrappers/blob/master/LICENSE"><img src="https://img.shields.io/github/license/spirit-jsb/SBCodableWrappers"/></a>
</p>

## API
### Wrappers
* @BoolAsIntDecoding
* @BoolAsIntEncoding
* @BoolAsIntCoding
* @BoolAsStringDecoding
* @BoolAsStringEncoding
* @BoolAsStringCoding
* @Base64Decoding
* @Base64Encoding
* @Base64Coding
* @SecondsSince1970DateDecoding
* @SecondsSince1970DateEncoding
* @SecondsSince1970DateCoding
* @MillisecondsSince1970DateDecoding
* @MillisecondsSince1970DateEncoding
* @MillisecondsSince1970DateCoding
* @ISO8601DateDecoding
* @ISO8601DateEncoding
* @ISO8601DateCoding
* @NonConformingBoolDecoding<NonConformingBoolValueProvider>
* @NonConformingBoolEncoding<NonConformingBoolValueProvider>
* @NonConformingBoolCoding<NonConformingBoolValueProvider>
* @DateFormatterDecoding<DateFormatterStaticDecoder>
* @DateFormatterEncoding<DateFormatterStaticEncoder>
* @DateFormatterCoding<DateFormatterStaticCoder>
* @ISO8601DateFormatterDecoding<ISO8601DateFormatterStaticDecoder>
* @ISO8601DateFormatterEncoding<ISO8601DateFormatterStaticEncoder>
* @ISO8601DateFormatterCoding<ISO8601DateFormatterStaticCoder> 
* @LossyArrayDecoding
* @LossyDictionaryDecoding
* @LossySetDecoding
* @NonConformingFloatDecoding<NonConformingDecimalValueProvider>
* @NonConformingFloatEncoding<NonConformingDecimalValueProvider>
* @NonConformingFloatCoding<NonConformingDecimalValueProvider>
* @NonConformingDoubleDecoding<NonConformingDecimalValueProvider>
* @NonConformingDoubleEncoding<NonConformingDecimalValueProvider>
* @NonConformingDoubleCoding<NonConformingDecimalValueProvider>
* @NullEncoding
* @StaticDecoding<StaticDecoder>
* @StaticEncoding<StaticEncoder>
* @StaticCoding<StaticCoder>
* @OptionalDecoding<StaticDecodingWrapper>
* @OptionalEncoding<StaticEncodingWrapper>
* @OptionalCoding<StaticCodingWrapper>
* @OmittedDecoding
* @OmittedEncoding
* @OmittedCoding
* @Immutable

## Non-Conforming Bool Coding
```swift
{
    "boolValue": 1
}

struct SBModel: Codable {
    @BoolAsIntCoding
    var boolValue: Bool
}
```

```swift
{
    "boolValue": "true"
}

struct SBModel: Codable {
    @BoolAsStringCoding
    var boolValue: Bool
}
```

```swift
struct SBNonConformingBoolValueProvider: NonConformingBoolValueProvider {
    static func bool(from value: Int) -> Bool? {
        return value == 1 ? true : value == -1 ? false : nil
    }

    static func value(from bool: Bool) -> Int {
        return bool ? 1 : -1
    }
}

{
    "boolValue": -1
}

struct SBModel: Codable {
    @NonConformingBoolCoding<SBNonConformingBoolValueProvider>
    var boolValue: Bool
}
```

## Base64 Coding
```swift
{
    "dataValue": "SGVsbG8gV29ybGQh"
}

struct SBModel: Codable {
    @Base64Coding
    var dataValue: Data
}
```

## Date Coding
```swift
{
    "dateValue": 1699394889.0
}

struct SBModel: Codable {
    @SecondsSince1970DateCoding
    var dateValue: Date
}
```

```swift
{
    "dateValue": 1699394889000.0
}

struct SBModel: Codable {
    @MillisecondsSince1970DateCoding
    var dateValue: Date
}
```

```swift
{
    "dateValue": "2023-11-08T06:08:09Z"
}

struct SBModel: Codable {
    @ISO8601DateCoding
    var dateValue: Date
}
```

```swift
struct SBDateFormatterStaticCoder: DateFormatterStaticCoder {
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM:dd:yy HH:mm:ss"

        return dateFormatter
    }()
}

{
    "dateValue" : "11:08:23 06:08:09"
}

struct SBModel: Codable {
    @DateFormatterCoding<SBDateFormatterStaticCoder>
    var dateValue: Date
}
```

```swift
struct SBISO8601DateFormatterStaticCoder: ISO8601DateFormatterStaticCoder {
    static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate]

        return formatter
    }()
}

{
    "dateValue": "2023-11-08T06:08:09Z"
}

struct SBModel: Codable {
    @ISO8601DateFormatterCoding<SBISO8601DateFormatterStaticCoder>
    var dateValue: Date
}
```

## Lossy Collection Decoding
```swift
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

struct SBModel: Codable {
    @LossyArrayDecoding
    var arrayValue: [String]

    @LossyDictionaryDecoding
    var dictionaryValue: [String: String]

    @LossySetDecoding
    var setValue: Set<String>
}
```

## Non-Conforming Decimal Coding
```swift
struct SBNonConformingDecimalValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "0"
}

{
    "positive": "100",
    "negative": "-100",
    "nan": "0",
    "regular": 5.0
}

struct SBModel: Codable {
    @NonConformingFloatCoding<SBNonConformingDecimalValueProvider>
    var positive: Float
    @NonConformingFloatCoding<SBNonConformingDecimalValueProvider>
    var negative: Float
    @NonConformingFloatCoding<SBNonConformingDecimalValueProvider>
    var nan: Float
    @NonConformingFloatCoding<SBNonConformingDecimalValueProvider>
    var regular: Float
}
```

```swift
struct SBNonConformingDecimalValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "0"
}

{
    "positive": "100",
    "negative": "-100",
    "nan": "0",
    "regular": 5.0
}

struct SBModel: Codable {
    @NonConformingDoubleCoding<SBNonConformingDecimalValueProvider>
    var positive: Double
    @NonConformingDoubleCoding<SBNonConformingDecimalValueProvider>
    var negative: Double
    @NonConformingDoubleCoding<SBNonConformingDecimalValueProvider>
    var nan: Double
    @NonConformingDoubleCoding<SBNonConformingDecimalValueProvider>
    var regular: Double
}
```

## Null Encoding
```swift
struct SBModel: Codable {
    @NullEncoding
    var stringValue: String?
}

{
    "stringValue": null
}
```

## Optional Coding
```swift
{
    "dateValue": null
}

struct SBModel: Codable {
    @OptionalCoding<ISO8601DateCoding>
    var dateValue: Date?
}
```

## Omitted Coding
Ignore property when decoding or encoding

## Immutable
```swift
struct SBModel: Codable {
    @Immutable
    @SecondsSince1970DateCoding
    var createTime: Date

    @SecondsSince1970DateCoding
    var updateTime: Date

    mutating func update() {
        self.createTime = Date()    // Error - Cannot assign to property: 'createTime' is a get-only property
        self.updateTime = Date()    // Work!
    }
}
```

## 限制条件
- iOS 11.0+
- Swift 5.0+    

## 安装
### **Cocoapods**
```
pod 'SBCodableWrappers', '~> 1.0'
```
### **Swift Package Manager**
```
https://github.com/spirit-jsb/SBCodableWrappers.git
```

## 作者
spirit-jsb, sibo_jian_29903549@163.com

## 许可文件
`SBCodableWrappers` 可在 `MIT` 许可下使用，更多详情请参阅许可文件