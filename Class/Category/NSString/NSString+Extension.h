//
//  NSString+Extension.h
//  RepairEnterprises
//
//  Created by MrXir on 16/8/8.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CommonCrypto/CommonCryptor.h>

#import <CommonCrypto/CommonDigest.h>

#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (NSString *)downToTheMinute;

- (NSString *)downToTheDay;

- (NSString *)md5_32_lower;

/**
 *  @author MrXir, 16-09-21 19:09
 *
 *  @brief 计算字体和载体计算文本在载体中需要的文本Frame.
 *
 *  @param vectorFont  载体的字体
 *  @param vectorframe 载体的Frame
 *
 *  @return 文本所需Frame
 */
- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe;

/**
 *  @author MrXir, 16-09-21 19:09
 *
 *  @brief 计算字体和载体计算文本在载体中需要的文本Frame.
 *
 *  @param vectorFont           载体的字体
 *  @param vectorframe          载体的Frame
 *  @param isEffectiveHeight    如果YES则计算高度，否则计算宽度
 *
 *  @return 文本所需Frame
 */
- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe effectiveHeight:(BOOL)isEffectiveHeight;

- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe effectiveHeight:(BOOL)isEffectiveHeight extraWidthOrHeight:(CGFloat)extra;

- (NSString *)scanPureDigital;

- (NSString *)filterStringWithCharacterSetString:(NSString *)string;

- (NSString *)formatMobile;

////////////////////////////
////////////////////////////

typedef NS_ENUM(NSUInteger, CalculateOption) {
    CalculateOptionWidth,
    CalculateOptionHeight,
};

/**
 返回字符串的边界
 
 @param font 当前字符串使用的字体
 @param frame 当前字符串的显示范围
 @param option 计算宽度或者高度选项
 @return CGRect
 */
- (CGRect)boundingRectWithFont:(UIFont *)font frame:(CGRect)frame CalculateOption:(CalculateOption)option;

////////////////////////////
////////////////////////////

@end

@interface NSArray (ArrayFilter)

- (NSArray *)filterWithObjectForKey:(NSString *)key withConditionEqualToValue:(NSNumber *)value;
- (NSArray *)filterWithObjectForKey:(NSString *)key withConditionContainValue:(NSString *)value;

@end

