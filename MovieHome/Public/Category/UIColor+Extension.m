//
//  UIColor+Extension.m
//  LotteryNews
//
//  Created by 邹壮壮 on 2016/12/26.
//  Copyright © 2016年 邹壮壮. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
// 16进制转化为RGB代码
+ (UIColor *) colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+(UIColor *) getColor:(NSString *)hexColor alpha:(CGFloat)alpha{
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}
+ (UIColor*)getPixelColorAtLocation:(CGPoint)point inImage:(UIImage*)image
{
    UIColor* color = nil;
    CGImageRef inImage = image.CGImage;
    CGContextRef cgctx = [self createARGBBitmapContextFromImage:
                          inImage];
    
    if (cgctx == NULL) {
        return nil; /* error */
    }
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = { { 0, 0 }, { w, h } };
    
    CGContextDrawImage(cgctx, rect, inImage);
    
    unsigned char* data = CGBitmapContextGetData(cgctx);
    
    if (data != NULL) {
        int offset = 4 * ((w * round(point.y)) + round(point.x));
        int alpha = data[offset];
        int red = data[offset + 1];
        int green = data[offset + 2];
        int blue = data[offset + 3];
        NSLog(@"offset: %i colors: RGB A %i %i %i  %i", offset, red, green,
              blue, alpha);
        color = [UIColor colorWithRed:(red / 255.0f) green:(green / 255.0f) blue:
                 (blue / 255.0f)
                                alpha:(alpha / 255.0f)];
    }
    
    CGContextRelease(cgctx);
    
    if (data) {
        free(data);
    }
    
    return color;
}

+ (CGContextRef)createARGBBitmapContextFromImage:(CGImageRef)inImage
{
    
    CGContextRef context = NULL;
    
    CGColorSpaceRef colorSpace;
    
    void* bitmapData;
    
    unsigned long bitmapByteCount;
    
    unsigned long bitmapBytesPerRow;
    
    size_t pixelsWide = CGImageGetWidth(inImage);
    
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    bitmapBytesPerRow = (pixelsWide * 4);
    
    bitmapByteCount = (bitmapBytesPerRow * pixelsHigh);
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (colorSpace == NULL)
        
    {
        
        fprintf(stderr, "Error allocating color space\n");
        
        return NULL;
    }
    
    bitmapData = malloc(bitmapByteCount);
    
    if (bitmapData == NULL)
        
    {
        
        fprintf(stderr, "Memory not allocated!");
        
        CGColorSpaceRelease(colorSpace);
        
        return NULL;
    }
    
    context = CGBitmapContextCreate(bitmapData,
                                    
                                    pixelsWide,
                                    
                                    pixelsHigh,
                                    
                                    8,
                                    
                                    bitmapBytesPerRow,
                                    
                                    colorSpace,
                                    
                                    (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    
    if (context == NULL)
        
    {
        
        free(bitmapData);
        
        fprintf(stderr, "Context not created!");
    }
    
    CGColorSpaceRelease(colorSpace);
    
    return context;
}

@end
