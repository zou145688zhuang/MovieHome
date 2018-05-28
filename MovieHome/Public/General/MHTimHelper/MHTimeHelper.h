//
//  MHTimeHelper.h
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/15.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHTimeHelper : NSObject

/**
 计算距离当前多长时间
 */
+ (NSString *)dataStringWithTimeInterval:(NSTimeInterval)time;
@end
