// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CafSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CafSDK",
            targets: ["CafSDK"]
        ),
        .library(
            name: "DocumentDetector",
            targets: ["DocumentDetector"]
        ),
        .library(
            name: "CafFaceLiveness",
            targets: ["CafFaceLiveness"]
        ),
        .library(
            name: "FaceTec2DProvider",
            targets: ["FaceTec2DProvider"]
        ),
        .library(
            name: "IproovProvider",
            targets: ["IproovProvider"]
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
            name: "DocumentDetectorBinary",
            path: "Frameworks/DocumentDetector.xcframework"
        ),
        .binaryTarget(
            name: "CafFaceLivenessCoreBinary",
            path: "Frameworks/CafFaceLiveness.xcframework"
        ),
        .binaryTarget(
            name: "IproovProviderBinary",
            path: "Frameworks/IproovProvider.xcframework"
        ),
        .binaryTarget(
            name: "FaceTec2DProviderBinary",
            path: "Frameworks/FaceTec2DProvider.xcframework"
        ),

        .target(
            name: "CafSDK",
            dependencies: ["Core"],
            path: "Sources/CafSDK"
        ),
        
        .target(
            name: "Core",
            dependencies: ["DocumentDetector", "CafFaceLiveness"],
            path: "Sources/Core"
        ),
        
        .target(
            name: "DocumentDetector",
            dependencies: [
                "DocumentDetectorBinary",
                .product(name: "TensorFlowLiteC", package: "TensorFlowLiteC"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/DocumentDetector"
        ),
        
        .target(
            name: "CafFaceLivenessCore",
            dependencies: [
                "CafFaceLivenessCoreBinary",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios"),
                .product(name: "CafSolutions", package: "CafSolutions")
            ],
            path: "Sources/CafFaceLivenessCore"
        ),
        
        .target(
            name: "IproovProvider",
            dependencies: [
                "IproovProviderBinary",
                .product(name: "iProov", package: "ios"),
                "CafFaceLivenessCore"
            ],
            path: "Sources/IproovProvider"
        ),
        
        .target(
            name: "FaceTec2DProvider",
            dependencies: [
                "FaceTec2DProviderBinary",
                "CafFaceLivenessCore"
            ],
            path: "Sources/FaceTec2DProvider"
        ),
        
        .target(
            name: "CafFaceLiveness",
            dependencies: ["CafFaceLivenessCore", "IproovProvider", "FaceTec2DProvider"],
            path: "Sources/CafFaceLiveness"
        )
    ]
)