// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "PersonalPortfolio",
    products: [
        .executable(
            name: "PersonalPortfolio",
            targets: ["PersonalPortfolio"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "PersonalPortfolio",
            dependencies: ["Publish"]
        )
    ]
)