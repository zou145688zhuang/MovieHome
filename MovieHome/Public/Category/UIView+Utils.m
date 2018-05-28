//
//  UIView+Utils.m
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/6.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import "UIView+Utils.h"
#import <Masonry.h>
@implementation UIView (Utils)
- (void) PSC_addBorder:(CGFloat) borderWidth
       withBorderColor:(CGColorRef) color
       andCornerRadius:(CGFloat) cornerRadius {
    [self layer].masksToBounds = YES;
    [[self layer] setBorderWidth:borderWidth];
    [[self layer] setBorderColor:color];
    [[self layer] setCornerRadius:cornerRadius];
}

- (void) PSC_replaceBorderWithBorderColor:(CGColorRef) color
                          andCornerRadius:(CGFloat) cornerRadius {
    
    [[self layer] setBorderColor:color];
    [[self layer] setCornerRadius:cornerRadius];
}

- (void)setBackGroundColor:(NSString *)bgColor {
//    self.backgroundColor = [UIColor colorWithHexString:IsStrEmpty(bgColor) ? @"#f5f7fa" : bgColor];
}

- (void)setCornerRadius:(CGFloat)cornerRadius
            shadowColor:(UIColor *)shadowColor
           shadowRadius:(CGFloat)shadowRadius
           shadowOffset:(CGSize)shadowOffset
          shadowOpacity:(float)shadowOpacity {
    //圆角
    CALayer *layer = self.layer;
    layer.cornerRadius = cornerRadius;
    layer.masksToBounds = NO;
    
    //阴影
    layer.shadowOffset = shadowOffset;
    layer.shadowColor = [shadowColor CGColor];
    layer.shadowRadius = shadowRadius;
    layer.shadowOpacity = shadowOpacity;
    layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:layer.cornerRadius] CGPath];
    
    //将页面背景色移动到layer层
    CGColorRef bColor = self.backgroundColor.CGColor;
    self.backgroundColor = nil;
    layer.backgroundColor = bColor;
}

- (void)setShadowProperty:(UIColor *)shadowColor
             shadowRadius:(CGFloat)shadowRadius
             shadowOffset:(CGSize)shadowOffset
            shadowOpacity:(float)shadowOpacity {
    //阴影
    [[self layer] setMasksToBounds:NO];
    [[self layer] setShadowColor:[shadowColor CGColor]];
    [[self layer] setShadowRadius:shadowRadius];
    [[self layer] setShadowOffset:shadowOffset];
    [[self layer] setShadowOpacity:shadowOpacity];
}

- (void)addSeparatorLine:(BOOL)hiddenTopLine
        hiddenBottomLine:(BOOL)hiddenBottomLine {
    if (!hiddenTopLine) {
        UIView *topLine = [[UIView alloc] init];
       // topLine.sakura.backgroundColor(kSeparatorColor);
        [self addSubview:topLine];
        [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    if (!hiddenBottomLine) {
        UIView *bottomLine = [[UIView alloc] init];
        //bottomLine.sakura.backgroundColor(kSeparatorColor);
        [self addSubview:bottomLine];
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
}

@end
