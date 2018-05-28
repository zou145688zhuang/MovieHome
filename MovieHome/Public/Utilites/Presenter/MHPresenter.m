//
//  MHPresenter.m
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/16.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import "MHPresenter.h"

@implementation MHPresenter
/**
 初始化函数
 */
- (instancetype)initWithView:(id)view{
    
    if (self = [super init]) {
        _view = view;
    }
    return self;
}
/**
 * 绑定视图
 * @param view 要绑定的视图
 */
- (void)attachView:(id)view {
    _view = view;
}


/**
 解绑视图
 */
- (void)detachView{
    _view = nil;
}
@end
