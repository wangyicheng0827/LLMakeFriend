//
//  HomeViewController.m
//  LLMakeFriend
//
//  Created by xiaoqi on 2017/11/25.
//  Copyright © 2017年 佳鹤  陈. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeCell.h"

#import "HomeDetialViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//}
//
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:YES];
//    
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"爱活吧交友";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
}

#pragma mark -- tableviewDelegate --

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cell";
    
    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeDetialViewController * homeDetial = [[HomeDetialViewController alloc]initWithNibName:@"HomeDetialViewController" bundle:nil];
    
    homeDetial.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:homeDetial animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
