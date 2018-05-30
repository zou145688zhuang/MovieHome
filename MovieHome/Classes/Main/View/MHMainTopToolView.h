//
//  MHMainTopToolView.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/30.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MHMainTopToolViewDelegate<NSObject>

@end
@interface MHMainTopToolView : UIView
- (void)scrollOffsetY:(CGFloat)offsetY;
@end
