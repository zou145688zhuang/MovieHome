//
//  MHsegmentScrollView.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHsegmentScrollView : UIView
@property (nonatomic, strong) NSArray *tagArray;
@property (nonatomic, copy) void(^didClickBtnBlock)(NSString *title,NSInteger index,BOOL First);
- (void)scrollDidIndex:(int)index;
@end
