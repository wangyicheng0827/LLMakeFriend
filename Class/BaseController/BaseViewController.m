//
//  BaseViewController.m
//  CarFile
//
//  Created by MrXir on 16/5/11.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "BaseViewController.h"

#import "MRBarButtonItemView.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoadForAWhile
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.alpha = 1;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self viewDidLoadForAWhile];
    });
    
    /*
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:NULL];
    
    UIFont *font = [UIFont systemFontOfSize:15.0f weight:UIFontWeightThin];
    
    NSDictionary *attributes = @{NSFontAttributeName:font};
    
    [back setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    self.navigationItem.backBarButtonItem = back;
     */
    
    __weak typeof(self) _self = self;
    
    if (![self.navigationController.viewControllers.firstObject isEqual:self]) {
        
        MRBarButtonItemView *pop = [MRBarButtonItemView viewWithPopView];
        [pop.popButton didTouchUpInsideComplectionBlock:^(UIButton *button) {
            [_self.navigationController popViewControllerAnimated:YES];
        }];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:pop];
        item.style = UIBarButtonItemStyleDone;
        self.navigationItem.leftBarButtonItem = item;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        
    }


}

- (void)didClickBackItemButton:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.view.alpha = 0;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
    if (idiom == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    [self.view endEditing:YES];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"0"]) {
        return NO;
    } else {
        return YES;
    }
}

- (void)didClickDismissItem:(UIBarButtonItem *)item
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)shouldShowDismissItemWithController:(UIViewController *)viewControllerToPresent
{
    BaseNavigationController *nc = (id)viewControllerToPresent;
    
    if ([nc isKindOfClass:[BaseNavigationController class]]) {
        
        if (nc.showPopButton == YES) {
            
            if (nc.topViewController.navigationItem.leftBarButtonItem == nil) {
                
                UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(didClickDismissItem:)];
                nc.topViewController.navigationItem.leftBarButtonItem = item;
            }
            
        }
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self shouldShowDismissItemWithController:segue.destinationViewController];
    
    [super prepareForSegue:segue sender:sender];
}


- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    [self shouldShowDismissItemWithController:viewControllerToPresent];
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
