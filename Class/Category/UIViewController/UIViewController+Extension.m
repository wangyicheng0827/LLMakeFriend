//
//  UIViewController+Extension.m
//  CarFile
//
//  Created by MrXir on 16/5/12.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "UIViewController+Extension.h"

NSString * const MainStoryboard = @"Main";

@implementation UIViewController (Extension)

+ (id)entranceControllerWithStoryboardName:(NSString *)name
{
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController];
}

+ (id)instanceControllerWithStoryboardName:(NSString *)name
{
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
}

+ (id)instanceControllerInMainStoryboard
{
    return [self instanceControllerWithStoryboardName:MainStoryboard];
}

@end
