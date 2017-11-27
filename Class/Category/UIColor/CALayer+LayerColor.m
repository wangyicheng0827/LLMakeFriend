//
//  CALayer+LayerColor.m
//  InfoPlatformPro
//
//  Created by xiaoqi on 16/9/23.
//  Copyright © 2016年 loveseven. All rights reserved.
//

#import "CALayer+LayerColor.h"

@implementation CALayer (LayerColor)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
     self.borderColor = color.CGColor;
}

@end
