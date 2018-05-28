//
//  NSArray+Safe.h
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Safe)
- (id)safeObjectAtIndex:(NSUInteger)index;
@end

@interface NSMutableArray (Safe)
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (void)safeAddObject:(id)object;
@end
