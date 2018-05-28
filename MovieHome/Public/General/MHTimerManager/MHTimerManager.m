//
//  MHTimerManager.m
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/15.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import "MHTimerManager.h"
#import <YYTimer.h>
NSString *const kTimerManagerNotification = @"PSCTimerManagerNotification";

@interface MHTimerManager()

@property (nonatomic, strong) YYTimer *timer; //倒计时控制器

@end
@implementation MHTimerManager
+ (MHTimerManager *)sharedInstance {
    static MHTimerManager *timeManager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        timeManager = [[MHTimerManager alloc] init];
    });
    return timeManager;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
#pragma mark --启动时间管理类
- (void)start {
    if (self.timer == nil || [self.timer isKindOfClass:[NSNull class]]) {
        return;
    }
    if (self.timer == nil || [self.timer isKindOfClass:[NSNull class]]) {
        self.timer = [YYTimer timerWithTimeInterval:1.0f target:self selector:@selector(countDown) repeats:YES];
        [self.timer fire];
    }
    
}

/**
 * 停止时间定时器
 */
- (void)stop {
    if ([self.timer isValid]) {
        [self remove];
    }
}

/**
 * 移除时间定时器
 */
- (void)remove {
    if (!(self.timer == nil || [self.timer isKindOfClass:[NSNull class]])) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

/**
 倒计时
 */
- (void)countDown {
    [[NSNotificationCenter defaultCenter] postNotificationName:kTimerManagerNotification object:nil];
}
@end
