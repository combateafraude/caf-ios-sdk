![Caf](https://github.com/combateafraude/iOS/raw/main/images/caf_icon.png)

# CafSDK for iOS

## Overview

**CafSDK** is a comprehensive iOS SDK that provides modular solutions for **document detection** and **face liveness validation**. It includes the following components:

- **[DocumentDetector](https://github.com/combateafraude/DocumentDetector)**: A framework for secure document detection, powered by TensorFlow Lite.
- **[CafFaceLiveness]**: A modular framework for face liveness validation, supporting **iProov** and **FaceTec 2D** as independent or combined providers.
- **[CafFaceLivenessLite]**: Lightweight face liveness validation using iProov only, with a smaller footprint.
- **[SmartCapture]**: Optional document capture and upload flow (camera auto-capture, gallery and PDF upload). Opt-in: it is not included in the default `CafSDK` product/subspec.

This SDK is designed to be flexible, allowing developers to integrate only the components they need.

Official [Documentation](https://docs.caf.io/caf-sdk/ios/getting-started-with-the-sdk)

---

#### Requirements

| Deployment Info | Version       |
| --------------- | ------------- |
| iOS Target      | 15.0+         |
| Xcode           | 26.0+         |
| Swift           | 6.3+         |

---

## Installation

### Swift Package Manager (SPM)

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/combateafraude/caf-ios-sdk.git", from: "7.0.1")
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
        .product(name: "CafFaceLivenessLite", package: "CafSDKiOS"), // Lightweight iProov-only
        .product(name: "SmartCapture", package: "CafSDKiOS"), // Optional SmartCapture document flow
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

# Only CafFaceLivenessLite (iProov-only)
pod 'CafSDKiOS/CafFaceLivenessLite'

# Optional iProov provider
pod 'CafSDKiOS/IproovProvider'

# Optional FaceTec 2D provider
pod 'CafSDKiOS/FaceTec2DProvider'

# Optional SmartCapture document flow
pod 'CafSDKiOS/SmartCapture'
```

Then, run pod install.

---


## Usage

To import and use **DocumentDetector or CafFaceliveness** in your app, add the following import statement at the top of your Swift files:

```swift
import CafSDK
```

SmartCapture is also used through `import CafSDK` (`CerttaSmartCapture`); do not import the `SmartCapture` module directly. If the SmartCapture product/subspec is not installed, starting it returns an initialization error instead of crashing. The flow uses the camera, so the host app must declare `NSCameraUsageDescription`.

For apps integrating only **CafFaceLivenessLite**, import:

```swift
import CafFaceLivenessLite
```

## Privacy Policy and Terms & Conditions of Use

When using our SDKs, please make sure that you agree with our [Privacy Policy](https://en.caf.io/politicas/politicas-de-privacidade) and our [Terms and Conditions of Use](https://en.caf.io/politicas/termos-e-condicoes-de-uso).
