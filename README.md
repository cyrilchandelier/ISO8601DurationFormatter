# ISO8601DurationFormatter

A Swift formatter to support the duration part of the ISO8601 standard.

A formatter similar using an API similar to Swift DateFormatter to convert [ISO8601 Duration](https://en.wikipedia.org/wiki/ISO_8601#Durations) strings into their `TimeInterval` equivalent in seconds, and back.

## Installation

After installing, the package is available using the following import:

```
import ISO8601DurationFormatter
```

### Swift Package Manager

To integrate ISO8601DurationFormatter into your Xcode project using SPM, simply add the following line to your Package.swift:

```
.package(url: "https://github.com/cyrilchandelier/ISO8601DurationFormatter", .upToNextMajor(from: "0.0.1"))
```

### CocoaPods

To integrate ISO8601DurationFormatter into your Xcode project using CocoaPods, simply add the following line to your Podfile:

```
pod 'ISO8601DurationFormatter', ~> '0.0.1'
```

## Usage

This formatter allows for convertion between ISO8601 Duration tokens and TimeInterval:

### Converting String to TimeInterval

The duration string in input must be a valid ISO8601 Duration, or an exception will be thrown.

Usage:

```
do {
    let formatter = ISO8601DurationFormatter()
    let decoded = try formatter.duration(from: "PT1M")
    print(decoded) // 60.0
} catch {
    print(String(describing: error))
}
```

Note that decimal values are supported, eg: `P1.5D` or `PT1.123S`.

### Converting TimeInterval to String

Usage:

```
do {
    let formatter = ISO8601DurationFormatter()
    let encoded = try formatter.string(from: 120)
    print(encoded) // PT2M
} catch {
    print(String(describing: error))
}
```

Caveats:

- only positive durations are supported: negative durations will trigger an exception
- empty durations are represented with the following string: `P0D`
