//
//  NSString+Change.m
//  PaiXu
//
//  Created by mike on 16/11/1.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "NSString+Change.h"

@implementation NSString (Change)

- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, false);
    return mutableString;
}

- (NSString *)getFirstChar {
    
    if ([self isEqualToString:@""] || self == nil) {
        
        return @"#";
    }
    NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
    NSRange userNameRange = [[[self transformToPinyin] substringWithRange:NSMakeRange(0, 1)] rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound) {
        return @"#";
    }
    return [[self transformToPinyin] substringWithRange:NSMakeRange(0, 1)];
}

@end
