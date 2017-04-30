//
//  ZDzhaoHuViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "ZDzhaoHuViewController.h"
#import "sendMealCollectionViewController.h"
#import "huLiCollectionViewController.h"
#import "footCollectionViewController.h"
#import "peiHuCollectionViewController.h"

@interface ZDzhaoHuViewController ()

@end

@implementation ZDzhaoHuViewController
- (IBAction)sendMeal:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    sendMealCollectionViewController *vc = [[sendMealCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)huLi:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    huLiCollectionViewController *vc = [[huLiCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)yiYang:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    peiHuCollectionViewController *vc = [[peiHuCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)zuDao:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    footCollectionViewController *vc = [[footCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)bianLiDian:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"照护站点";
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

@end
