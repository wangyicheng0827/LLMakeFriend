//
//  NSString+Extension.m
//  RepairEnterprises
//
//  Created by MrXir on 16/8/8.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString *)downToTheMinute
{
    if (self.length >= 2) {
        return [self substringToIndex:MAX(0, self.length - 2 - 1)];
    }
    
    return self;
}

- (NSString *)downToTheDay
{
    if (self.length >= 8) {
        return [self substringToIndex:MAX(0, self.length - 8 - 1)];
    }
    
    return self;
}

- (NSString *)md5_32_lower
{
    NSUInteger length = 16;
    
    const char *cString = [self UTF8String];
    
    unsigned char result[length];
    
    CC_MD5(cString, (unsigned)strlen(cString), result);
    
    NSMutableString *md5key = [NSMutableString string];
    
    for (int i=0; i<length; i++) {
        
        [md5key appendFormat:@"%02x", result[i]];
    }
    
    return md5key;
}

- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe
{
    if (!self.length) return CGRectZero;
    
    CGSize maxSize = CGSizeMake(vectorframe.size.width, CGFLOAT_MAX);
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary *attributes = @{NSFontAttributeName: vectorFont,
                                 NSParagraphStyleAttributeName: style};
    
    CGRect rect = [self boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
    
    rect.size.height += 16;
    
    return rect;
}

- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe effectiveHeight:(BOOL)isEffectiveHeight
{
    if (!self.length) return CGRectZero;
    
    CGSize maxSize = CGSizeZero;
    
    if (isEffectiveHeight) {
        maxSize = CGSizeMake(vectorframe.size.width, CGFLOAT_MAX);
    } else {
        maxSize = CGSizeMake(CGFLOAT_MAX, vectorframe.size.height);
    }
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary *attributes = @{NSFontAttributeName: vectorFont,
                                 NSParagraphStyleAttributeName: style};
    
    CGRect rect = [self boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
    
    if (isEffectiveHeight) {
        rect.size.height = floorf(rect.size.height) + 24;
    } else {
        rect.size.width += floorf(rect.size.width) + 24;
    }
    
    return rect;
    
}

- (CGRect)stringRectWithVectorFont:(UIFont *)vectorFont vectorFrame:(CGRect)vectorframe effectiveHeight:(BOOL)isEffectiveHeight extraWidthOrHeight:(CGFloat)extra
{
    if (!self.length) return CGRectZero;
    
    CGSize maxSize = CGSizeZero;
    
    if (isEffectiveHeight) {
        maxSize = CGSizeMake(vectorframe.size.width, CGFLOAT_MAX);
    } else {
        maxSize = CGSizeMake(CGFLOAT_MAX, vectorframe.size.height);
    }
    
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    
    NSDictionary *attributes = @{NSFontAttributeName: vectorFont,
                                 NSParagraphStyleAttributeName: style};
    
    CGRect rect = [self boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
    
    if (isEffectiveHeight) {
        rect.size.height = ceilf(rect.size.height) + extra;
    } else {
        rect.size.width += ceilf(rect.size.width) + extra;
    }
    
    return rect;
    
}

- (NSString *)filterStringWithCharacterSetString:(NSString *)string
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    
    // Intermediate
    NSMutableString *numberString = [NSMutableString string];
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:string];
    
    NSString *tempStr = [NSString string];
    
    while (![scanner isAtEnd]) {
        
        // Throw away characters before the first number.
        [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
        
        // Collect numbers.
        [scanner scanCharactersFromSet:numbers intoString:&tempStr];
        
        [numberString appendString:tempStr];
        
        tempStr = @"";
    }
    
    // Result.
    
    return numberString;
}

- (NSString *)scanPureDigital
{
    NSScanner *scanner = [NSScanner scannerWithString:self];
    
    // Intermediate
    NSMutableString *numberString = [NSMutableString string];
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    NSString *tempStr;
    
    while (![scanner isAtEnd]) {
        
        // Throw away characters before the first number.
        [scanner scanUpToCharactersFromSet:numbers intoString:NULL];
        
        // Collect numbers.
        [scanner scanCharactersFromSet:numbers intoString:&tempStr];
        
        if (tempStr) {
            [numberString appendString:tempStr];
        }
        
        
        tempStr = @"";
    }
    
    // Result.
    
    return numberString;
}

- (NSString *)formatMobile
{
    NSString *mobile = [self scanPureDigital];
    
    if (mobile.length == 11) {
        
        return mobile;
        
    } else {
        
        if (mobile.length == 13) {
            
            NSString *frontThree = [mobile substringToIndex:3];
            
            if ([frontThree isEqualToString:@"861"]) {
                mobile = [mobile substringWithRange:NSMakeRange(2, 11)];
            }
            
            return mobile;
            
        } else {
            
            return nil;
            
        }
    }
}

////////////////////////////
////////////////////////////
- (CGRect)boundingRectWithFont:(UIFont *)font frame:(CGRect)frame CalculateOption:(CalculateOption)option
{
    if (!self.length) {
        return [@"|" boundingRectWithFont:font frame:frame CalculateOption:option];
    } else {
        
        NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        [style setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{NSFontAttributeName: font,
                                     NSParagraphStyleAttributeName: style};
        
        CGSize maxSize = CGSizeZero;
        
        CGRect boundingRect = CGRectZero;
        
        if (option == CalculateOptionWidth) {
            maxSize = CGSizeMake(CGFLOAT_MAX, frame.size.height);
            boundingRect = [self boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
            boundingRect.size.width += ceilf(boundingRect.size.width);
            
        } else {
            maxSize = CGSizeMake(frame.size.width, CGFLOAT_MAX);
            boundingRect = [self boundingRectWithSize:maxSize options:opts attributes:attributes context:nil];
            boundingRect.size.height = ceilf(boundingRect.size.height);
        }
        
        return boundingRect;
        
    }
    
}

////////////////////////////
////////////////////////////


@end


@implementation NSArray (ArrayFilter)

- (NSArray *)filterWithObjectForKey:(NSString *)key withConditionContainValue:(NSString *)value
{
    NSString *format = [NSString stringWithFormat:@"SELF['%@'] CONTAINS %@", key, value];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format];
    return [self filteredArrayUsingPredicate:predicate];
}

- (NSArray *)filterWithObjectForKey:(NSString *)key withConditionEqualToValue:(NSNumber *)value
{
    NSString *format = [NSString stringWithFormat:@"SELF['%@'] = %@", key, value];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format];
    return [self filteredArrayUsingPredicate:predicate];
}

@end


