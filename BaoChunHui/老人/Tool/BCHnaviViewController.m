//
//  BCHnaviViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BCHnaviViewController.h"

@interface BCHnaviViewController ()

@end

@implementation BCHnaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:33],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
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
