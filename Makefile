MyCoolAppLibrary:
	bazel run //Apps/MyCoolApp/Modules/MyCoolAppLibrary:swift_update_pkgs
	bazel build //Apps/MyCoolApp/Modules/MyCoolAppLibrary:MyCoolAppLibrary
