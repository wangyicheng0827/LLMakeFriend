//
//  NSBundle+Extension.m
//  CarFile
//
//  Created by MrXir on 16/5/12.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)

- (__kindof UIView *)instanceViewWithNibName:(NSString *)name identifier:(NSString *)identifier
{
    __block UIView *result = nil;
    [[self loadNibNamed:name owner:self options:nil] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([[obj restorationIdentifier] isEqualToString:identifier]) {
            result = obj;
            *stop = YES;
        }
    }];
    return result;
}

- (NSDictionary *)plistDictionaryWithFileName:(NSString *)name
{
    return [NSDictionary dictionaryWithContentsOfFile:[self pathForResource:name ofType:@"plist"]];
}

- (__kindof UIView *)firstViewWithNibName:(NSString *)name
{
    return [[NSBundle mainBundle] loadNibNamed:name owner:nil options:0].firstObject;
}

@end
