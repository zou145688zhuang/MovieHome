//
//  UIView+Utils.h
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/6.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utils)
- (void) PSC_addBorder:(CGFloat) borderWidth withBorderColor:(CGColorRef) color andCornerRadius:(CGFloat) cornerRadius;

- (void) PSC_replaceBorderWithBorderColor:(CGColorRef) color andCornerRadius:(CGFloat) cornerRadius;

- (void) setBackGroundColor:(NSString *)bgColor;


/**
 设置阴影和圆角
 
 @param cornerRadius 圆角大小
 @param shadowColor 阴影颜色
 @param shadowRadius 阴影大小
 @param shadowOffset 阴影偏移
 @param shadowOpacity 阴影透明度
 */
- (void)setCornerRadius:(CGFloat)cornerRadius
            shadowColor:(UIColor *)shadowColor
           shadowRadius:(CGFloat)shadowRadius
           shadowOffset:(CGSize)shadowOffset
          shadowOpacity:(float)shadowOpacity;

- (void)setShadowProperty:(UIColor *)shadowColor
             shadowRadius:(CGFloat)shadowRadius
             shadowOffset:(CGSize)shadowOffset
            shadowOpacity:(float)shadowOpacit;

- (void)addSeparatorLine:(BOOL)hiddenTopLine
        hiddenBottomLine:(BOOL)hiddenBottomLine;
@end
