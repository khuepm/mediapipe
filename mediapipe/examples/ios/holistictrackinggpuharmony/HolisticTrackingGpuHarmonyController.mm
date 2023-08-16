// #import "HolisticTrackingGpuController.h"

// #include "mediapipe/framework/formats/landmark.pb.h"

// static const char* kLandmarksOutputStream = "hand_landmarks";
// static const char* kNumHandsInputSidePacket = "num_hands";

// // Max number of hands to detect/process.
// static const int kNumHands = 6;

// @implementation HolisticTrackingGpuController

// #pragma mark - UIViewController methods

// - (void)viewDidLoad {
//   [super viewDidLoad];

//   [self.mediapipeGraph setSidePacket:(mediapipe::MakePacket<int>(kNumHands))
//                                named:kNumHandsInputSidePacket];
//   [self.mediapipeGraph addFrameOutputStream:kLandmarksOutputStream
//                            outputPacketType:MPPPacketTypeRaw];
// }

// #pragma mark - MPPGraphDelegate methods

// // Receives a raw packet from the MediaPipe graph. Invoked on a MediaPipe worker thread.
// - (void)mediapipeGraph:(MPPGraph*)graph
//      didOutputPacket:(const ::mediapipe::Packet&)packet
//           fromStream:(const std::string&)streamName {
//   if (streamName == kLandmarksOutputStream) {
//     if (packet.IsEmpty()) {
//       NSLog(@"[TS:%lld] No hand landmarks", packet.Timestamp().Value());
//       return;
//     }
//     const auto& multiHandLandmarks = packet.Get<std::vector<::mediapipe::NormalizedLandmarkList>>();
//     NSLog(@"[TS:%lld] Number of hand instances with landmarks: %lu", packet.Timestamp().Value(),
//           multiHandLandmarks.size());
//     for (int handIndex = 0; handIndex < multiHandLandmarks.size(); ++handIndex) {
//       const auto& landmarks = multiHandLandmarks[handIndex];
//       NSLog(@"\tNumber of landmarks for hand[%d]: %d", handIndex, landmarks.landmark_size());
//       for (int i = 0; i < landmarks.landmark_size(); ++i) {
//         NSLog(@"\t\tLandmark[%d]: (%f, %f, %f)", i, landmarks.landmark(i).x(),
//               landmarks.landmark(i).y(), landmarks.landmark(i).z());
//       }
//     }
//   }
// }

// @end

#import <HolisticTrackingGpuHarmonyController.h>
#import <Foundation/Foundation.h>
#import <mediapipe/objc/CalculatorGraph.h>
#import <mediapipe/objc/Status.h>
#import <mediapipe/objc/Texture.h>
#import <mediapipe/objc/TextureSender.h>

@interface HolisticTrackingGpuHarmonyController()

@property(nonatomic, strong) mediapipe::CalculatorGraph* calculatorGraph;
@property(nonatomic, strong) mediapipe::TextureSender* textureSender;
@property(nonatomic, strong) mediapipe::OutputStreamPoller* outputPoller;

@end

@implementation HolisticTrackingGpuHarmonyController

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize the graph and other components
        // Create and configure the CalculatorGraph, TextureSender, etc.

        // Create a graph.
        _graph = [[Graph alloc] init];

        // Add the holistic tracking calculator to the graph.
        _holisticCalculator = [[HolisticCalculator alloc] init];
        [_graph addCalculator:_holisticCalculator];

        // Start the graph.
        // This should run only once
        [_graph startRunning];
    }
    return self;
}

- (void)startGraph {
    // Start the CalculatorGraph
    // This should run only once
    [_graph startRunning];
}

- (void)stopGraph {
    // Stop the CalculatorGraph
    [_graph stopRunning];
}

- (void)processImage:(UIImage *)image {
    // Convert UIImage to mediapipe::Texture
    // Process the image using the graph
    // Use self.outputPoller to access the output
    // Convert the output to JSON and handle accordingly
}

// Callback function that's called when an image is processed
void ProcessImageCallback(void* context, mediapipe::Texture* outputTexture) {
    HolisticTrackingGpuHarmonyController* wrapper = (__bridge HolisticTrackingGpuHarmonyController*)context;
    UIImage* processedImage = [wrapper convertTextureToUIImage:outputTexture];
    // Handle the processed image, e.g., convert to JSON and send
}

@end
