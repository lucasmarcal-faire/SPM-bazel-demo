load("@bazel_gazelle//:def.bzl", "gazelle", "gazelle_binary")
load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@rules_swift_package_manager//swiftpkg:defs.bzl", "swift_update_packages")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

# Ignore the `.build` folder that is created by running Swift package manager
# commands. The Swift Gazelle plugin executes some Swift package manager
# commands to resolve external dependencies. This results in a `.build` file
# being created.
# NOTE: Swift package manager is not used to build any of the external packages.
# The `.build` directory should be ignored. Be sure to configure your source
# control to ignore it (i.e., add it to your `.gitignore`).
# gazelle:exclude .build

# This declaration builds a Gazelle binary that incorporates all of the Gazelle
# plugins for the languages that you use in your workspace. In this example, we
# are only listing the Gazelle plugin for Swift from rules_swift_package_manager.
gazelle_binary(
    name = "gazelle_bin",
    languages = [
        "@rules_swift_package_manager//gazelle",
    ],
)

# This macro defines two targets: `swift_update_pkgs` and
# `swift_update_pkgs_to_latest`.
#
# The `swift_update_pkgs` target should be run whenever the list of external
# dependencies is updated in the `Package.swift`. Running this target will
# populate the `swift_deps.bzl` with `swift_package` declarations for all of
# the direct and transitive Swift packages that your project uses.
#
# The `swift_update_pkgs_to_latest` target should be run when you want to
# update your Swift dependencies to their latest eligible version.
swift_library(
    name = "MyCoolAppLibrary",
    srcs = glob(["Sources/**/*.swift"]),
    deps = [
        "@swiftpkg_notthatamazingmodule//:Sources_NotThatAmazingModule"
    ]
)

swift_update_packages(
    name = "swift_update_pkgs",
    gazelle = ":gazelle_bin",
    package_manifest = "Apps/MyCoolApp/Modules/MyCoolAppLibrary/Package.swift",
    swift_deps_index = "Apps/MyCoolApp/Modules/MyCoolAppLibrary/deps_index.json",
    generate_swift_deps_for_workspace = False,
    update_bzlmod_use_repo_names = True,
    update_bzlmod_stanzas = True,
)

bzl_library(
    name = "deps",
    srcs = ["deps.bzl"],
    visibility = ["//visibility:public"],
    deps = ["@rules_swift_package_manager//swiftpkg:defs"],
)