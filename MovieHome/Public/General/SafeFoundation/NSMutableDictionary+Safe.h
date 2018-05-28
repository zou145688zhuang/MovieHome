//
//  NSMutableDictionary+Safe.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/28.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)
- (void)setSafeObject:(id)anObject forKey:(NSString *)aKey;
- (void)setSafeString:(NSString*)str forKey:(NSString *)aKey;
@end
