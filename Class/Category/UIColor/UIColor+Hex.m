//
//  UIColor+Hex.m
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 08.12.15.
//  Copyright © 2015 Bogdan Matveev. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor(Hex)

+ (NSArray *)satisfactionColors
{
    //  int color[] = new int[]{Color.rgb(118, 111, 253), Color.rgb(255, 176, 93), Color.rgb(229, 105, 106)};
    
    return @[[UIColor colorWithR:118 G:111 B:253 A:1],
             [UIColor colorWithR:255 G:176 B:93 A:1],
             [UIColor colorWithR:229 G:105 B:106 A:1]];
}

+ (NSArray *)whetherColors
{
    // int color[] = new int[]{Color.rgb(175, 238, 238), Color.rgb(255, 182, 193)};
    return @[[UIColor colorWithR:175 G:238 B:238 A:1],
             [UIColor colorWithR:255 G:182 B:193 A:1]];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    
    if (![hexString isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    alpha = 1.0f;
    red   = [self colorComponentFrom: colorString start: 0 length: 2];
    green = [self colorComponentFrom: colorString start: 2 length: 2];
    blue  = [self colorComponentFrom: colorString start: 4 length: 2];
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+ (UIColor *)themeBlueColor
{
    return [UIColor colorWithR:85 G:130 B:233 A:1];
}

+ (UIColor *)themeButtonBlueTintColor
{
    return [UIColor colorWithR:0 G:122 B:244 A:1];
}

+ (UIColor *)themeGrayColor
{
    return [UIColor lightGrayColor];
}

+ (UIColor *)themeDisabledColor
{
    return [UIColor colorWithR:233 G:233 B:233 A:1];
}

+ (UIColor *)themeTextColor
{
    return [UIColor darkGrayColor];
}



@end
