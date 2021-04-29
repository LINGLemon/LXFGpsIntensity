//
//  LXFGPSIntensityManager.h
//  LXFGpsIntensity
//
//  Created by 凌煊峰 on 2021/4/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LXFGPSSignalStrength)
{
    LXFGPSSignalStrengthUnknow = 0,    //0 信号强度未知
    LXFGPSSignalStrengthWeak = 1,      //1 信号弱
    LXFGPSSignalStrengthSimple = 2,    //2 信号普通
    LXFGPSSignalStrengthStrong = 3,    //3 信号强
};

@protocol JLGPSIntensityManagerDelegate <NSObject>

- (void)gpsIntensityManagerDidReceiveSignalStrength:(LXFGPSSignalStrength)gpsSignalStrength;

@end

@interface LXFGPSIntensityManager : NSObject

@property(weak, nonatomic, nullable) id<JLGPSIntensityManagerDelegate> delegate;

+ (instancetype)sharedInstance;
- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (id)copy NS_UNAVAILABLE;
- (id)mutableCopy NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
