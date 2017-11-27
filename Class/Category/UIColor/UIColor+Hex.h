//
//  UIColor+Hex.h
//  StickyCollectionView
//
//  Created by Bogdan Matveev on 08.12.15.
//  Copyright © 2015 Bogdan Matveev. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPieRandColor [UIColor colorWithRed:arc4random() % 255 / 255.0f green:arc4random() % 255 / 255.0f blue:arc4random() % 255 / 255.0f alpha:1.0f]


@interface UIColor(Hex)

+ (UIColor *)colorFromHexString:(NSString *)hexString;



+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha;

+ (NSArray *)satisfactionColors;

+ (NSArray *)whetherColors;


// 主题蓝色
+ (UIColor *)themeBlueColor;

+ (UIColor *)themeButtonBlueTintColor;

// 主题灰色
+ (UIColor *)themeGrayColor;

// 主题不可用颜色
+ (UIColor *)themeDisabledColor;

// 主题字体颜色
+ (UIColor *)themeTextColor;

@end
