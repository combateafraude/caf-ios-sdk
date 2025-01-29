// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CafSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
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
        .package(
            url: "https://github.com/iProov/ios.git",
            .exact("12.2.1")
        ),        
        .package(
            url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios.git",
            .exact("2.6.0")
        ),
        .package(
            url: "https://github.com/combateafraude/TensorFlowLiteC.git",
            .exact("2.14.1")
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
                "DocumentDetectorCore",
                "CafFaceLivenessCore"
            ],
            path: "Sources/Core"
        ),
        .target(
            name: "DocumentDetectorCore",
            dependencies: [
                "DocumentDetector",
                .product(name: "TensorFlowLiteC", package: "TensorFlowLiteC"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/DocumentDetector"
        ),
        .binaryTarget(
            name: "DocumentDetector",
            path: "Frameworks/DocumentDetector.xcframework"
        ),
        .target(
            name: "CafFaceLivenessCore",
            dependencies: [
                "IproovProvideCore",
                "FaceTec2DProvider",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/CafFaceLiveness"
        ),
        .target(
            name: "IproovProvideCore",
            dependencies: [
                "DocumentDetector",
                .product(name: "iProov", package: "ios")
            ],
            path: "Sources/IproovProvider"
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