//
//  UIColor+Extension.h
//  LotteryNews
//
//  Created by 邹壮壮 on 2016/12/26.
//  Copyright © 2016年 邹壮壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
16进制转化为RGB代码
 */
+ (UIColor *) colorWithHexString:(NSString *)color;
+ (UIColor *) getColor:(NSString *)hexColor alpha:(CGFloat)alpha;
+ (UIColor*) getPixelColorAtLocation:(CGPoint)point inImage:(UIImage *)image;
@end
