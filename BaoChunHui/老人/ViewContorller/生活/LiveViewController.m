//
//  LiveViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "LiveViewController.h"
#import "buyFoodTableViewController.h"
#import "shangChengVC.h"
#import "SCBaoJieController.h"
#import "SCWeixiuViewController.h"
#import "SCCommunityViewController.h"
#import "MiShuViewController.h"



@interface LiveViewController ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)ChooseModule:(UIControl *)sender {
    switch (sender.tag) {
        case 100:
        {
            buyFoodTableViewController *vc = [[buyFoodTableViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 101:
        {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            SCBaoJieController *vc = [[SCBaoJieController alloc] initWithCollectionViewLayout:layout];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 102:
        {
            SCWeixiuViewController *vc = [[SCWeixiuViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 103:
        {
            shangChengVC *vc = [[shangChengVC alloc] initWithViewContorllerType:ViewControllerType_shangCheng];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 104:
        {
            [self alertView];
        }
            break;
        case 105:
        {
            [self alertView];
        }
            break;
        case 106:
        {
            MiShuViewController *vc = [[MiShuViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 107:
        {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            SCCommunityViewController *vc = [[SCCommunityViewController alloc] initWithCollectionViewLayout:layout];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 108:
        {
            [self alertForWait];
        }
            break;
        default:
            break;
    }
}


- (void)alertForWait{
    [self.timer invalidate];
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"非常抱歉" message:@"暂未开放，敬请期待" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertC animated:YES completion:^{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 block:^(NSTimer * _Nonnull timer) {
            [alertC dismissViewControllerAnimated:YES completion:^{
                [self.timer invalidate];
                self.timer = nil;
            }];
        } repeats:NO];
    }];
    
}

- (void)alertView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拨打电话" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"10008" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了拨打电话");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
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
