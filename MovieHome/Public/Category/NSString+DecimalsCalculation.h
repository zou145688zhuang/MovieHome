//
//  NSString+DecimalsCalculation.h
//  MovieHome
//
//  Created by 邹壮 on 2018/5/30.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import <Foundation/Foundation.h>




/**
 数字格式化
 */
@interface PSCDecimalNumberHandler : NSDecimalNumberHandler



/**
 默认的精度处理函数,
 1. 小数保留2位.(为0的无效小数后自动过滤)
 2. 四舍五入
 3. 除数为零会抛出异常
 
 @return 每次都会新建一个新的处理函数
 */
+ (instancetype)defaultStringNumberHandler;

// 自定义的数字格式，结果会忽略设置的scale和formatterStyle
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
// formatter 的格式,用来描述数据使用类型,如:四舍五入的整数,小数形式,货币形式,百分号形式等.
@property NSNumberFormatterStyle formatterStyle;

@end

/**
 // Rounding policies :
 // Original
 //    value 1.2  1.21  1.25  1.35  1.27
 // Plain    1.2  1.2   1.3   1.4   1.3
 // Down     1.2  1.2   1.2   1.3   1.2
 // Up       1.2  1.3   1.3   1.4   1.3
 // Bankers  1.2  1.2   1.2   1.4   1.3
 
 typedef NS_ENUM(NSUInteger, NSRoundingMode) {
 NSRoundPlain,   // Round up on a tie
 NSRoundDown,    // Always down == truncate
 NSRoundUp,      // Always up
 NSRoundBankers  // on a tie round so last digit is even
 };
 */

@interface NSString (DecimalsCalculation)
/**
 字符转换,保留小数2位
 如果是空串或不是数字,将原值返回,不做处理,这样避免输出非法值
 @return decimals
 */
- (NSString *)dc_stringNmuber;
- (NSString *)dc_stringNmuberwithBehavior:(PSCDecimalNumberHandler *)handler;
/**
 加法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByAdding:(NSString *)stringNumber;
- (NSString *)dc_stringNumberByAdding:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler;


/**
 减法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberBySubtracting:(NSString *)stringNumber;
- (NSString *)dc_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler;

/**
 乘法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByMultiplyingBy:(NSString *)stringNumber;
- (NSString *)dc_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler;

/**
 除法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByDividingBy:(NSString *)stringNumber;
- (NSString *)dc_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler;
@end
