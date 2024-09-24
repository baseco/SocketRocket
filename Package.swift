// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SocketRocket",
    platforms: [
        .iOS(.v12), 
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SocketRocket",
            targets: ["SocketRocket"]
        ),
    ],
    targets: [
        .target(
            name: "SocketRocket",
            path: "SocketRocket",
            sources: ["."],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .define("ENABLE_NS_ASSERTIONS", to: "YES"),
                .unsafeFlags(["-Wno-format"], .when(platforms: [.macOS]))
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork", .when(platforms: [.iOS])),
                .linkedFramework("Security"),
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
                .linkedLibrary("icucore")
            ]
        )
    ],
    dependencies: [],
    swiftLanguageVersions: [.v5]
)
