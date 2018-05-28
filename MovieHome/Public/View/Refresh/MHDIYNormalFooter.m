//
//  MHDIYNormalFooter.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "MHDIYNormalFooter.h"

@implementation MHDIYNormalFooter

+ (instancetype)footerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)refreshingBlock {
    MHDIYNormalFooter *footer = [super footerWithRefreshingBlock:refreshingBlock];
    footer.noDataTextString = @"没有更多数据";
    return footer;
}

- (void)setNoDataTextString:(NSString *)noDataTextString {
    _noDataTextString = noDataTextString;
    [self setTitle:noDataTextString forState:MJRefreshStateNoMoreData];
}

@end
