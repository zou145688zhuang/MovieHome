//
//  MHMainFoldCell.h
//  MovieHome
//
//  Created by 邹壮 on 2018/6/1.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHMovieDto.h"
///基本内容
@interface MHMainBaseContentView : UIView

@end
///遮挡view
@interface MHContainerView : UIView

@end
///功能按钮
@interface MHMainToolView : UIView
@property (nonatomic, strong) UIButton *downloadBtn;
@property (nonatomic, strong) UIButton *collectionBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIImageView *line1;
@property (nonatomic, strong) UIImageView *line0;

@end
@interface MHMainFoldCell : UITableViewCell
@property (nonatomic, strong) MHMainBaseContentView *baseContentView;
@property (nonatomic, strong) MHContainerView *containerView;
@property (nonatomic, strong) MHMainToolView *toolView;
@property (nonatomic, strong) MHMovieDto *dto;
- (void)setContentMovie:(MHMovieDto *)dto;

@end
