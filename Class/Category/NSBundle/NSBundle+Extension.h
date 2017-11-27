//
//  NSBundle+Extension.h
//  CarFile
//
//  Created by MrXir on 16/5/12.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface NSBundle (Extension)

- (__kindof UIView *)instanceViewWithNibName:(NSString *)name identifier:(NSString *)identifier;

- (NSDictionary *)plistDictionaryWithFileName:(NSString *)name;

- (__kindof UIView *)firstViewWithNibName:(NSString *)name;

@end
