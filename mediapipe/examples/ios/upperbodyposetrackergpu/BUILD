load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_framework",
)
load(
    "//mediapipe/examples/ios:bundle_id.bzl",
    "BUNDLE_ID_PREFIX",
    "example_provisioning",
)

licenses(["notice"])

MIN_IOS_VERSION = "10.0"

alias(
    name = "upperbodyposetrackergpu",
    actual = "UpperBodyPoseTracker",
)

ios_framework(
    name = "UpperBodyPoseTracker",
    hdrs = [
        "UpperBodyPoseTracker.h",
    ],
    bundle_id = BUNDLE_ID_PREFIX + ".UpperBodyPoseTrackerGpu",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = [
        "//mediapipe/examples/ios/common:Info.plist",
        "Info.plist",
    ],
    minimum_os_version = MIN_IOS_VERSION,
    provisioning_profile = example_provisioning(),
    deps = [
        ":UpperBodyPoseTrackerLibrary",
        "@ios_opencv//:OpencvFramework",
    ],
)

objc_library(
    name = "UpperBodyPoseTrackerLibrary",
    srcs = [
        "UpperBodyPoseTracker.mm",
    ],
    hdrs = [
        "UpperBodyPoseTracker.h",
    ],
    data = [
        "//mediapipe/graphs/pose_tracking:upper_body_pose_tracking_gpu.binarypb",
        "//mediapipe/modules/pose_detection:pose_detection.tflite",
        "//mediapipe/modules/pose_landmark:pose_landmark_upper_body.tflite",
    ],
    deps = [
        "//mediapipe/examples/ios/common:CommonMediaPipeAppLibrary",
    ] + select({
        "//mediapipe:ios_i386": [],
        "//mediapipe:ios_x86_64": [],
        "//conditions:default": [
            "//mediapipe/graphs/pose_tracking:upper_body_pose_tracking_gpu_deps",
            "//mediapipe/framework/formats:landmark_cc_proto",
        ],
    }),
)
