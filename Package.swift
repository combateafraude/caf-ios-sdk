// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CafSDKiOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Core", targets: ["CafSDKTarget"]),
        .library(name: "CafSDK", targets: ["DocumentDetectorTarget", "CafFaceLivenessTarget"]),
        .library(name: "DocumentDetector", targets: ["DocumentDetectorTarget"]),
        .library(name: "CafFaceLiveness", targets: ["CafFaceLivenessTarget"]),
        .library(name: "IproovProvider", targets: ["IproovProviderTarget"]),
        .library(name: "FaceTec2DProvider", targets: ["FaceTec2DProviderTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/iProov/ios.git", .exact("12.3.1")),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios.git", .exact("2.7.0")),
        .package(url: "https://github.com/combateafraude/TensorFlowLiteC.git", .exact("2.14.0")),
        .package(url: "https://github.com/combateafraude/CafSolutions.git", .exact("2.0.5"))
    ],
    targets: [
        // Binary Targets (keep original names)
        .binaryTarget(name: "CafSDK", path: "Frameworks/CafSDK.xcframework"),
        .binaryTarget(name: "DocumentDetector", path: "Frameworks/DocumentDetector.xcframework"),
        .binaryTarget(name: "CafFaceLiveness", path: "Frameworks/CafFaceLiveness.xcframework"),
        .binaryTarget(name: "IproovProvider", path: "Frameworks/IproovProvider.xcframework"),
        .binaryTarget(name: "FaceTec2DProvider", path: "Frameworks/FaceTec2DProvider.xcframework"),

        // Main CafSDK target
        .target(
            name: "CafSDKTarget",
            dependencies: ["CafSDK"],
            path: "Sources/CafSDK"
        ),

        // Document Detector
        .target(
            name: "DocumentDetectorTarget",
            dependencies: [
                "CafSDKTarget",
                "DocumentDetector",
                .product(name: "TensorFlowLiteC", package: "TensorFlowLiteC"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/DocumentDetector"
        ),

        // CafFaceLiveness Core
        .target(
            name: "CafFaceLivenessCoreTarget",
            dependencies: [
                "CafSDKTarget",
                "CafFaceLiveness",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/CafFaceLivenessCore"
        ),

        // Iproov Provider
        .target(
            name: "IproovProviderTarget",
            dependencies: [
                "IproovProvider",
                .product(name: "iProov", package: "ios"),
                "CafFaceLivenessCoreTarget"
            ],
            path: "Sources/IproovProvider"
        ),

        // FaceTec Provider
        .target(
            name: "FaceTec2DProviderTarget",
            dependencies: [
                "FaceTec2DProvider",
                "CafFaceLivenessCoreTarget"
            ],
            path: "Sources/FaceTec2DProvider"
        ),

        // CafFaceLiveness
        .target(
            name: "CafFaceLivenessTarget",
            dependencies: [
                "CafFaceLivenessCoreTarget",
                "IproovProviderTarget",
                "FaceTec2DProviderTarget"
            ],
            path: "Sources/CafFaceLiveness"
        )
    ]
)