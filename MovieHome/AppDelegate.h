//
//  AppDelegate.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHSlideViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)MHSlideViewController *slideVC;

/**
 切换左侧边栏
 */
- (void)toggleLeftVC;
@end

