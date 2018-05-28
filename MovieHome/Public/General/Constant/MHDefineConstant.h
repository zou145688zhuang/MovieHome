//
//  MHDefineConstant.h
//  ManureHeapFM
//
//  Created by 邹壮 on 2018/5/8.
//  Copyright © 2018年 邹壮壮. All rights reserved.
//




extern NSString* EncodeStringFromDic(NSDictionary *dic, NSString *key);
extern NSNumber* EncodeNumberFromDic(NSDictionary *dic, NSString *key);
extern NSDictionary *EncodeDicFromDic(NSDictionary *dic, NSString *key);
extern NSArray *EncodeArrayFromDic(NSDictionary *dic, NSString *key);
extern NSArray *EncodeArrayFromDicUsingParseBlock(NSDictionary *dic, NSString *key, id(^parseBlock)(NSDictionary *innerDic));


#import <Foundation/Foundation.h>
@interface MHDefineConstant : NSObject

@end
