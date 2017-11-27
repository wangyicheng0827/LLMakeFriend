//
//  RootViewController.m
//  CarFile
//
//  Created by MR on 2017/1/6.
//
//

#import "RootViewController.h"

#import "BaseNavigationController.h"

#import "HomeViewController.h"

#import "FindViewController.h"

#import "AddViewController.h"

#import "NewsViewController.h"

#import "MineViewController.h"

#import "DHGuidePageHUD.h"

#import "MRAPPInfo.h"

#import "QKTabBar.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*// 首页
    HomeViewController *hoVc = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    hoVc.navigationItem.title = @"爱活吧交友";

    UIImage *img0 = [UIImage imageNamed:@"tabBar_home.png"];
    UIImage *img_selected0 = [UIImage imageNamed:@"tabBar_home_click.png"];
    img0 = [img0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img_selected0 = [img_selected0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    hoVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                    image:img0
                                            selectedImage:img_selected0];
    BaseNavigationController *hoNc = [[BaseNavigationController alloc] initWithRootViewController:hoVc];

    // 档案
    FindViewController *arVc = [[FindViewController alloc] initWithNibName:@"FindViewController" bundle:nil];
    arVc.title = @"附近的人";

    UIImage *img = [UIImage imageNamed:@"tabBar_find.png"];
    UIImage *img_selected = [UIImage imageNamed:@"tabBar_find_click.png"];
    img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img_selected = [img_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    arVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现"
                                                    image:img
                                            selectedImage:img_selected];
    BaseNavigationController *arNc = [[BaseNavigationController alloc] initWithRootViewController:arVc];

    // 企业
    NewsViewController *reVc = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
    reVc.title = @"消息";

    UIImage *img1 = [UIImage imageNamed:@"tabBar_news.png"];
    UIImage *img_selected1 = [UIImage imageNamed:@"tabBar_news_click.png"];
    img1 = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img_selected1 = [img_selected1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    reVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息"
                                                    image:img1
                                            selectedImage:img_selected1];
    BaseNavigationController *reNc = [[BaseNavigationController alloc] initWithRootViewController:reVc];


    // 我的
    MineViewController *myVc = [[MineViewController alloc] initWithNibName:@"MineViewController" bundle:nil];
    myVc.title = @"个人中心";

    UIImage *img2 = [UIImage imageNamed:@"tabBar_me.png"];
    UIImage *img_selected2 = [UIImage imageNamed:@"tabBar_me_click.png"];
    img2 = [img2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img_selected2 = [img_selected2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    myVc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                    image:img2
                                            selectedImage:img_selected2];
    BaseNavigationController *myNc = [[BaseNavigationController alloc] initWithRootViewController:myVc];

    self.viewControllers = @[hoNc, arNc, reNc, myNc];*/
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildVc:[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil] title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[FindViewController alloc] initWithNibName:@"FindViewController" bundle:nil] title:@"发现" image:@"tabBar_find" selectedImage:@"tabBar_find_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil] title:@"消息" image:@"tabBar_news" selectedImage:@"tabBar_news_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[MineViewController alloc] initWithNibName:@"MineViewController" bundle:nil] title:@"我的" image:@"tabBar_me" selectedImage:@"tabBar_me_click" isHiddenNavgationBar:NO];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
    [self setCustomtabbar];
}
#pragma mark - 设置自定义中心按钮
- (void)setCustomtabbar{
    QKTabBar *tabbar = [[QKTabBar alloc]init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"点击的item:%ld title:%@", item.tag, item.title);
}

#pragma mark - 自定义中心按钮相应方法
- (void)centerBtnClick:(UIButton *)btn{
    
    AddViewController * addVC = [[AddViewController alloc]initWithNibName:@"AddViewController" bundle:nil];
    
    BaseNavigationController * nav = [[BaseNavigationController alloc]initWithRootViewController:addVC];
    
    [self presentViewController:nav animated:YES completion:nil];
//    [nav.navigationController pushViewController:addVC animated:YES];
}

- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden
{
    static NSInteger index = 0;
    
    vc.navigationItem.title = title;

    vc.tabBarItem.title = title;
    
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    vc.tabBarItem.tag = index;
    
    index++;
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    
    if (isHidden) {
        nav.navigationBar.hidden = YES;
    }
    [self addChildViewController:nav];
}

// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([self.selectedViewController respondsToSelector:@selector(supportedInterfaceOrientations)]) {
        return [self.selectedViewController supportedInterfaceOrientations];
    } else {
        UIUserInterfaceIdiom idiom = [[UIDevice currentDevice] userInterfaceIdiom];
        if (idiom == UIUserInterfaceIdiomPad) {
            return UIInterfaceOrientationMaskAll;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    }
    
}

+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor themeBlueColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end

