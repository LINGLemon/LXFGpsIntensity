//
//  LXFGPSIntensityManager.m
//  LXFGpsIntensity
//
//  Created by 凌煊峰 on 2021/4/12.
//

#import "LXFGPSIntensityManager.h"
#import <CoreLocation/CoreLocation.h>

@interface LXFGPSIntensityManager ()  <CLLocationManagerDelegate>

@property (nonatomic ,strong) CLLocationManager *locationManager;
@property (nonatomic, assign) LXFGPSSignalStrength gpsSignalStrength;

@end

@implementation LXFGPSIntensityManager

+ (instancetype)sharedInstance {
    static LXFGPSIntensityManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        // 初始化定位管理器
        _sharedInstance.locationManager = [[CLLocationManager alloc] init];
        // 设置代理
        _sharedInstance.locationManager.delegate = _sharedInstance;
        // 设置定位精确度到米
        _sharedInstance.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        // 设置过滤器为无
        _sharedInstance.locationManager.distanceFilter = kCLDistanceFilterNone;
        // 开始定位
        // 取得定位权限，有两个方法，取决于你的定位使用情况
        // 一个是requestAlwaysAuthorization，一个是requestWhenInUseAuthorization
        [_sharedInstance.locationManager requestWhenInUseAuthorization];//这句话ios8以上版本使用。
        [_sharedInstance.locationManager startUpdatingLocation];
    });
    return _sharedInstance;
}

- (void)startUpdatingLocation {
    [self.locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation {
    [self.locationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
    if (location) {
//        NSLog(@"JLGPSIntensityManager--->\n horizontalAccuracy: %f======verticalAccuracy: %f======speedAccuracy: %f", location.horizontalAccuracy, location.verticalAccuracy, location.speedAccuracy);
        if (0.0f <= location.horizontalAccuracy && location.horizontalAccuracy <= 30.0f) {
            self.gpsSignalStrength = LXFGPSSignalStrengthStrong;
        } else if (30.0f <= location.horizontalAccuracy && location.horizontalAccuracy <= 60.0f) {
            self.gpsSignalStrength = LXFGPSSignalStrengthSimple;
        } else if (60.0f <= location.horizontalAccuracy && location.horizontalAccuracy <= 90.0f) {
           self.gpsSignalStrength = LXFGPSSignalStrengthWeak;
        } else {
            self.gpsSignalStrength = LXFGPSSignalStrengthUnknow;
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(gpsIntensityManagerDidReceiveSignalStrength:)]) {
            [self.delegate gpsIntensityManagerDidReceiveSignalStrength:self.gpsSignalStrength];
        }
    }
}

@end
