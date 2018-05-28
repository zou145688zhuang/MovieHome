//
//  MHPresenter.h
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/16.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHPresenter<E> : NSObject{
@protected
    __weak E _view; //MVP中负责更新的视图
}
/**
 初始化函数
 @param view 要绑定的视图
 */
- (instancetype)initWithView:(E)view;

/**
 * 绑定视图
 * @param view 要绑定的视图
 */
- (void)attachView:(E)view;

/**
 解绑视图
 */
- (void)detachView;

@end
