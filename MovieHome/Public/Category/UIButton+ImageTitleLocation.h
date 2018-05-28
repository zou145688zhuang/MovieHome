//
//  UIButton+ImageTitleLocation.h
//  IGFD
//
//  Created by 邹壮壮 on 2017/5/10.
//  Copyright © 2017年 邹壮壮. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    IGButtonEdgeInsetsStyleTop, // image在上，label在下
    IGButtonEdgeInsetsStyleLeft, // image在左，label在右
    IGButtonEdgeInsetsStyleBottom, // image在下，label在上
    IGButtonEdgeInsetsStyleRight, // image在右，label在左
    IGButtonEdgeInsetsStyleCenter// label在image中间
};
@interface UIButton (ImageTitleLocation)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end
