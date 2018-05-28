//
//  MHTimerManager.h
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/15.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString *const kTimerManagerNotification;
@interface MHTimerManager : NSObject
/**
 *  获取时间管理器单例
 *
 *  @return TimerManager 单例实例
 */
+ (MHTimerManager *)sharedInstance;

- (void)start; //启动时间管理类

- (void)stop; //停止时间管理类
@end
