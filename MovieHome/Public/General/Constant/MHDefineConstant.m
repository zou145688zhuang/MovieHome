//
//  MHDefineConstant.m
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//


NSString* EncodeStringFromDic(NSDictionary *dic, NSString *key)
{
    if (nil != dic
        && [dic isKindOfClass:[NSDictionary class]]) {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSString class]])
        {
            return temp;
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return [temp stringValue];
        }
    }
    return nil;
}

NSNumber* EncodeNumberFromDic(NSDictionary *dic, NSString *key)
{
    if (nil != dic
        && [dic isKindOfClass:[NSDictionary class]]) {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSString class]])
        {
            return [NSNumber numberWithDouble:[temp doubleValue]];
        }
        else if ([temp isKindOfClass:[NSNumber class]])
        {
            return temp;
        }
    }
    return nil;
}

NSDictionary *EncodeDicFromDic(NSDictionary *dic, NSString *key)
{
    if ([dic respondsToSelector:@selector(objectForKey:)]) {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSDictionary class]])
        {
            return temp;
        }
    }
    return nil;
}

NSArray *EncodeArrayFromDic(NSDictionary *dic, NSString *key)
{
    if (nil != dic
        && [dic isKindOfClass:[NSDictionary class]]) {
        id temp = [dic objectForKey:key];
        if ([temp isKindOfClass:[NSArray class]])
        {
            return temp;
        }
    }
    return nil;
}

NSArray *EncodeArrayFromDicUsingParseBlock(NSDictionary *dic, NSString *key, id(^parseBlock)(NSDictionary *innerDic))
{
    NSArray *tempList = EncodeArrayFromDic(dic, key);
    if ([tempList count])
    {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:[tempList count]];
        for (NSDictionary *item in tempList)
        {
            id dto = parseBlock(item);
            if (dto) {
                [array addObject:dto];
            }
        }
        return array;
    }
    return nil;
}
#import "MHDefineConstant.h"
@implementation MHDefineConstant

@end
