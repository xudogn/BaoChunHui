//
//  healthViewController.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "healthViewController.h"
#import "ChuiHuiReXianVC.h"
#import "WenYiShiPinVC.h"

@interface healthViewController ()

@end

@implementation healthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)JiuYiPeiHu:(id)sender {
}

- (IBAction)ChuiHuiReXian:(id)sender {
    ChuiHuiReXianVC *vc = [[ChuiHuiReXianVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)WenYiShiPin:(id)sender {
    WenYiShiPinVC *vc = [[WenYiShiPinVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)JianKangShiPin:(id)sender {
}

- (IBAction)JianKangGuangBo:(id)sender {
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:52 g:213 b:198 alpha:1];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
