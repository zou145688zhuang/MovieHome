//
//  UIViewController+BackButtonHandler.h
//
//  IGFD
//
//  Created by 邹壮壮 on 2017/6/8.
//  Copyright © 2017年 邹壮壮. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional
// Override this method in UIViewController derived class to handle 'Back' button click
-(BOOL)navigationShouldPopOnBackButton;
@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
