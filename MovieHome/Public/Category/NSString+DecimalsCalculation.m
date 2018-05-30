//
//  NSString+DecimalsCalculation.m
//  MovieHome
//
//  Created by 邹壮 on 2018/5/30.
//  Copyright © 2018年 邹壮. All rights reserved.
//

#import "NSString+DecimalsCalculation.h"
// CalculationType
typedef NS_ENUM(NSInteger,CalculationType){
    CalculationAdding,
    CalculationSubtracting,
    CalculationMultiplying,
    CalculationDividing,
};

static NSNumberFormatter * PSCDecimalNumberFormatter(NSUInteger scale,NSNumberFormatterStyle formatterStyle){
    
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [NSNumberFormatter new];
        numberFormatter.alwaysShowsDecimalSeparator = YES;
        numberFormatter.minimumIntegerDigits = 1;
    });
    
    numberFormatter.numberStyle = formatterStyle;
    numberFormatter.minimumFractionDigits = scale; // 小数最少位数
    return numberFormatter;
}

@implementation PSCDecimalNumberHandler

+ (instancetype)defaultStringNumberHandler {
    PSCDecimalNumberHandler *handler = [[self alloc] initWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return handler;
}

@end
@implementation NSString (DecimalsCalculation)
/**
 字符转换,保留小数2位
 如果是空串或不是数字,将原值返回,不做处理,这样避免输出非法值
 @return return value description
 */
- (NSString *)dc_stringNmuber {
    return [self dc_stringNmuberwithBehavior:[PSCDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)dc_stringNmuberwithBehavior:(PSCDecimalNumberHandler *)handler {
    
    // 判断是不是空的字符串
    NSString *selfStr = [self trim];
    if(IsStrEmpty(selfStr) || ![NSString stringJustHasNumber:selfStr]) {
        NSLog(@"参数不合法,无法执行字串数字操作");
        return self;
    }
    
    // 防止有空格
    if(handler == nil) {
        handler = [PSCDecimalNumberHandler defaultStringNumberHandler];
    }
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:selfStr];
    
    // 设置的精度
    short scale = [handler scale];// 小数保留几位
    // 如果自定义了结果格式化工具使用自定义formatter
    NSNumberFormatter *numberFormatter = handler.numberFormatter?:PSCDecimalNumberFormatter((NSUInteger)scale,handler.formatterStyle);
    return [numberFormatter stringFromNumber:selfNumber];
}


/**
 加法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByAdding:(NSString *)stringNumber {
    return [self dc_stringNumberByAdding:stringNumber withBehavior:[PSCDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)dc_stringNumberByAdding:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler {
    return [self _stringNumberByCalculationType:CalculationAdding by:stringNumber withBehavior:handler];
}


/**
 减法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberBySubtracting:(NSString *)stringNumber {
    return [self dc_stringNumberBySubtracting:stringNumber withBehavior:[PSCDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)dc_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler {
    return [self _stringNumberByCalculationType:CalculationSubtracting by:stringNumber withBehavior:handler];
}

/**
 乘法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByMultiplyingBy:(NSString *)stringNumber{
    return [self dc_stringNumberByMultiplyingBy:stringNumber withBehavior:[PSCDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)dc_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler {
    return [self _stringNumberByCalculationType:CalculationMultiplying by:stringNumber withBehavior:handler];
}

/**
 除法
 
 @param stringNumber 计算值
 @return 结果
 */
- (NSString *)dc_stringNumberByDividingBy:(NSString *)stringNumber {
    return [self dc_stringNumberByDividingBy:stringNumber withBehavior:[PSCDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)dc_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(PSCDecimalNumberHandler *)handler {
    return [self _stringNumberByCalculationType:CalculationDividing by:stringNumber withBehavior:handler];
}


- (NSString *)_stringNumberByCalculationType:(CalculationType)type
                                          by:(NSString *)stringNumber
                                withBehavior:(PSCDecimalNumberHandler *)handler {
    
    // 判断是不是空的字符串
    NSString *selfStr = [self trim];
    if(IsStrEmpty(selfStr) || ![NSString stringJustHasNumber:selfStr] ||
       IsStrEmpty(stringNumber) || ![NSString stringJustHasNumber:stringNumber]) {
        NSLog(@"参数不合法,无法执行字串数字操作");
        return self;
    }
    
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:selfStr];
    NSDecimalNumber *calcuationNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];
    
    NSDecimalNumber *result = nil;
    if (CalculationAdding == type) {
        result = [selfNumber decimalNumberByAdding:calcuationNumber withBehavior:handler];
    }else if (CalculationSubtracting == type){
        result = [selfNumber decimalNumberBySubtracting:calcuationNumber withBehavior:handler];
    }else if (CalculationMultiplying == type){
        result = [selfNumber decimalNumberByMultiplyingBy:calcuationNumber withBehavior:handler];
    }else if (CalculationDividing == type){
        result = [selfNumber decimalNumberByDividingBy:calcuationNumber withBehavior:handler];
    }
    
    // 设置的精度
    short scale =  [handler scale];// 小数保留几位
    //    [PSCDecimalNumberHandler defaultStringNumberHandler];
    // 如果自定义了结果格式化工具使用自定义formatter
    NSNumberFormatter *numberFormatter = handler.numberFormatter?:PSCDecimalNumberFormatter((NSUInteger)scale,handler.formatterStyle);
    return [numberFormatter stringFromNumber:result];
}
@end
