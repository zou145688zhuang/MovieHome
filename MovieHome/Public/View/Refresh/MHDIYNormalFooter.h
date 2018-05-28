//
//  MHDIYNormalFooter.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface MHDIYNormalFooter : MJRefreshAutoNormalFooter
// 没有更多数据时候的状态问题 default: @"没有更多数据"
@property (nonatomic,strong) NSString *noDataTextString;

+ (instancetype)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock;
@end
