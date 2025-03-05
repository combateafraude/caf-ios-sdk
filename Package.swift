// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CafSDKiOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CafSDKiOS",
            targets: ["CafSDKiOSSDK"]
        ),
        .library(
            name: "DocumentDetector",
            targets: ["DocumentDetectorSDK"]
        ),
        .library(
            name: "CafFaceLiveness",
            targets: ["CafFaceLivenessSDK"]
        ),
        .library(
            name: "FaceTec2DProvider",
            targets: ["FaceTec2DProviderSDK"]
        ),
        .library(
            name: "IproovProvider",
            targets: ["IproovProviderSDK"]
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
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DocumentDetector",
            path: "Frameworks/DocumentDetector.xcframework"
        ),
        .binaryTarget(
            name: "CafFaceLiveness",
            path: "Frameworks/CafFaceLiveness.xcframework"
        ),
        .binaryTarget(
            name: "IproovProvider",
            path: "Frameworks/IproovProvider.xcframework"
        ),
        .binaryTarget(
            name: "FaceTec2DProvider",
            path: "Frameworks/FaceTec2DProvider.xcframework"
        ),

        .target(
            name: "CafSDKiOSSDK",
            dependencies: ["Core"],
            path: "Sources/CafSDKiOS"
        ),
        
        .target(
            name: "Core",
            dependencies: ["DocumentDetector", "CafFaceLiveness"],
            path: "Sources/Core"
        ),
        
        .target(
            name: "DocumentDetectorSDK",
            dependencies: [
                "DocumentDetector",
                .product(name: "TensorFlowLiteC", package: "TensorFlowLiteC"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/DocumentDetector"
        ),
        
        .target(
            name: "CafFaceLivenessCoreSDK",
            dependencies: [
                "CafFaceLiveness",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/CafFaceLivenessCore"
        ),
        
        .target(
            name: "IproovProviderSDK",
            dependencies: [
                "IproovProvider",
                .product(name: "iProov", package: "ios"),
                "CafFaceLivenessCoreSDK"
            ],
            path: "Sources/IproovProvider"
        ),
        
        .target(
            name: "FaceTec2DProviderSDK",
            dependencies: [
                "FaceTec2DProvider",
                "CafFaceLivenessCoreSDK"
            ],
            path: "Sources/FaceTec2DProvider"
        ),
        
        .target(
            name: "CafFaceLivenessSDK",
            dependencies: ["CafFaceLivenessCoreSDK", "IproovProvider", "FaceTec2DProvider"],
            path: "Sources/CafFaceLiveness"
        )
    ]
)