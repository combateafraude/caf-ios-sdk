// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CafSDKiOS",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "CafCore", targets: ["CafSDKTarget"]),
        .library(name: "CafSDK", targets: ["DocumentDetectorTarget", "CafFaceLivenessTarget"]),
        .library(name: "DocumentDetector", targets: ["DocumentDetectorTarget"]),
        .library(name: "CerttaBase", targets: ["CerttaBaseTarget"]),
        .library(name: "CafFaceLiveness", targets: ["CafFaceLivenessTarget"]),
        .library(name: "CafFaceLivenessLite", targets: ["CafFaceLivenessLiteTarget"]),
        .library(name: "IproovProvider", targets: ["IproovProviderTarget"]),
        .library(name: "FaceTec2DProvider", targets: ["FaceTec2DProviderTarget"]),
        .library(name: "FortfaceProvider", targets: ["FortfaceProviderTarget"]),
        
        
        .library(name: "CafFingerprintProvider", targets: ["CafFingerprintProviderTarget"])
    ],
    dependencies: [
        .package(url: "https://github.com/iProov/ios.git", .exact("13.1.0")),

        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios.git", .exact("2.16.0")),

        .package(url: "https://github.com/combateafraude/TensorFlowLiteC.git", .exact("2.14.0")),
    ],
    targets: [
        // Binary Targets (keep original names)
        .binaryTarget(name: "CafSDK", path: "Frameworks/CafSDK.xcframework"),
        .binaryTarget(name: "DocumentDetector", path: "Frameworks/DocumentDetector.xcframework"),
        .binaryTarget(name: "CerttaBase", path: "Frameworks/CerttaBase.xcframework"),
        .binaryTarget(name: "CafFaceLiveness", path: "Frameworks/CafFaceLiveness.xcframework"),
        .binaryTarget(name: "CafFaceLivenessLite", path: "CafFacelivenessLite/CafFaceLivenessLite.xcframework"),
        .binaryTarget(name: "IproovProvider", path: "Frameworks/IproovProvider.xcframework"),
        .binaryTarget(name: "FaceTec2DProvider", path: "Frameworks/FaceTec2DProvider.xcframework"),
        .binaryTarget(name: "Fortface", path: "Frameworks/Fortface.xcframework"),
        .binaryTarget(name: "FortfaceProvider", path: "Frameworks/FortfaceProvider.xcframework"),
        .binaryTarget(name: "IDLiveFaceCamera", path: "Frameworks/IDLiveFaceCamera.xcframework"),
        .binaryTarget(name: "IDLiveFaceDetection", path: "Frameworks/IDLiveFaceDetection.xcframework"),
        .binaryTarget(name: "IDLiveFaceIAD", path: "Frameworks/IDLiveFaceIAD.xcframework"),
        .binaryTarget(name: "CafFingerprintProvider", path: "Frameworks/CafFingerprintProvider.xcframework"),

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
            ],
            path: "Sources/DocumentDetector"
        ),

        // CerttaBase
        .target(
            name: "CerttaBaseTarget",
            dependencies: ["CerttaBase"],
            path: "Sources/CerttaBase"
        ),

        // CafFaceLiveness Core
        .target(
            name: "CafFaceLivenessCoreTarget",
            dependencies: [
                "CafSDKTarget",
                "CafFaceLiveness",
                "CerttaBaseTarget"
            ],
            path: "Sources/CafFaceLivenessCore"
        ),

        // CafFaceLiveness Lite (standalone)
        .target(
            name: "CafFaceLivenessLiteTarget",
            dependencies: [
                "CafFaceLivenessLite",
                .product(name: "iProov", package: "ios")
            ],
            path: "Sources/CafFaceLivenessLite"
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

        // Fortface Provider
        .target(
            name: "FortfaceProviderTarget",
            dependencies: [
                "FortfaceProvider",
                "Fortface",
                "IDLiveFaceCamera",
                "IDLiveFaceDetection",
                "IDLiveFaceIAD",
                "CafFaceLivenessCoreTarget"
            ],
            path: "Sources/FortfaceProvider"
        ),

        
        .target(
            name: "CafFingerprintProviderTarget",
            dependencies: [
                "CafFingerprintProvider",
                "CerttaBaseTarget",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios")
            ],
            path: "Sources/CafFingerprintProvider"
        ),

        // CafFaceLiveness
        .target(
            name: "CafFaceLivenessTarget",
            dependencies: [
                "CafFaceLivenessCoreTarget",
                "IproovProviderTarget",
                "FaceTec2DProviderTarget",
                "FortfaceProviderTarget"
            ],
            path: "Sources/CafFaceLiveness"
        )
    ]
)
