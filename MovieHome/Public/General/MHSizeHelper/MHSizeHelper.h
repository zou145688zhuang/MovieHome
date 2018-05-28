//
//  MHSizeHelper.h
//  ManureHeapFM
//
//  Created by 邹壮壮 on 2018/4/15.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHSizeHelper : NSObject

/**
 计算空间大小
 */
+ (NSString *)sizeStringFromInt64:(int64_t)size;
@end
