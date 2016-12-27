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
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 101:
        {
            [self alertForWait];
        }
            break;
        case 102:
        {
            [self alertForWait];
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
            [self alertForWait];
        }
            break;
        case 105:
        {
            [self alertForWait];
        }
            break;
        case 106:
        {
            [self alertForWait];
        }
            break;
        case 107:
        {
            [self alertForWait];
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
