//
//  NSArray+Safe.m
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//

#import "NSArray+Safe.h"

@implementation NSArray (Safe)
- (id)safeObjectAtIndex:(NSUInteger)index{
    if (self.count > index) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end

@implementation NSMutableArray (Safe)
- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object{
    if (self.count > index) {
        [self replaceObjectAtIndex:index withObject:object];
    }
}
- (void)safeAddObject:(id)object{
    NSAssert(object != nil, @"object must be non-nil");
    if (object) {
        [self addObject:object];
    }
}
@end

