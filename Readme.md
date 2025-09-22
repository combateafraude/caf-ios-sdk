![Caf](https://github.com/combateafraude/iOS/raw/main/images/caf_icon.png)

# CafSDK for iOS

## Overview

**CafSDK** is a comprehensive iOS SDK that provides modular solutions for **document detection** and **face liveness validation**. It includes the following components:

- **[DocumentDetector](https://github.com/combateafraude/DocumentDetector)**: A framework for secure document detection, powered by TensorFlow Lite.
- **[CafFaceLiveness]**: A modular framework for face liveness validation, supporting **iProov** and **FaceTec 2D** as independent or combined providers.

This SDK is designed to be flexible, allowing developers to integrate only the components they need.

Official [Documentation](https://docs.caf.io/caf-sdk/ios/getting-started-with-the-sdk)

---

#### Requirements

| Deployment Info | Version       |
| --------------- | ------------- |
| iOS Target      | 13.0+         |
| Xcode           | 16.2+         |
| Swift           | 5.10+         |

---

## Installation

### Swift Package Manager (SPM)

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/combateafraude/caf-ios-sdk.git", from: "5.5.0")
]
```

Then, add the desired targets to your app:

```swift
.target(
    name: "YourApp",
    dependencies: [
        .product(name: "CafSDK", package: "CafSDKiOS"), // Full SDK
        .product(name: "DocumentDetector", package: "CafSDKiOS"), // Only DocumentDetector
        .product(name: "CafFaceLiveness", package: "CafSDKiOS"), // CafFaceLiveness with all modules
        .product(name: "IproovProvider", package: "CafSDKiOS"), // Optional iProov provider
        .product(name: "FaceTec2DProvider", package: "CafSDKiOS"), // Optional FaceTec 2D provider
    ]
)
```

### CocoaPods

Add the following to your Podfile:

```ruby
# Full SDK
pod 'CafSDKiOS'

# Only DocumentDetector
pod 'CafSDKiOS/DocumentDetector'

# Only CafFaceLiveness
pod 'CafSDKiOS/CafFaceLiveness'

# Optional iProov provider
pod 'CafSDKiOS/IproovProvider'

# Optional FaceTec 2D provider
pod 'CafSDKiOS/FaceTec2DProvider'
```

Then, run pod install.

---


## Usage

To import and use **DocumentDetector or CafFaceliveness** in your app, add the following import statement at the top of your Swift files:

```swift
import CafSDK
```

## Privacy Policy and Terms & Conditions of Use

When using our SDKs, please make sure that you agree with our [Privacy Policy](https://en.caf.io/politicas/politicas-de-privacidade) and our [Terms and Conditions of Use](https://en.caf.io/politicas/termos-e-condicoes-de-uso).
