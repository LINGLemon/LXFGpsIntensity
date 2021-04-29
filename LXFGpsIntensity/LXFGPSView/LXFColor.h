//
//  LXFColor.h
//  LXFGpsIntensity
//
//  Created by 凌煊峰 on 2021/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXFColor : NSObject

+ (UIColor *)colorWithString:(NSString *)stringToConvert;

/**
 *    covert the color string(#FFFFFF) to UIColor
 */
+ (UIColor *)colorWithString:(NSString *)stringToConvert alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
