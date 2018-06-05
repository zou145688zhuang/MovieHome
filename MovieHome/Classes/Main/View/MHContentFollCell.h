//
//  MHContentFollCell.h
//  MovieHome
//
//  Created by 邹壮 on 2018/6/5.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MHMovieDto.h"
/**
 ///星星
 */
@interface MHBaseStarView : UIView
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger starCount;
@end
@interface MHContentFoldBaseView : UIView
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) YYLabel *movieNameL;
@property (nonatomic, strong) YYLabel * releaseTimeL;
@property (nonatomic, strong) MHBaseStarView *starView;
@end
@interface MHContentFoldToolView : UIView

@end

@interface MHContentFoldDrawerView : UIView

@end
@interface MHContentFollCell : UITableViewCell
@property (nonatomic, strong) MHContentFoldBaseView *baseView;
@property (nonatomic, strong) MHContentFoldDrawerView *drawerView;
@property (nonatomic, strong) MHContentFoldToolView *toolView;
@property (nonatomic, strong) MHMovieDto *dto;
- (void)setContentMovie:(MHMovieDto *)dto;
@end
