// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "MKBaseModuleLibrary",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MKBaseModuleLibrary",
            targets: ["MKBaseModuleLibrary"]
        )
    ],
    targets: [
        .target(
            name: "MKBaseModuleLibrary",
            path: "MKBaseModuleLibrary",
            sources: ["Classes"],
            resources: [.process("Assets")],
            publicHeadersPath: "Classes/PublicHeaders",
            cSettings: [
                // SSZipArchive podspec 对应宏（pod_target_xcconfig GCC_PREPROCESSOR_DEFINITIONS）
                .define("HAVE_WZAES"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_ZLIB"),
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_STDINT_H"),
                // libxlsxwriter podspec compiler_flags
                .define("NOCRYPT", to: "1"),
                .define("NOUNCRYPT", to: "1"),
                .headerSearchPath("Classes/Defines"),
                .headerSearchPath("Classes/Category"),
                .headerSearchPath("Classes/Tools/MKClassInfo"),
                .headerSearchPath("Classes/Tools/MKExcelManager"),
                .headerSearchPath("Classes/Tools/MKExcelManager/SSZipArchive"),
                .headerSearchPath("Classes/Tools/MKExcelManager/libxlsxwriter"),
                .headerSearchPath("Classes/Tools/MKExcelManager/libxlsxwriter/include"),
                .headerSearchPath("Classes/Tools/MKExcelManager/libxlsxwriter/third_party"),
                .headerSearchPath("Classes/Base"),
                .headerSearchPath("Classes/Base/Controller"),
                .headerSearchPath("Classes/Base/MKBaseCell"),
                .headerSearchPath("Classes/Base/NavigationController"),
                .headerSearchPath("Classes/Base/View/NavigationBar"),
                .headerSearchPath("Classes/Base/View/collectionView"),
                .headerSearchPath("Classes/Base/View/tableView"),
                .headerSearchPath("Classes/Vendor/Masonry"),
                .headerSearchPath("Classes/Vendor/Toast"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedLibrary("z"),
                .linkedLibrary("xml2"),
                .linkedLibrary("iconv")
            ]
        )
    ]
)
