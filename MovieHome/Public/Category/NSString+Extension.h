//
//  NSString+Extension.h
//  HotRedHeadlines
//
//  Created by 邹壮壮 on 2016/12/16.
//  Copyright © 2016年 邹壮壮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

/**
 字典转json
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
计算文字的大小
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 json转dic
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+(float)getAttributedHeightfrom:(NSString *) str size:(float )width;
/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief  反转字符串
 *
 *  @param strSrc 被反转字符串
 *
 *  @return 反转后字符串
 */
+ (NSString *)reverseString:(NSString *)strSrc;


/**
 *  字符串是否为空
 */
+ (BOOL)stringIsNull:(NSString *)string;
/**
 *  字符串是否全为空格
 */

+ (BOOL)stringIsAllWhiteSpace:(NSString *)string;
/**
 *  字符串转Bool
 */

+ (BOOL)stringToBool:(NSString*)sourceString;
/**
 *  字符串转NSInteger
 */
+ (NSInteger)stringToInt:(NSString*)sourceString;

/**
 *  字符串转CGFloat
 */

+ (CGFloat)stringToFloat:(NSString*)sourceString;
/**
 *  字符串转double
 */
+ (double)stringToDouble:(NSString*)sourceString;
/**
 *  bool转字符串
 */
+ (NSString *)boolToString:(BOOL)boolValue;
/**
 *  int转字符串
 */

+ (NSString *)intToString:(NSInteger)intValue;
/**
 *  float转字符串
 */
+ (NSString *)floatToString:(CGFloat)floatValue;
/**
 *  double转字符串
 */

+ (NSString *)doubleToString:(double)doubleValue;
/**
 *  字符串是否合法邮箱
 */
+ (BOOL)stringIsValidateEmailAddress:(NSString *)string;
/**
 *  字符串是否合法手机号码
 */
+ (BOOL)stringISValidateMobilePhone:(NSString *)string;
/**
 *  字符串是否合法座机
 */
+ (BOOL)stringIsValidatePhone:(NSString *)string;
/**
 *  字符串是否合法邮政编码
 */

+ (BOOL)stringIsValidateMailCode:(NSString *)string;
/**
 *  字符串是否只有中文字符
 */
+ (BOOL)stringIsAllChineseWord:(NSString *)string;
/**
 *  字符串是否合法车牌号
 */
+ (BOOL)stringISValidateCarNumber:(NSString *)string;
/**
 *  字符串是否合法url
 */
+ (BOOL)stringIsValidateUrl:(NSString *)string;
/**
 *  字符串是否合法身份证号
 */
+ (BOOL)stringISValidatePersonCardNumber:(NSString *)string;
/**
 *  字符串是否只有英文字符
 */
+ (BOOL)stringJustHasNumberAndCharacter:(NSString *)string;
/**
 *  字符串是否纯数字
 */
+ (BOOL)stringJustHasNumber:(NSString *)string;
/**
 *  字符串是否只包含字符，中文，数字
 */
+ (BOOL)stringChineseNumberCharacterOnly:(NSString *)string;

+ (BOOL)sourceString:(NSString*)sourceString regexMatch:(NSString *)regexString;

+ (NSString*)stringFromFile:(NSString*)path;

+ (NSString*)currentTimeStampString;


+ (NSString *)stringByTrimingLeadingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingTailingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingWhiteSpace:(NSString *)string;



+ (NSRange)stringRange:(NSString *)string;

+ (NSString *)uuid;
- (CGSize)sizeWithMaxWidth:(CGFloat)width andFont:(UIFont *)font;
- (CGSize)sizeWithMaxHeight:(CGFloat)height andFont:(UIFont *)font;
+ (NSString *)currentName;


- (NSString *)emoji;



- (NSString *)originName;



- (NSString *)firstStringSeparatedByString:(NSString *)separeted;
//MD5 加密
+(NSString *)MD5ForLower32Bate:(NSString *)str;
//时间的转换
+ (NSString *)stringWithTimelineDate:(NSString *)datestr;
-(NSString *)fireStruppercaseStringWithStr;
- (NSString *)trim;
@end
