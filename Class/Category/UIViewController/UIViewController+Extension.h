//
//  UIViewController+Extension.h
//  CarFile
//
//  Created by MrXir on 16/5/12.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const MainStoryboard;

@interface UIViewController (Extension)

+ (id)entranceControllerWithStoryboardName:(NSString *)name;

+ (id)instanceControllerWithStoryboardName:(NSString *)name;

+ (id)instanceControllerInMainStoryboard;



@end

FOUNDATION_EXPORT NSString * const NSStringWithHappy(void);

