//
//  adviceVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "adviceVC.h"

@interface adviceVC ()

@end

@implementation adviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)subBtnClicked:(id)sender {
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"提交" message:@"提交成功" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [vc addAction:act];
    [vc addAction:act1];
    [self.navigationController pushViewController:vc animated:YES];
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
