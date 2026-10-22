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
            exclude: [
                "Classes/Tools/MKExcelManager/libxlsxwriter/third_party/ioapi.c",
                "Classes/Tools/MKExcelManager/libxlsxwriter/third_party/zip.c",
            ],
            sources: ["Classes"],
            resources: [.process("Assets")],
            publicHeadersPath: "Classes",
            cSettings: [
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
                .linkedLibrary("xml2")
            ]
        )
    ]
)
