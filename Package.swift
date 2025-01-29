// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CafSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Main CafSDK product
        .library(
            name: "CafSDK",
            targets: ["CafSDKCore"]
        ),
        .library(
            name: "DocumentDetector",
            targets: ["DocumentDetector"]
        ),
        .library(
            name: "CafFaceLiveness",
            targets: ["CafFaceLivenessCore"]
        ),
        .library(
            name: "IproovProvider",
            targets: ["IproovProvider"]
        ),
        .library(
            name: "FaceTec2DProvider",
            targets: ["FaceTec2DProvider"]
        )
    ],
    dependencies: [
        // External dependencies
        .package(
            url: "https://github.com/iProov/ios.git",
            .exact("12.2.1")
        ),        
        .package(
            url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios.git",
            .exact("2.6.0")
        ),
        .package(
            url: "https://github.com/combateafraude/CafSolutions.git",
            .exact("1.0.2")
        )
    ],
    targets: [
        .target(
            name: "CafSDKCore",
            dependencies: [
                "DocumentDetector",
                "CafFaceLivenessCore"
            ],
            path: "Sources/Core"
        ),
        .binaryTarget(
            name: "DocumentDetector",
            path: "Frameworks/DocumentDetector.xcframework"
        ),
        .target(
            name: "CafFaceLivenessCore",
            dependencies: [
                "IproovProvider",
                "FaceTec2DProvider",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios")
            ],
            path: "Sources/CafFaceLiveness"
        ),

        .binaryTarget(
            name: "IproovProvider",
            path: "Frameworks/IproovProvider.xcframework"
        ),
        .binaryTarget(
            name: "FaceTec2DProvider",
            path: "Frameworks/FaceTec2DProvider.xcframework"
        )
    ]
)
