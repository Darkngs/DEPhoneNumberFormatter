// swift-tools-version:5.2

import PackageDescription

let package = Package(
   name: "DEPhoneNumberFormatter",
   products: [
      .library(name: "DEPhoneNumberFormatter", targets: ["DEPhoneNumberFormatter"])
   ],
   targets: [
      .target(name: "DEPhoneNumberFormatter", dependencies: [])
   ],
   swiftLanguageVersions: [.v5]
)
