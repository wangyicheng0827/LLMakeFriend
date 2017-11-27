//
//  BaseNavigationControllerWithDismissItem.m
//  CarFile
//
//  Created by Seven on 2017/1/7.
//
//

#import "BaseNavigationControllerWithDismissItem.h"

#import "MRBarButtonItemView.h"

#import "UIButton+Extension.h"

@interface BaseNavigationControllerWithDismissItem ()

@end

@implementation BaseNavigationControllerWithDismissItem

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        [self addDismissItem];
    }
    return self;
}

- (void)addDismissItem
{
    
    MRBarButtonItemView *dismiss = [MRBarButtonItemView viewWithDismissView];
    [dismiss.dismissButton didTouchUpInsideComplectionBlock:^(UIButton *button) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:dismiss];
    item.style = UIBarButtonItemStyleDone;
    [self topViewController].navigationItem.leftBarButtonItem = item;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
