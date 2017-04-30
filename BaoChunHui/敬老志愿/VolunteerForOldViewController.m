//
//  VolunteerForOldViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "VolunteerForOldViewController.h"
#import "AppDelegate.h"
#import "ViewController.h"

@interface VolunteerForOldViewController ()

@end

@implementation VolunteerForOldViewController
- (IBAction)jueSeChange:(id)sender {
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainModule"];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"敬老志愿";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:33],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    [UINavigationBar appearance].translucent = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
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
