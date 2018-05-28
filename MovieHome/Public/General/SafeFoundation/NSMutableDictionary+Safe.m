//
//  NSMutableDictionary+Safe.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"

@implementation NSMutableDictionary (Safe)
- (void)setSafeObject:(id)anObject forKey:(NSString *)aKey
{
    if (!anObject || IsStrEmpty(aKey)) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

- (void)setSafeString:(NSString*)str forKey:(NSString *)aKey
{
    if (!str || IsStrEmpty(str)) {
        return;
    }
    [self setObject:str forKey:aKey];
}
@end
