//
//  MHHotTagsView.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/31.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHHotTagsConfig :NSObject
@property (nonatomic, assign) CGFloat marginX;///第一个按钮左边距离
@property (nonatomic, assign) CGFloat spaceX;///两个按钮之间X方向距离
@property (nonatomic, assign) CGFloat spaceY;///两个按钮之间Y方向距离
@property (nonatomic, assign) CGFloat btnHeight;///按钮高度
@property (nonatomic, strong) NSString *selectedBGColor;///选中背景色
@property (nonatomic, strong) NSString *selectedTextColor;///选中文字颜色
@end


@interface MHHotTagsView : UIView
@property (nonatomic ,strong)NSArray * tagArray;
@property (nonatomic, strong) MHHotTagsConfig *config;
/**
 点击按钮回调
 
 @param title 按钮文字
 @param index 点击的第几个按钮
 @param First 是否是创建视图时候回调
 */

@property (nonatomic, copy) void(^didClickCategoryBlock) (NSString *title,NSInteger index,BOOL First);
@end
