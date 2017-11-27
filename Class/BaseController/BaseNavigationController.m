//
//  BaseNavigationController.m
//  CarFile
//
//  Created by MrXir on 16/5/11.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解决自定义返回按钮后滑动手势失效的问题
    self.interactivePopGestureRecognizer.delegate = nil;
//    self.navigationBar.translucent = FALSE;
}

+ (void)initialize
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor themeBlueColor]];
    //修改标题字体颜色及大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([self.topViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.topViewController supportedInterfaceOrientations];
    } else {
        UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
        if (idiom == UIUserInterfaceIdiomPad) {
            return UIInterfaceOrientationMaskAll;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
}
@end
