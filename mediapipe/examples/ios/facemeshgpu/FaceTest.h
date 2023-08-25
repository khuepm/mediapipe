#import <Foundation/Foundation.h>
#import <CoreVideo/CoreVideo.h>

@class Landmark;
@class HolisticTrackingGpuHarmony;

@protocol HolisticTrackingGpuHarmonyDelegate <NSObject>
- (void)upperBodyPoseTracker: (HolisticTrackingGpuHarmony *)tracker didOutputPixelBuffer: (CVPixelBufferRef)pixelBuffer;
@end

@interface HolisticTrackingGpuHarmony : NSObject
- (instancetype)init;
- (void)startGraph;
- (void)sendPixelBuffer:(CVPixelBufferRef)pixelBuffer;
@property (weak, nonatomic) id <HolisticTrackingGpuHarmonyDelegate> delegate;
@end

@interface Landmark: NSObject
@property(nonatomic, readonly) float x;
@property(nonatomic, readonly) float y;
@property(nonatomic, readonly) float z;
@end
