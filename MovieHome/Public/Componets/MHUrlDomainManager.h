//
//  MHUrlDomainManager.h
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHUrlDomainManager : NSObject
+ (MHUrlDomainManager *)sharedInstance;
- (NSString *)getDomainForKey:(NSString *)key;
@end
