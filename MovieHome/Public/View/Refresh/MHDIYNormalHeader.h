//
//  MHDIYNormalHeader.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface MHDIYNormalHeader : MJRefreshHeader
@property (strong, nonatomic,readonly) UILabel     *label;
@property (strong, nonatomic,readonly) UIImageView *logoView;
@property (strong, nonatomic,readonly) UIImageView *eyesImageV; // 2种图片切换


@end
