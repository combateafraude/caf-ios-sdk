![Caf](https://github.com/combateafraude/iOS/raw/main/images/caf_icon.png)

# CafSDK for iOS

## Overview

**CafSDK** is a comprehensive iOS SDK that provides modular solutions for **document detection** and **face liveness validation**. It includes the following components:

- **[DocumentDetector](https://github.com/combateafraude/DocumentDetector)**: A framework for secure document detection, powered by TensorFlow Lite.
- **[CafFaceLiveness]**: A framework for face liveness validation, with optional providers for **iProov** and **FaceTec 2D**.

This SDK is designed to be flexible, allowing developers to integrate only the components they need.

---

## Current Version

### Stable

| SDK               | Version |
| ----------------- |---------|
| CafSDK            | 1.0.0   |

---

#### Requirements

| Deployment Info | Version       |
| --------------- | ------------- |
| iOS Target      | 13.0+         |
| Xcode           | 15.4+         |
| Swift           | 5.10+         |

---

## Installation

### Swift Package Manager (SPM)

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/combateafraude/caf-ios-sdk.git", from: "1.0.0")
]
```

Then, add the desired targets to your app:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "CafSDK", package: "CafSDK"), // Full SDK
        .product(name: "DocumentDetector", package: "CafSDK"), // Only DocumentDetector
        .product(name: "CafFaceLiveness", package: "CafSDK"), // Only CafFaceLiveness
        .product(name: "IproovProvider", package: "CafSDK"), // Optional iProov provider
        .product(name: "FaceTec2DProvider", package: "CafSDK"), // Optional FaceTec 2D provider
    ]
)
```

### CocoaPods

Add the following to your Podfile:

```ruby
# Full SDK
pod 'CafSDK'

# Only DocumentDetector
pod 'CafSDK/DocumentDetector'

# Only CafFaceLiveness
pod 'CafSDK/CafFaceLiveness'

# Optional iProov provider
pod 'CafSDK/CafFaceLiveness/IproovProvider'

# Optional FaceTec 2D provider
pod 'CafSDK/CafFaceLiveness/FaceTec2DProvider'
```

Then, run pod install.

---


## Usage

To import and use **DocumentDetector or CafFaceliveness** in your app, add the following import statement at the top of your Swift files:

```swift
import DocumentDetector
import CafFaceliveness
```

## Privacy Policy and Terms & Conditions of Use

When using our SDKs, please make sure that you agree with our [Privacy Policy](https://en.caf.io/politicas/politicas-de-privacidade) and our [Terms and Conditions of Use](https://en.caf.io/politicas/termos-e-condicoes-de-uso).