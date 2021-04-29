//
//  LXFGPSView.m
//  LXFGpsIntensity
//
//  Created by 凌煊峰 on 2021/4/9.
//

#import "LXFGPSView.h"
#import "LXFGPSIntensityManager.h"
#import "LXFColor.h"

@interface LXFGPSView () <JLGPSIntensityManagerDelegate>

@property (weak, nonatomic) IBOutlet UIView *lowSignalView;
@property (weak, nonatomic) IBOutlet UIView *middleSignalView;
@property (weak, nonatomic) IBOutlet UIView *highSignalView;
@property (nonatomic, assign) LXFGPSSignalStrength gpsSignalStrength;

@end

@implementation LXFGPSView

+ (instancetype)gpsView {
    LXFGPSView *gpsView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LXFGPSView class]) owner:nil options:nil] lastObject];
    gpsView.layer.cornerRadius = gpsView.bounds.size.height / 2;
    [gpsView setGpsSignalStrength:LXFGPSSignalStrengthUnknow];
    [LXFGPSIntensityManager sharedInstance].delegate = gpsView;
    return gpsView;
}

- (void)resetIntensityManagerDelegate {
    [LXFGPSIntensityManager sharedInstance].delegate = self;
}

- (void)setGpsSignalStrength:(LXFGPSSignalStrength)gpsSignalStrength {
    switch (gpsSignalStrength) {
        case LXFGPSSignalStrengthWeak:
            self.lowSignalView.backgroundColor = [UIColor greenColor];
            self.middleSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            self.highSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            break;
        case LXFGPSSignalStrengthSimple:
            self.lowSignalView.backgroundColor = [UIColor greenColor];
            self.middleSignalView.backgroundColor = [UIColor greenColor];
            self.highSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            break;
        case LXFGPSSignalStrengthStrong:
            self.lowSignalView.backgroundColor = [UIColor greenColor];
            self.middleSignalView.backgroundColor = [UIColor greenColor];
            self.highSignalView.backgroundColor = [UIColor greenColor];
            break;
        default:
            self.lowSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            self.middleSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            self.highSignalView.backgroundColor = [LXFColor colorWithString:@"#D8D8D8"];
            break;
    }
}

#pragma mark - JLGPSIntensityManagerDelegate

- (void)gpsIntensityManagerDidReceiveSignalStrength:(LXFGPSSignalStrength)gpsSignalStrength {
    [self setGpsSignalStrength:gpsSignalStrength];
}

@end
